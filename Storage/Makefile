.PHONY: build clean

build:
	thrift -gen csharp Storage.thrift
	thrift -gen py Storage.thrift
	mv gen-py/Storage/StorageService-remote gen-py/remote
	dmcs -t:library -out:StorageService.dll -r:Thrift.dll gen-csharp/StorageService/*.cs
	dmcs -t:exe -out:StorageServer.exe -r:StorageService.dll -r:Thrift.dll StorageServer.cs

clean:
	rm -rf gen-*
	rm -f StorageService.dll StorageServer.exe

