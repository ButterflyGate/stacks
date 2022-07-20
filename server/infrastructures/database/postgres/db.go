package postgres

import "database/sql"

type DBConfig interface {
	DSN() string
}

type DB struct {
	db   *sql.DB
	conf DBConfig
}

func NewDB(conf DBConfig) (*DB, error) {
	db := &DB{
		db:   &sql.DB{},
		conf: conf,
	}
	err := db.connect()
	if err != nil {
		// log
		return nil, err
	}

	return db, nil
}
