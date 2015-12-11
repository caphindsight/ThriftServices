.PHONY: build clean

build: clean
	thrift -gen hs Piphia.thrift
	thrift -gen py Piphia.thrift
	mv gen-py/Piphia/Piphia-remote gen-py/piphia
	ghc -O0 -o piphiad Server.hs Piphia_Impl.hs gen-hs/*.hs
	ghc -O0 -o piphia  Client.hs gen-hs/*.hs

clean:
	rm -f *.hi *.o piphiad piphia
	rm -rf gen-*
