# frozen_string_literal: true

$LOAD_PATH.push(File.expand_path(File.dirname(__FILE__)))

require "grpc_ex/server/instance"
require "grpc_ex/client/processor"

desc "Start gRPC server"
task :grpc_server do
  GrpcEx::Server::Instance.run
end

desc "Start gRPC client"
task :grpc_client do
  processor = GrpcEx::Client::Processor.new(GrpcEx::Server::Instance::DEFAULT_HOST)
  processor.hello("heeey")
  processor.run
end
