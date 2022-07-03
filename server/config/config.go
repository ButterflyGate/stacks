package config

import (
	"fmt"
	"os"
	"strconv"
)

type Config struct {
	Database
}

func NewConfig() *Config {
	c := new(Config)
	c.Database = *NewDatabase()

	return c
}

func GetEnv(key, def string) string {
	v := os.Getenv(key)
	if v == "" {
		v = def
	}
	return v
}

func GetEnvInt(key string, def int) int {
	vString := os.Getenv(key)
	v, err := strconv.Atoi(vString)
	if err != nil {
		fmt.Fprintf(os.Stderr, "cannot convert %s to int, use default %d: %v", vString, def, err)
		v = def
	}
	return v
}
