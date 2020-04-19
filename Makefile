MODULE := templ_app

CYAN='\033[0;36m'
NOCOLOR='\033[0m'

run:
	@docker-compose up

local-run:
	@python3 -m $(MODULE)

bash:
	@docker-compose run app bash

local-test:
	@pytest tests/

test:
	@docker-compose run app pytest -sq

lint:
	@printf "%b${CYAN}Running pylint...${NOCOLOR}\n"
	@pylint --rcfile=pyproject.toml **/*.py

clean:
	@docker system prune -f
	@rm -rf .pytest_cache .coverage .pytest_cache coverage.xml
