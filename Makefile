.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'




.PHONY: db-start
db-start: ## database 起動
	docker-compose up -f container/docker-compose.yaml postgres

db-create: ## database image 作成。 password の設定。
	docker-compose -f container/docker-compose.yaml build \
	--build-arg PSWD=test \
	postgres


MIGRATE_CMD = createdb --username=kyota --echo stacks
migrate:
	docker compose exec postgres ${MIGRATE_CMD}




