CREATE TABLE IF NOT EXISTS "person" (
    "id" INTEGER NOT NULL,
    "full_name" VARCHAR(32) NOT NULL,
    "family_name" VARCHAR(16) DEFAULT NULL,
    "given_name" VARCHAR(16) DEFAULT NULL,
    "gender" boolean NOT NULL,
    "phone_id" INTEGER DEFAULT NULL,
    "email_id" INTEGER DEFAULT NULL,
    "address_id" INTEGER DEFAULT NULL,
    CONSTRAINT "pk_person"
        PRIMARY KEY ("id"),
    CONSTRAINT "fk_person_phone"
        FOREIGN KEY ("phone_id")
        REFERENCES "phone" ("id")
        ON DELETE SET DEFAULT
        ON UPDATE SET DEFAULT,
    CONSTRAINT "fk_person_email"
        FOREIGN KEY ("email_id")
        REFERENCES "email" ("id")
        ON DELETE SET DEFAULT
        ON UPDATE SET DEFAULT,
    CONSTRAINT "fk_person_address"
        FOREIGN KEY ("address_id")
        REFERENCES "address" ("id")
        ON DELETE SET DEFAULT
        ON UPDATE SET DEFAULT
);

CREATE TABLE IF NOT EXISTS "person_address" (
    "person_id" INTEGER NOT NULL,
    "address_id" INTEGER NOT NULL,
    "memo" VARCHAR(128) DEFAULT NULL,
    CONSTRAINT "pk_jt_person_address" 
        PRIMARY KEY (
        "person_id",
        "address_id"
        ),
    CONSTRAINT "fk_jt_person_address_person"
        FOREIGN KEY ("person_id")
        REFERENCES "person" ("id")
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT "fk_jt_person_address_address"
        FOREIGN KEY ("address_id")
        REFERENCES "address" ("id")
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS "person_email" (
    "person_id" INTEGER NOT NULL,
    "email_id" INTEGER NOT NULL,
    "memo" VARCHAR(128) DEFAULT NULL,
    CONSTRAINT "pk_jt_person_email"
        PRIMARY KEY (
            "person_id",
            "email_id"
        ),
    CONSTRAINT "fk_jt_person_email_person"
        FOREIGN KEY ("person_id")
        REFERENCES "person" ("id")
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT "fk_jt_person_email_email"
        FOREIGN KEY ("email_id")
        REFERENCES "email" ("id")
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS "person_phone" (
    "person_id" INTEGER NOT NULL,
    "phone_id" INTEGER NOT NULL,
    "memo" VARCHAR(128) DEFAULT NULL,
    CONSTRAINT "pk_jt_person_phone"
        PRIMARY KEY (
            "person_id",
            "phone_id"
        ),
    CONSTRAINT "fk_jt_person_phone_person"
        FOREIGN KEY ("person_id")
        REFERENCES "person" ("id")
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT "fk_jt_person_phone_phone"
        FOREIGN KEY ("phone_id")
        REFERENCES "phone" ("id")
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
