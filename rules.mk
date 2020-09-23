

main: build/$(OS)-$(ARCH)/main
	cp $< $@

build/linux-amd64/main: go.mod go.sum main.go  
	env GOTRACEBACK=none CGO_ENABLED=0 GOARCH=amd64 GOOS=linux go build -trimpath -ldflags "-w -s" -o $@ 

build/darwin-amd64/main: go.mod go.sum main.go  
	env GOTRACEBACK=none CGO_ENABLED=0 GOARCH=amd64 GOOS=darwin go build -trimpath -ldflags "-w -s" -o $@ 

build/linux-arm7/main: go.mod go.sum main.go  
	env GOTRACEBACK=none CGO_ENABLED=0 GOARM=7 GOARCH=arm GOOS=linux go build -trimpath -ldflags "-w -s" -o $@ 
dist/linux-amd64.tar.gz: $(addprefix build/linux-amd64/,$(TARGETS))
	mkdir -p dist
	tar -czf $@ -C build/linux-amd64 .
dist/darwin-amd64.tar.gz: $(addprefix build/darwin-amd64/,$(TARGETS))
	mkdir -p dist
	tar -czf $@ -C build/darwin-amd64 .
dist/linux-arm7.tar.gz: $(addprefix build/linux-arm7/,$(TARGETS))
	mkdir -p dist
	tar -czf $@ -C build/linux-arm7 .
