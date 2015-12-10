.PHONY: build clean remote
build: HelloServer.exe hello-client remote
clean:
	rm -f HelloService.dll *.exe hello-client HelloClient.hi HelloClient.o
	rm -rf gen-*

remote: gen-py
	mv gen-py/HelloService/HelloService-remote gen-py/

gen-py: HelloService.thrift
	thrift -gen py HelloService.thrift

gen-csharp: HelloService.thrift
	thrift -gen csharp HelloService.thrift

gen-hs: HelloService.thrift
	thrift -gen hs HelloService.thrift

HelloService.dll: gen-csharp
	dmcs -t:library -out:HelloService.dll -r:Thrift.dll gen-csharp/HelloService/*.cs

HelloServer.exe: HelloServer.cs HelloService.dll
	dmcs -t:exe -out:HelloServer.exe -r:Thrift.dll -r:HelloService.dll HelloServer.cs

hello-client: HelloClient.hs gen-hs
	ghc --make gen-hs/*.hs HelloClient.hs -o hello-client
