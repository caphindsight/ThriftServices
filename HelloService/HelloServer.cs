using System;
using System.Net;
using System.Net.Sockets;
using Thrift;
using Thrift.Transport;
using Thrift.Server;

namespace HelloService {
    public sealed class HelloServiceImpl : HelloService.Iface {
        private static readonly Random random = new Random();
        private bool enabled = true;

        private T Return<T>(Func<T> f) {
            if (enabled) {
                return f();
            } else {
                throw new ServiceDisabledException();
            }
        }

        public HelloResponse Greet(HelloRequest req) => Return(() =>
            new HelloResponse() {
                Greeting = "Hello, " + req.Name + "!"
            }
        );

        public byte[] GenerateRandom(int len) => Return(() => {
            byte[] res = new byte[len];
            random.NextBytes(res);
            return res;
        });

        public void Shutdown() {
            Environment.Exit(17);
        }

        public void Enable(bool enabled) {
            this.enabled = enabled;
        }

        public bool Enabled() {
            return enabled;
        }
    }

    public static class HelloServer {
        public static void Main(string[] args) {
            var impl = new HelloServiceImpl();
            var proc = new HelloService.Processor(impl);
            var listener = new TcpListener(IPAddress.Parse("0.0.0.0"), 9050);
            var transport = new TServerSocket(listener);
            var server = new TThreadPoolServer(proc, transport);
            server.Serve();
        }
    }
}