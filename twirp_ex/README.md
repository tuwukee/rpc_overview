# Twirp example

Quick steps to build twirp client/server.

https://github.com/twitchtv/twirp-ruby/wiki/Code-Generation

1. Run `brew install protobuf`

2. Install `go` and run `go get github.com/twitchtv/twirp-ruby/protoc-gen-twirp_ruby`

3. Add gem `twirp` to Gemfile and run `bundle install`

4. Create protobuff file describing request and response semantics

```proto

syntax = "proto3";

message HelloRequest {
    string content = 1;
}

message HelloResponse {
    string content = 1;
}

service TwirpEx {
    rpc Hello(HelloRequest) returns (HelloResponse);
}

```

5. Generate the source code based on defined data structure

```
$ protoc --proto_path=./twirp_ex --ruby_out=./twirp_ex --twirp_ruby_out=./twirp_ex ./twirp_ex/twirp_ex.proto
```
