setup:
	@echo "Installing Environment"
	poetry install --all-extras

qa:
	@echo "Running QA"
	pre-commit run --all-files

clean:
	@if [ -s .\\.git\\hooks ]; then rmdir .\\.git\\hooks /q /s; fi
	@if [ -s poetry.lock ]; then rm poetry.lock; fi
