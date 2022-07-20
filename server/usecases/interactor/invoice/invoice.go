package invoice

import (
	"stacks/usecases/port/output/invoice"
	"stacks/usecases/repository"
)

type InvoiceInteractor struct {
	OutputPort invoice.InvoiceCreateOutputPort
	Repository repository.InvoiceRepository
}
