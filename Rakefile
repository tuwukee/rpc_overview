# frozen_string_literal: true

$LOAD_PATH.push(File.expand_path(File.dirname(__FILE__)))

require "grpc_ex/server/instance"
require "grpc_ex/client/instance"
require "twirp_ex/server/instance"
require "twirp_ex/client/instance"
require "thrift_ex/server/instance"
require "thrift_ex/client/instance"

desc "Start gRPC server"
task :grpc_server do
  puts("Start gRPC server")
  server = GrpcEx::Server::Instance.new
  server.run
end

desc "Start gRPC client"
task :grpc_client do
  puts("Start gRPC client")
  client = GrpcEx::Client::Instance.new(GrpcEx::Server::Instance::DEFAULT_HOST)
  response = client.hello("heeey")
  puts("Received: #{response.inspect}")
  client.consume do |msg|
    puts("Received: #{msg.inspect}.")
  end
end

desc "Start Twirp server"
task :twirp_server do
  puts("Start Twirp server")
  server = TwirpEx::Server::Instance.new
  server.run
end

desc "Start Twirp client"
task :twirp_client do
  puts("Start Twirp client")
  host = "http://#{TwirpEx::Server::Instance::DEFAULT_HOST}"
  client = TwirpEx::Client::Instance.new(host)
  response = client.hello("heeey")
  puts("Received: #{response.inspect}")
  response = client.consume
  puts("Received: #{response.inspect}")
end

desc "Start Thrift server"
task :thrift_server do
  puts("Start Thrift server")
  puts ThriftEx::Server::Instance::DEFAULT_HOST
  server = ThriftEx::Server::Instance.new
  server.run
end

desc "Start Thrift client"
task :thrift_client do
  puts("Start Thrift client")
  puts ThriftEx::Server::Instance::DEFAULT_HOST
  client = ThriftEx::Client::Instance.new(ThriftEx::Server::Instance::DEFAULT_HOST)
  client.open_transport
  response = client.hello("heeey")
  puts("Received: #{response.inspect}")
  response = client.consume
  puts("Received: #{response.inspect}")
  client.close_transport
end
