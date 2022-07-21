CREATE TABLE IF NOT EXISTS "invoice" (
	"id" INTEGER NOT NULL,
	"claimant" INTEGER NOT NULL,
	"payer" INTEGER NOT NULL,
	"quotation_id" INTEGER DEFAULT NULL,
	"amount" INTEGER NOT NULL,
	"due_at" TIME without time zone NULL,
	"paid_date" TIME without time zone NULL,
	"created_at" timestamp NOT NULL,
	"updated_at" timestamp NOT NULL,
	CONSTRAINT "pk_invoice"
		PRIMARY KEY ("id"),
	-- CONSTRAINT "fk_invoice_quotation"
	-- 	FOREIGN KEY "quotation_id"
	-- 	REFERENCES "quotation" ("id")
	-- 	ON DELETE RESTRICT
	-- 	ON UPDATE CASCADE,
	CONSTRAINT "fk_invoice_claimant"
		FOREIGN KEY ("claimant")
		REFERENCES "company" ("id")
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
	CONSTRAINT "fk_invoice_payer"
		FOREIGN KEY ("payer")
		REFERENCES "company" ("id")
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS "invoice_product" (
	"invoice_id" INTEGER NOT NULL,
	"product_id" INTEGER NOT NULL,
	"quantity" FLOAT NOT NULL,
	"subtotal" FLOAT NOT NULL,
	"tax" FLOAT NOT NULL,
	CONSTRAINT "pk_jt_invoice_product"
		PRIMARY KEY ("invoice_id","product_id"),
	CONSTRAINT "fk_jt_invoice_product_invoice"
		FOREIGN KEY ("invoice_id")
		REFERENCES "invoice" ("id")
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT "fk_jt_invoice_product_product"
		FOREIGN KEY ("product_id")
		REFERENCES "product" ("id")
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);
