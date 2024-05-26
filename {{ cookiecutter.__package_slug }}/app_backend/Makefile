setup:: # Ensure that the Python wheel package (.whl file) for your project is located in this directory before proceeding.
	@echo "Generate Environment"
	conda create -n {{ cookiecutter.__package_slug }} python={{ cookiecutter.python_version }} -y && conda activate {{ cookiecutter.__package_slug }}
	pip install -r requirements.txt

run:: # Setup Required
	@echo "Running App - Environment required"
	python app_entrypoint.py

run-container::  # Docker Required. No setup required
	@echo "Running Backend Container"
	docker build -t {{ cookiecutter.__package_slug }} .
	docker run -p 8000:8000 {{ cookiecutter.__package_slug }}
