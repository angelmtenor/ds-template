# {{ cookiecutter.__package_slug }}

{{ cookiecutter.package_short_description }}

[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)<br>

## Installation in Dev / Editor mode

Note: A Debian/Ubuntu Machine, VM or container is highly recommended


**Step 0: One-time Machine setup only valid for all Data Science Projects**

Create or use a Machine with Conda, Git and Poetry as closely as defined in `.devcontainer/Dockerfile`:

- This Dockerfile contains a non-root user so the same configuration can be applied to a WSL Ubuntu Machine and any Debian/Ubuntu CLoud Machine (Vertex AI workbench, Azure VM ...)
- In case of having an Ubuntu/Debian machine with non-root user (e.g.: Ubuntu in WSL, Vertex AI VM ...), just install the tools from  "non-root user" (no sudo) section of the Dockerfile  (sudo apt-get install \<software\> may be required)
- A pre-configured Cloud VM usually has Git and Conda pre-installed, those steps can be skipped
- The development container defined in `.devcontainer/Dockerfile` can be directly used for a fast setup (Docker required).  With Visual Studio Code, just open the root folder of this repo, press `F1` and select the option **Dev Containers: Open Workspace in Container**. The container will open the same workspace after the Docker Image is built.


**Step 1**. Enter to the root path of the repo and use or create a new conda environment for development:

```bash
$ conda create -n dev python=3.11 -y && conda activate dev
```

**Step 2**. Install all the Dependencies and the package in editor mode:

```bash
$ make
```

**Step 3**. In case of a new repository (not cloned), initialize it:

```bash
$ git init .
```
and link it to the cloud repo. e.g.:
```bash
$ git remote add origin https://github.com/angelmtenor/ds_template.git
$ git branch -M main
$ git push -uf origin main
```

### Before committing

Automatic pre-commit hooks:
```bash
$ pre-commit install
```
Manual pre-commit hooks:
```bash
$ make qa
```

## Installation for Fast Evaluation Usage. Read only - Packaged previously created in dev environment (poetry build)


```bash
$ conda create -n {{ cookiecutter.__package_slug }} python=3.11 -y && conda activate {{ cookiecutter.__package_slug }}
$ pip install dist/{{ cookiecutter.__package_slug }}-0.1.0-py3-none-any.whl
```


## Usage

- TODO (explain the usage of the package)

## Contributing

Check out the contributing guidelines

## License

`{{ cookiecutter.__package_slug }}` was created by {{ cookiecutter.author_name }}. {% if cookiecutter.open_source_license != 'None' -%}It is licensed under the terms of the {{ cookiecutter.open_source_license }} license.{% else %}{{ cookiecutter.author_name }} retains all rights to the source and it may not be reproduced, distributed, or used to create derivative works.{% endif %}

## Credits

`{{ cookiecutter.__package_slug }}` originated from [Angel Martinez-Tenor's Data Science Template](https://github.com/angelmtenor/ds-template), which itself was developed based on the [py-pkgs-cookiecutter template](https://github.com/py-pkgs/py-pkgs-cookiecutter)

