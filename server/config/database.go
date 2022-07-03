package config

import "fmt"

type Database struct {
	user string
	pass string
	host string
	port int
	name string
}

func NewDatabase() *Database {
	d := &Database{
		user: GetEnv("DB_USER", "postgres"),
		pass: GetEnv("DB_PASS", "postgres"),
		host: GetEnv("DB_HOST", "localhost"),
		port: GetEnvInt("DB_PORT", 5432),
		name: GetEnv("DB_NAME", "stacks"),
	}
	return d
}

func (d *Database) DSN() string {
	return fmt.Sprintf("postgresql://%s:%s@%s:%d/%s", d.user, d.pass, d.host, d.port, d.name)
}
