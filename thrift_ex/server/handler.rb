# frozen_string_literal: true

require "thrift_ex/gen-rb/thrift_ex"

module ThriftEx
  module Server
    class Handler
      def hello(request)
        puts("Received: #{request.inspect}")
        HelloResponse.new(content: "hello #{request.content}")
      end

      def consume(request)
        puts("Received: #{request.inspect}")
        Message.new(timestamp: Time.now.to_i, content: "Yo")
      end
    end
  end
end
