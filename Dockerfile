FROM mcr.microsoft.com/powershell:6.2.0-alpine-3.8
ENV PROTOC_VERSION=3.7.1
RUN curl -o proto.zip -sL https://github.com/google/protobuf/releases/download/v${PROTOC_VERSION}/protoc-${PROTOC_VERSION}-linux-x86_64.zip
RUN unzip proto.zip
RUN mv bin/protoc /usr/bin/
RUN mv include/* /usr/include/
