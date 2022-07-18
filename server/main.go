package main

import (
	"stacks/config"
	"stacks/interfaces/http"
)

func main() {
	config := config.NewConfig()
	server := http.NewHTTPServer(config)

	server.Run()
}
