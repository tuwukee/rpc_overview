# frozen_string_literal: true

require "twirp_ex/twirp_ex_twirp"

module TwirpEx
  module Client
    class Instance
      attr_reader :stub, :client_id

      def initialize(host)
        @stub = TwirpExClient.new(host)
        @client_id = "Twirp-client-#{SecureRandom.hex}"
      end

      def hello(str)
        hello_request = HelloRequest.new(content: str)
        stub.hello(hello_request)
      end

      # twirp can't into streams :(
      def consume
        consume_request = ConsumeRequest.new(client: client_id)
        stub.consume(consume_request)
      end
    end
  end
end
