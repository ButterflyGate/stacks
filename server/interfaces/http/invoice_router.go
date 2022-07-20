package http

import (
	"net/http"
	"stacks/domain/entity"
	presentation "stacks/interfaces/presentation/HTTPRespose"

	"github.com/go-chi/chi/v5"
)

type InvoiceInformationBuilder interface {
	Build() []byte
}

func (s *HTTPServer) addInvoiceRouter() {
	s.routers.Get("/{id}", getInvoice())
}

func getInvoice() func(w http.ResponseWriter, r *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {
		invoiceID := chi.URLParam(r, "id")
		src := entity.Invoice{}

		w.Write(append(presentation.FormatInvoiceToJson(src), []byte(invoiceID)...))
	}
}
