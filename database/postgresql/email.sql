
CREATE TABLE IF NOT EXISTS "email" (
    "id" INTEGER NOT NULL,
    "address" VARCHAR(128) NOT NULL,
    CONSTRAINT "pk_email"
        PRIMARY KEY ("id"),
    CONSTRAINT "uq_email_address"
        UNIQUE ("address")
);
