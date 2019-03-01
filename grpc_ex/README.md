# gRPC example

Quick steps to build gRPC client/server.

1. Install `grpc` and `grpc-tools` gems

2. Create protobuff file describing request and response semantics

```proto

syntax = "proto3";

message HelloRequest {
    string content = 1;
}

message HelloResponse {
    string content = 1;
}

service GrpcEx {
    rpc Hello(HelloRequest) returns (HelloResponse);
}

```

3. Generate the source code based on defined data structure

```
$ grpc_tools_ruby_protoc -I ./grpc_ex --ruby_out=grpc_ex --grpc_out=grpc_ex grpc_ex/grpc_ex.proto
```

`--ruby_out` generates Ruby code in DST_DIR

4. Server handler must be inhereted from `Coolio::Service` and implement an interface described in `.proto`
