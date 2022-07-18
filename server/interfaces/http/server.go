package http

import (
	"fmt"
	"net/http"

	"github.com/go-chi/chi/v5"
)

type HTTPServerConfig interface {
	ListenPort() int
}

type HTTPServer struct {
	routers *chi.Mux
	addr    string
}

func NewHTTPServer(conf HTTPServerConfig) *HTTPServer {
	return &HTTPServer{
		routers: createRoutes(),
		addr:    fmt.Sprintf(":%d", conf.ListenPort()),
	}
}

func (s *HTTPServer) Run() {
	http.ListenAndServe(
		s.addr,
		s.routers,
	)
}

func createRoutes() *chi.Mux {
	root := chi.NewRouter()
	addInvoiceRouter(root)

	return root
}
