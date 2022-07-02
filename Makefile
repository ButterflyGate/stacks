





MIGRATE_CMD = createdb --username=kyota --echo stacks
migrate:
	docker compose exec postgres ${MIGRATE_CMD}




