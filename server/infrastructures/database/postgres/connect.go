package postgres

import (
	"database/sql"

	_ "github.com/lib/pq"
)

func (db *DB) connect() error {
	d, err := sql.Open("postgres", db.conf.DSN())
	if err != nil {
		// TODO: log
		return err
	}
	db.db = d
	return nil
}
