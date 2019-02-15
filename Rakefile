# frozen_string_literal: true

$LOAD_PATH.push(File.expand_path(File.dirname(__FILE__)))

require "grpc_ex/server/instance"

desc "Start gRPC server"
task :grpc_server do
  puts "START GRPC SERVER"
  GrpcEx::Server::Instance.run
end

desc "Start gRPC client"
task :grpc_client do
  puts "START GRPC CLIENT"
end
