CREATE TABLE IF NOT EXISTS 'person' (
    'id' int primary key,
    'family_name' varchar,
    'given_name' varchar,
    'full_name' varchar,
    'gender' boolean,
    'phone_id' int,
    'email_id' int,
    'address_id' int,
    FOREIGN KEY ('phone_id') REFERENCES 'phone' ('id')
    FOREIGN KEY ('email_id') REFERENCES 'email' ('id')
    FOREIGN KEY ('address_id') REFERENCES 'address' ('id')
)

CREATE TABLE IF NOT EXISTS 'person_address' (
    'person_id' int,
    'address_id' int,
    'memo' varchar,
    FOREIGN KEY ('person_id') REFERENCES 'person' ('id')
    FOREIGN KEY ('address_id') REFERENCES 'address' ('id')
)

CREATE TABLE IF NOT EXISTS 'person_email' (
    'person_id' int,
    'email_id' int,
    'memo' varchar,
    FOREIGN KEY ('person_id') REFERENCES 'person' ('id')
    FOREIGN KEY ('email_id') REFERENCES 'email' ('id')
)

CREATE TABLE IF NOT EXISTS 'person_phone' (
    'person_id' int,
    'phone_id' int,
    'memo' varchar,
    FOREIGN KEY ('person_id') REFERENCES 'person' ('id')
    FOREIGN KEY ('phone_id') REFERENCES 'phone' ('id')
)
