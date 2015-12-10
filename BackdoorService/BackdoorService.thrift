namespace csharp BackdoorService

struct ExecResponse {
    1:  required i32            ExitCode;
    2:  optional string         StdOut;
    3:  optional string         StdErr;
}

service BackdoorService {
    ExecResponse Exec(1: string program, 2: list<string> arguments, 3: string stdin);
}
