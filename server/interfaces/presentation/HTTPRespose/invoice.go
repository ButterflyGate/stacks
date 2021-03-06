package presentation

import (
	"encoding/json"
	"stacks/domain/entity"
)

type Invoice struct {
	InvoiceID    string         `json:"invoiceID"`
	CreatedAt    string         `json:"createdAt"`
	Payer        Payer          `json:"payer"`
	Claimant     Claimant       `json:"claimant"`
	QuotationID  string         `json:"quotationID"`
	DueDate      string         `json:"due-date"`
	TotalAmount  int            `json:"total-amount"`
	ChargeDetail []ChargeDetail `json:"charge-detail"`
}
type Payer struct {
	Name    string `json:"name"`
	Address string `json:"address"`
}
type Claimant struct {
	Name    string `json:"name"`
	Address string `json:"address"`
}
type ChargeDetail struct {
	Number      int    `json:"number"`
	Description string `json:"description"`
	Quantity    int    `json:"quantity"`
	Unit        string `json:"unit"`
	UnitPrice   int    `json:"unit-price"`
	Subtotal    int    `json:"subtotal"`
	Tax         int    `json:"tax"`
	Total       int    `json:"total"`
}

func FormatInvoiceToJson(src entity.Invoice) []byte {
	str := &Invoice{
		InvoiceID: string(src.ID),
		CreatedAt: "",
		Payer: Payer{
			Name:    src.Payee.Name,
			Address: "",
		},
		Claimant: Claimant{
			Name:    src.Claimant.Name,
			Address: "",
		},
		QuotationID:  "",
		DueDate:      "",
		TotalAmount:  src.Amount,
		ChargeDetail: []ChargeDetail{},
	}
	return str.json()
}

func (i *Invoice) json() []byte {
	v, err := json.Marshal(i)
	if err != nil {
		// TODO: log
		return []byte(err.Error())
	}
	return v
}
