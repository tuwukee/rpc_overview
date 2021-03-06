# Code generated by protoc-gen-twirp_ruby 1.1.0, DO NOT EDIT.
require "twirp"
# require_relative 'twirp_ex_pb.rb'
require "grpc_ex/gen/grpc_ex_services_pb" # twirp_ex_pb is overriding the same google protobuf decription pool

class TwirpExService < Twirp::Service
  service "TwirpEx"
  rpc :Hello, HelloRequest, HelloResponse, :ruby_method => :hello
  rpc :Consume, ConsumeRequest, Message, :ruby_method => :consume
end

class TwirpExClient < Twirp::Client
  client_for TwirpExService
end
