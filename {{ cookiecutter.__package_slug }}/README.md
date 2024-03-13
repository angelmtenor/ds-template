# {{ cookiecutter.__package_slug }}

{{ cookiecutter.package_short_description }}

[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)<br>

## Installation in Dev / Editor mode

**Step 0: Setting Up Your Development Environment**

**Prerequisites**: We recommend using a Debian/Ubuntu Machine, VM, or container for optimal compatibility.

This step is a one-time setup that applies to all data science projects. You'll need to create or use a machine with Conda, Git, and Poetry installed. The configuration should closely match the one defined in `.devcontainer/Dockerfile`.

Here are some key points about this setup:

- The Dockerfile is configured with a non-root user. This allows the same setup to be used on a WSL Ubuntu Machine or any Debian/Ubuntu Cloud Machine (e.g., Vertex AI workbench, Azure VM).
- If you're using an Ubuntu/Debian machine with a non-root user (like Ubuntu in WSL or Vertex AI VM), you can install the necessary tools from the "non-root user" section of the Dockerfile. You may need to use `sudo apt-get install <software>` for some installations.
- If you're using a pre-configured Cloud VM, it likely already has Git and Conda installed, so you can skip those installation steps.
- For a quick setup, you can directly use the development container defined in `.devcontainer/Dockerfile` (Docker is required for this). In Visual Studio Code, open the root folder of this repo, press `F1`, and select **Dev Containers: Open Workspace in Container**. The container will open the same workspace after the Docker Image is built.


**Step 1**. Enter to the root path of the repo and use or create a new conda environment for development:

```bash
conda create -n dev python=3.11 -y && conda activate dev
```

**Step 2**. Install all dependencies and the package in editor mode, initialize the repository, and perform quality assurance (pre-commit):

```bash
make
```

**Step 3**. Link the local repository to the cloud repository. For example:
```bash
git remote add origin https://github.com/angelmtenor/ds_template.git
git branch -M main
git push -u origin main
```

### Before committing


Manual pre-commit  - Complete set of checks (slow):
```bash
make qa
```
Manual pre-commit  - Reduced set of checks (fast):
```bash
make qa-fast
```
Automatic pre-commit hooks (advanced, not recommended for fast development):
```bash
pre-commit install
```
## Installation for Fast Evaluation Usage. Read only - Packaged previously created in dev environment (poetry build)


```bash
conda create -n {{ cookiecutter.__package_slug }} python=3.11 -y && conda activate {{ cookiecutter.__package_slug }}
pip install dist/{{ cookiecutter.__package_slug }}-0.1.0-py3-none-any.whl
```


## Usage

- TODO (explain the usage of the package). Refer to `Makefile` for execution (e.g., `make run-demo`).

## Contributing

Check out the contributing guidelines

## License

`{{ cookiecutter.__package_slug }}` was created by {{ cookiecutter.author_name }}. {% if cookiecutter.open_source_license != 'None' -%}It is licensed under the terms of the {{ cookiecutter.open_source_license }} license.{% else %}{{ cookiecutter.author_name }} retains all rights to the source and it may not be reproduced, distributed, or used to create derivative works.{% endif %}

## Credits

`{{ cookiecutter.__package_slug }}` originated from [Angel Martinez-Tenor's Data Science Template](https://github.com/angelmtenor/ds-template), which itself was developed based on the [py-pkgs-cookiecutter template](https://github.com/py-pkgs/py-pkgs-cookiecutter)

