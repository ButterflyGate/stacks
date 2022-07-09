CREATE TABLE IF NOT EXISTS 'company' (
	'id' INTEGER NOT NULL,
	'name' VARCHAR(32) NOT NULL,
	'ceo' INTEGER default NULL,
	'address_id' INTEGER NOT NULL,
	'parent_company' INTEGER DEFAULT NULL,
	'is_deleted' BOOLEAN DEFAULT FALSE NOT NULL,
	CONSTRAINT 'pk_company'
		PRIMARY KEY 'id',
	CONSTRAINT 'fk_company_ceo'
		FOREIGN KEY 'ceo'
		REFERENCES 'person' ('id')
		ON DELETE SET DEFAULT
		ON UPDATE CASCADE,
	CONSTRAINT 'fk_company_address'
		FOREIGN KEY 'address_id'
		REFERENCES 'address' ('id')
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
);

