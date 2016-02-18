using System;
using System.IO;
using System.Net;
using System.Net.Sockets;

using Thrift;
using Thrift.Transport;
using Thrift.Server;

using StorageService;

public sealed class StorageServiceImpl : StorageService.StorageService.Iface {
    public const int MaxDataSize = 2048;

    private string FileName(string key) => $"data/{key}.dat";

    public string Store(byte[] data) {
        if (data.Length > 0 && data.Length <= MaxDataSize) {
            string key = Guid.NewGuid().ToString();
            string file = FileName(key);

            File.WriteAllBytes(file, data);
            return key;
        } else if (data.Length == 0) {
            throw new StorageException() {
                Reason = "The data size is zero"
            };
        } else {
            throw new StorageException() {
                Reason = $"The maximal data size of {MaxDataSize} bytes was exceeded"
            };
        }
    }

    public byte[] Receive(string key) {
        string file = FileName(key);
        if (File.Exists(file)) {
            return File.ReadAllBytes(file);
        } else {
            throw new StorageException() {
                Reason = $"No data was found for key '{key}'"
            };
        }
    }
}

public static class StorageServer {
    public static void Main(string[] args) {
        var impl = new StorageServiceImpl();
        var proc = new StorageService.StorageService.Processor(impl);
        var listener = new TcpListener(IPAddress.Parse("0.0.0.0"), 9050);
        var transport = new TServerSocket(listener);
        var server = new TThreadPoolServer(proc, transport);
        server.Serve();
    }
}
