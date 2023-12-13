install-go:
	@./install-go.sh

setup-tools:
	@./install-tools.sh
	@GOFLAGS=-mod=mod go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
	@GOFLAGS=-mod=mod go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest