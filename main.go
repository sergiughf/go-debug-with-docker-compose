package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func main() {
	log.Println("Starting Go Debug With Docker Compose Server...")

	http.HandleFunc("/", func(writer http.ResponseWriter, request *http.Request) {
		message := `{"message":"Debugging go binaries within containers is cool!"}`

		writer.Header().Set("Content-Type", "application/json")
		writer.WriteHeader(http.StatusOK)

		_, _ = writer.Write([]byte(message))
	})

	if err := http.ListenAndServe(fmt.Sprintf(":%s", os.Getenv("PORT")), nil); err != nil {
		log.Fatalf("There's an error with the server: %v", err)
	}
}
