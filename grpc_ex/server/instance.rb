# frozen_string_literal: true

require "grpc"
require "grpc_ex/server/handler"

module GrpcEx
  module Server
    class Instance
      attr_reader :server

      DEFAULT_HOST = "localhost:2001"

      def initialize(host = DEFAULT_HOST)
        @server = GRPC::RpcServer.new
        server.add_http2_port(host, :this_port_is_insecure)
        server.handle(GrpcEx::Server::Handler)
      end

      def run
        server.run_till_terminated
      rescue => e
        puts "Server error: #{e}"
      end
    end
  end
end
