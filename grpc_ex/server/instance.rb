# frozen_string_literal: true

require "grpc"
require "grpc_ex/server/handler"

module GrpcEx
  module Server
    class Instance
      attr_reader :server

      DEFAULT_HOST = "127.0.0.1:2001"

      def self.run(host = DEFAULT_HOST)
        @server = GRPC::RpcServer.new
        @server.add_http2_port(host, :this_port_is_insecure)
        @server.handle(GrpcEx::Server::Handler)
        @server.run_till_terminated
      rescue => e
        puts "Server error: #{e}"
      end
    end
  end
end
