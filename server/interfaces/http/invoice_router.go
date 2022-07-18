package http

import (
	"net/http"

	"github.com/go-chi/chi/v5"
)

func addInvoiceRouter(r *chi.Mux) {
	r.Get("{id}", func(w http.ResponseWriter, r *http.Request) {
		invoiceID := chi.URLParam(r, "id")

	})
}
