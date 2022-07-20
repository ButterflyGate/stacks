package repository

import "stacks/domain/entity"

type InvoiceRepository interface {
	Find(entity.InvoiceID) entity.Invoice
}
