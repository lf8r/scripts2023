install-go:
	@./install-go.sh

setup-basic:
	@sudo apt -y install ssh net-tools && sudo /etc/init.d/ssh restart

setup-tools: install-go
	@./install-tools.sh
	@GOFLAGS=-mod=mod go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
	@GOFLAGS=-mod=mod go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

docker-clean:
	@./docker-save-images
	@-docker ps -aq | xargs docker stop | xargs docker rm
	@sudo service docker restart
	@docker system prune --all --force
	@docker system prune --volumes --force
	@docker load -i /var/tmp/allinone.tar


scrub: docker-clean
	@go clean -cache -modcache -testcache
	@sudo journalctl --rotate
	@sudo journalctl --vacuum-time=2days
	@rm -rf ~/.kube/cache/http/*
	@rm -rf ~/.kube/cache/discovery/*

setup-go-dev-environment: setup-basic setup-tools
