.dev: ## Start development server
	docker compose --profile dev up --build

.prod: ## Start production server
	docker compose --profile production up -d --build

.stop: ## Stop all containers
	docker compose --profile dev --profile production down

.logs: ## View logs
	docker compose logs -f

.clean: ## Clean up containers and images
	docker compose --profile dev --profile production down -v
	docker system prune -f

.help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

help: .help
dev: .dev
prod: .prod
stop: .stop
logs: .logs
clean: .clean
