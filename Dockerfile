FROM golang:1.13 AS development-image

# Define current working directory
WORKDIR /go-debug-with-docker-compose

# Add sources
COPY . .

# Build dev dependencies
RUN make deps-dev
