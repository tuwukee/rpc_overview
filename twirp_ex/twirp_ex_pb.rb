# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: twirp_ex.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "HelloRequest" do
    optional :content, :string, 1
  end
  add_message "HelloResponse" do
    optional :content, :string, 1
  end
  add_message "Message" do
    optional :timestamp, :int64, 1
    optional :content, :string, 2
  end
  add_message "ConsumeRequest" do
    optional :client, :string, 1
  end
end

HelloRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("HelloRequest").msgclass
HelloResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("HelloResponse").msgclass
Message = Google::Protobuf::DescriptorPool.generated_pool.lookup("Message").msgclass
ConsumeRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("ConsumeRequest").msgclass
