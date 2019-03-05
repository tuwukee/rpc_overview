struct HelloRequest {
  1: string content;
}

struct HelloResponse {
  1: string content;
}

struct Message {
  1: i64 timestamps;
  2: string content;
}

struct ConsumeRequest {
  1: string client;
}

exception Exp {
}

service ThriftEx {

   HelloResponse hello(1:HelloRequest req);
   Message consume(1:ConsumeRequest req) throws (1: Exp e);

}