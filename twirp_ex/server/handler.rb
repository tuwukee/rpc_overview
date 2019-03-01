# frozen_string_literal: true

# require "twirp_ex/twirp_ex_pb"
require "grpc_ex/grpc_ex_services_pb" # twirp_ex_pb is overriding the same google protobuf decription pool
require "twirp_ex/twirp_ex_twirp"

module TwirpEx
  module Server
    class Handler
      def hello(request, _)
        puts("Received: #{request.inspect}")
        HelloResponse.new(content: "hello #{request.content}")
      end

      def consume(request, _)
        puts("Received: #{request.inspect}")
        Message.new(timestamp: Time.now.to_i, content: "Boom")
      end
    end
  end
end
