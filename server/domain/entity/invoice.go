package entity

type InvoiceID string

type Invoice struct {
	ID       InvoiceID
	Amount   int
	Claimant *Company
	Payee    *Company
}

func NewInvoice(id InvoiceID, amount int, claimant, payee *Company) *Invoice {
	return &Invoice{
		ID:       id,
		Amount:   amount,
		Claimant: claimant,
		Payee:    payee,
	}
}
