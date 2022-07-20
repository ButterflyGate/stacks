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
	// invoicePresenter InvoiceInformationBuilder
}

func NewHTTPServer(
	conf HTTPServerConfig,
	// invoicePresenter InvoiceInformationBuilder,
) *HTTPServer {
	httpServer := &HTTPServer{
		routers: chi.NewMux(),
		addr:    fmt.Sprintf(":%d", conf.ListenPort()),
		// invoicePresenter: invoicePresenter,
	}

	httpServer.buildRoutes()

	return httpServer
}

func (s *HTTPServer) Run() {
	http.ListenAndServe(
		s.addr,
		s.routers,
	)
}

func (s *HTTPServer) buildRoutes() {
	// root := chi.NewRouter()
	s.addInvoiceRouter()

}
