# frozen_string_literal: true

require "grpc_ex/grpc_ex_pb"
require "grpc_ex/grpc_ex_services_pb"

module GrpcEx
  module Server
    class Handler < GrpcEx::Service
      def hello(request, _)
        puts("Received: #{request.inspect}")
        HelloResponse.new(content: "hello #{request.content}")
      end

      def consume(request, _)
        puts("Received: #{request.inspect}")

        Enumerator.new do |en|
          loop do
            en << Message.new(timestamp: Time.now.to_i, content: "I don't know how to consume")
            sleep(5)
          end
        end
      end
    end
  end
end
