# Thrift example

Quick steps to build thrift client/server.

https://thrift.apache.org/tutorial/rb
https://diwakergupta.github.io/thrift-missing-guide/

1. Install Thrift

```
brew install thrift
```

2. Add gem `thrift` to Gemfile and run `bundle install`

3. Run

```
$ thrift -r --gen rb thrift_ex.thrift
```
