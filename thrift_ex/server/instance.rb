# frozen_string_literal: true

require "thrift_ex/server/handler"

module ThriftEx
  module Server
    class Instance
      attr_reader :server, :handler

      DEFAULT_HOST = "127.0.0.1:2003"
      STOP_SIGNALS = %w[INT TERM].freeze

      def initialize(host = DEFAULT_HOST)
        addr, port = host.split(":")
        @handler = ThriftEx::Server::Handler.new
        processor = Ex::ThriftEx::Processor.new(handler)
        transport = Thrift::ServerSocket.new(port)
        transportFactory = Thrift::BufferedTransportFactory.new
        @server = Thrift::SimpleServer.new(processor, transport, transportFactory)
      end

      def run
        STOP_SIGNALS.each do |sig|
          Signal.trap(sig) do
            puts("Thrift terminate: #{sig}")
            exit
          end
        end

        server.serve

      rescue => e
        puts("Error: #{e.message}")
      end
    end
  end
end
