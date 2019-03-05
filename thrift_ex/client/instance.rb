# frozen_string_literal: true

require "thrift_ex/gen-rb/thrift_ex"
require "securerandom"

module ThriftEx
  module Client # Client is reserved for a class name
    class Instance
      attr_reader :client, :transport, :client_id

      def initialize(host)
        addr, port = host.split(":")
        puts addr
        puts host
        @transport = Thrift::BufferedTransport.new(Thrift::Socket.new(addr, port))
        protocol = Thrift::BinaryProtocol.new(transport)
        @client = Ex::ThriftEx::Client.new(protocol)
        @client_id = "Thrift-client-#{SecureRandom.hex}"
      end

      def open_transport
        transport.open
      end

      def close_transport
        transport.close
      end

      def hello(str)
        hello_request = Ex::HelloRequest.new(content: str)
        client.hello(hello_request)
      end

      def consume
        consume_request = Ex::ConsumeRequest.new(client: client_id)
        client.consume(consume_request)
      end
    end
  end
end
