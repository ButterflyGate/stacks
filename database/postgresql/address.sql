CREATE TABLE IF NOT EXISTS "address" (
    "id" INT NOT NULL,
    "post_code" VARCHAR(10),
    "prefecture" VARCHAR(64),
    "city" VARCHAR(64),
    "line" VARCHAR(64),
    "address" VARCHAR(128),
    CONSTRAINT "fk_address" PRIMARY KEY ("id")
);
