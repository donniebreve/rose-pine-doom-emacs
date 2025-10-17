SOURCEPATH = .
TARGETPATH = ~/.config/doom/themes/

install:
	mkdir -p $(TARGETPATH)
	cp -uf $(SOURCEPATH)/*.el $(TARGETPATH)
