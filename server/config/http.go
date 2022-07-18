package config

type HTTP struct {
	port int
}

func NewHTTP() *HTTP {
	h := &HTTP{
		port: GetEnvInt("HTTP_LISTEN_PORT", 30000),
	}
	return h
}

func (h *HTTP) ListenPort() int {
	return h.port
}
