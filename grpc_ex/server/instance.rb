# frozen_string_literal: true

require "grpc"
require "grpc_ex/server/handler"

module GrpcEx
  module Server
    class Instance
      attr_reader :server

      DEFAULT_HOST = "127.0.0.1:2001"
      STOP_SIGNALS = %w[INT TERM].freeze

      def initialize(host = DEFAULT_HOST)
        @server = GRPC::RpcServer.new
        @server.add_http2_port(host, :this_port_is_insecure)
        @server.handle(GrpcEx::Server::Handler)
      end

      def run
        STOP_SIGNALS.each do |sig|
          Signal.trap(sig) do
            puts("gRPC terminate: #{sig}")
            exit
          end
        end

        server.run_till_terminated

      rescue => e
        puts("Error: #{e.message}")
      end
    end
  end
end
