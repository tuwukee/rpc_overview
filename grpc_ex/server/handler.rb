# frozen_string_literal: true

# TODO: rethink signature

require "grpc_ex/grpc_ex_pb"
require "grpc_ex/grpc_ex_services_pb"

module GrpcEx
  module Server
    class Handler < GrpcEx::Service
      def publish
      end

      def ping
      end

      def ack
      end

      def consume
      end

      def unsubscribe
      end
    end
  end
end
