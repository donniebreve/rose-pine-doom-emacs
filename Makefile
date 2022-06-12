SOURCEPATH = .
TARGETPATH = ~/.doom.d/themes/

install:
	mkdir -p $(TARGETPATH)
	cp -uf $(SOURCEPATH)/*.el $(TARGETPATH)
