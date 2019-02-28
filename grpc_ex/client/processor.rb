# frozen_string_literal: true

require "securerandom"
require "grpc_ex/client/instance"

module GrpcEx
  module Client
    class Processor
      attr_reader :host, :client, :consume_thread

      STOP_SIGNALS = %w[INT TERM].freeze
      KEEPALIVE = 20

      def initialize(host)
        @host = host
        @consume_thread = nil
        @client = GrpcEx::Client::Instance.new(host)
      end

      def run
        STOP_SIGNALS.each do |sig|
          Signal.trap(sig) do
            puts("gRPC events process: #{sig}")
            exit
          end
        end

        process

      rescue => e
        puts("Processor error: #{e.message}")
      end

      def run
        puts("Start gRPC client")
        consume
        keepalive
      end

      def hello(str)
        client.hello(str)
      end

      private

      def consume
        @consume_thread = Thread.new do
          begin
            client.consume do |msg|
              puts("Received: #{msg.inspect}.")
            end
          rescue StandardError => e
            puts("gRPC error: #{e.message}")
            puts(e.backtrace.join("\n"))
            nil
          end
        end
      end

      def keepalive
        loop do
          # TODO: pings
          sleep(KEEPALIVE)
        end
      end

      def process
        consume
        keepalive
      end
    end
  end
end
