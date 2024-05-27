setup::
	@echo "Setup Git and Gitflow"
	- git config --global init.defaultBranch main
	- git init
	- git flow init -d
	@echo "Installing Environment"
	poetry install --all-extras
	- git add .
	- SKIP=mypy,pylint,interrogate,jupyter-nb-clear-output pre-commit run --all-files

update::
	@echo "Updating Environment"
	poetry update
	pre-commit autoupdate

qa::
	@echo "Running complete QA"
	- mypy --install-types --non-interactive
	- pre-commit run --all-files

qa-fast::
	@echo "Running fast QA (skip: mypy, pylint & interrogate)"
	SKIP=mypy,pylint,interrogate pre-commit run --all-files


test::
	pytest --cov=src

clean::
	@if [ -s .\\.git\\hooks ]; then rmdir .\\.git\\hooks /q /s; fi
	@if [ -s poetry.lock ]; then rm poetry.lock; fi
	rm -rf .pytest_cache

get-features::
	git log --pretty=%B --grep="feat"

compress::
	zip -r archive.zip . -x "*.git*" -x "*.mypy*" -x "*/scenarios/*" -x "*log/*"  -x "*/__pycache__/*" -x "*.pytest_cache/*" -x "*/log/*"

build:
	@echo "Building Package and Updating in app backend"
	poetry build
	cp -f dist/*.whl app_backend/

run-backend::
	@echo "Running Backend App"
	cd app_backend && python app_entrypoint.py

run-backend-container:: build
	@echo "Running Backend Container"
	docker build -t {{ cookiecutter.__package_slug }} .
	docker run -p 8000:8000 {{ cookiecutter.__package_slug }}

# profile::
# 	python -m cProfile -o ./profile/output.pstats my_script.py && snakeviz ./profile/output.pstats
