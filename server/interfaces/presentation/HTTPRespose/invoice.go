package presentation

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

func NewInvoice() *Invoice {
	return &Invoice{}
}
