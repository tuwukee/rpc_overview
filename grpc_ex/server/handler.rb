# frozen_string_literal: true

# TODO: rethink signature

require "grpc_ex/grpc_ex_pb"
require "grpc_ex/grpc_ex_services_pb"

module GrpcEx
  module Server
    class Handler < GrpcEx::Service
      def hello(request, _unused)
        puts("Received: #{request.inspect}")
        HelloResponse.new(content: "hello #{request.content}")
      end

      def consume(request, _unused)
        puts("Received: #{request.inspect}")
        [Message.new(timestamp: Time.now.to_i, content: "I don't know how to consume")]
      end
    end
  end
end
