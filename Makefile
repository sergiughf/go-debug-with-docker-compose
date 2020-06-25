.PHONY: deps deps-dev install

deps:
	@echo "Installing dependencies..."
	@go mod vendor -v

deps-dev:
	@echo "Installing CompileDaemon..."
	@go get -v -u github.com/githubnemo/CompileDaemon

	@echo "Installing the Go Debugger Dlv..."
	@go get -v -u github.com/go-delve/delve/cmd/dlv

install:
	@echo "Installing api binary..."
	@go install -v

debug:
	@echo "Running go debugger for api binary..."
	@dlv --listen=:4000 --headless --api-version=2 attach $(shell pidof go-debug-with-docker-compose)
