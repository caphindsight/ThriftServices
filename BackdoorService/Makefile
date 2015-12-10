.PHONY: build clean remote
build: clean BackdoorServer.exe remote backdoor
clean:
	rm -f BackdoorService.dll *.exe *.o *.hi backdoor
	rm -rf gen-*

remote: gen-py
	mv gen-py/BackdoorService/BackdoorService-remote gen-py/remote

gen-csharp: BackdoorService.thrift
	thrift -gen csharp BackdoorService.thrift

gen-py: BackdoorService.thrift
	thrift -gen py BackdoorService.thrift

gen-hs: BackdoorService.thrift
	thrift -gen hs BackdoorService.thrift

BackdoorService.dll: gen-csharp Thrift.dll
	dmcs -t:library -out:BackdoorService.dll -r:Thrift.dll gen-csharp/BackdoorService/*.cs

BackdoorServer.exe: BackdoorServer.cs BackdoorService.dll Thrift.dll
	dmcs -t:exe -out:BackdoorServer.exe -r:BackdoorService.dll -r:Thrift.dll BackdoorServer.cs

backdoor: BackdoorClient.hs gen-hs
	ghc --make gen-hs/*.hs BackdoorClient.hs -o backdoor
