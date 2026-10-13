.DEFAULT_GOAL := help
SRC := src

## ──────────────────────────────────────────────
## Setup
## ──────────────────────────────────────────────

.PHONY: init
init: ## Create venv, pyproject.toml, and install all deps
	uv venv --python 3.10
	uv init && rm main.py

.PHONY: bootstrap
bootstrap: ## Install deps into existing venv
	uv add --requirements requirements.txt

.PHONY: install
install: ## Install deps into existing venv
	uv sync

clean:
	rm -rf .venv && rm .python-version uv.lock pyproject.toml