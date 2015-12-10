// hello_service greets people!

namespace csharp HelloService

struct HelloRequest {
    1:  string Name;
}

struct HelloResponse {
    1:  string Greeting;
}

exception ServiceDisabledException {}

service HelloService {
    HelloResponse Greet(1: HelloRequest req) throws (1: ServiceDisabledException ouch);  // Greet a person
    binary GenerateRandom(1: i32 len) throws (1: ServiceDisabledException ouch);         // Generate a sequence of random bytes
    oneway void Shutdown();                    // Shutdown the service
    void Enable(1: bool enabled);
    bool Enabled();
}
