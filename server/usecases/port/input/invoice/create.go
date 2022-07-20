package invoice

import "stacks/domain/entity"

type InvoiceCreateInputPort interface {
	DownloadInvoice(entity.InvoiceID) entity.Invoice
	BulkDownloadInvoices([]entity.Invoice) []entity.Invoice
}
