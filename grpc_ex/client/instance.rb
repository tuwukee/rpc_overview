# frozen_string_literal: true

require "grpc_ex/grpc_ex_services_pb"

module GrpcEx
  module Client
    class Instance
      attr_reader :stub, :client_id

      def initialize(host)
        @stub = GrpcEx::Service.rpc_stub_class.new(host, :this_channel_is_insecure)
        @client_id = "gRPC-client-#{SecureRandom.hex}"
      end

      def hello(str)
        hello_request = HelloRequest.new(content: str)
        stub.hello(hello_request)
      end

      def consume(&block)
        consume_request = ConsumeRequest.new(client: client_id)
        stub.consume(consume_request).each do |response|
          block.call(response)
        end
      end
    end
  end
end