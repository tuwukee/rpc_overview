# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: grpc_ex.proto for package ''

require "grpc"
require "grpc_ex/gen/grpc_ex_services_pb"

module GrpcEx
  class Service

    include GRPC::GenericService

    self.marshal_class_method = :encode
    self.unmarshal_class_method = :decode
    self.service_name = "GrpcEx"

    rpc :Hello, HelloRequest, HelloResponse
    rpc :Consume, ConsumeRequest, stream(Message)
  end

  Stub = Service.rpc_stub_class
end
