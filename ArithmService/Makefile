.PHONY: build clean remote
build: clean remote arithmd
clean:
	rm -f *.hi *.o arithmd
	rm -rf gen-*

remote: gen-py
	mv gen-py/ArithmService/ArithmService-remote gen-py/remote

gen-py: ArithmService.thrift
	thrift -gen py ArithmService.thrift

gen-hs: ArithmService.thrift
	thrift -gen hs ArithmService.thrift

arithmd: ArithmServer.hs ArithmService_Impl.hs gen-hs
	ghc --make gen-hs/*.hs ArithmServer.hs ArithmService_Impl.hs -o arithmd
