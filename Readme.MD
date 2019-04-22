Initial objective was to try to implement a simple envoy xDS server for learning purpose. 

Given that gRPC and protobufs are used, thought it'd be easy to just generate the relevant C# code. Unfortunately, one of the dependencies specify v2 proto syntax, which C# generator does not support ( only v3 proto syntax are supported ). 

Nonetheless, the *.csproj can still serve as useful reference for it's usage of Grpc.Tools