export https_proxy=http://192.168.138.107:10081
curl -OL https://github.com/protocolbuffers/protobuf/releases/download/v3.14.0/protoc-3.14.0-linux-x86_64.zip
unzip -o protoc-3.14.0-linux-x86_64.zip -d ./tmp bin/protoc
rm -f protoc-3.14.0-linux-x86_64.zip


docker build -t go-npm-build:1.15.6-buster .
rm -rf tmp