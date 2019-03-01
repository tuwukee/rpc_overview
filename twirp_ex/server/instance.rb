# frozen_string_literal: true

require "rack"
require "webrick"
require "twirp_ex/server/handler"

module TwirpEx
  module Server
    class Instance
      attr_reader :server, :service, :handler

      DEFAULT_HOST = "127.0.0.1:2002"
      STOP_SIGNALS = %w[INT TERM].freeze

      def initialize(host = DEFAULT_HOST)
        @handler = TwirpEx::Server::Handler.new
        @service = TwirpExService.new(handler)
        addr, port = host.split(":")
        @server = WEBrick::HTTPServer.new(BindAddress: addr, Port: port)
      end

      def run
        STOP_SIGNALS.each do |sig|
          Signal.trap(sig) do
            puts("Twirp terminate: #{sig}")
            exit
          end
        end

        server.mount "/", Rack::Handler::WEBrick, service
        server.start

      rescue => e
        puts("Error: #{e.message}")
      end
    end
  end
end

