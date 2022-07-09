CREATE TABLE IF NOT EXISTS 'phone' (
    'id' INTEGER,
    'number' VARCHAR(13) NOT NULL,
    CONSTRAINT 'fk_phone'
        PRIMARY KEY 'id',
    CONSTRAINT 'uq_phone_number'
        UNIQUE KEY 'number',
);
