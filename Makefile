.DEFAULT_GOAL := help
SRC := src

## ──────────────────────────────────────────────
## Setup
## ──────────────────────────────────────────────

.PHONY: init
init: ## Create venv only (safe: does NOT run `uv init`, does not overwrite pyproject)
	uv venv --python 3.10
	@echo "Run 'make install' next."

.PHONY: bootstrap
bootstrap: ## Install deps into existing venv
	uv add --requirements requirements.txt

.PHONY: install
install: ## Sync deps into existing venv (safe, does not clobber pyproject)
	uv sync

.PHONY: notebook
notebook: ## Launch main teaching notebook
	uv run jupyter notebook PyBDSF_MIGHTEE.ipynb

clean:
	rm -rf .venv && rm .python-version uv.lock pyproject.toml