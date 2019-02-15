# gRPC example

Quick steps to build gRPC client/server

1. Create protobuff file describing request and response semantics

```proto

message CoolRequest {
    optional bool foo = 1;
}

message CoolResponse
{
    string bar = 9;
}

service Coolio {
    rpc Publish(CoolRequest) returns (CoolResponse);
}

```

2. Generate the source code based on defined data structure

```
$ grpc_tools_ruby_protoc -I ./grpc_ex --ruby_out=grpc_ex --grpc_out=grpc_ex grpc_ex/grpc_ex.proto
```

`--ruby_out` generates Ruby code in DST_DIR

3. Server handler must be inhereted from `Coolio::Service` and implement described in `.proto` interface
