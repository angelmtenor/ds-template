# Generic Template for Data Science Projects based on py-pkgs

[![python](https://img.shields.io/badge/python-%5E3.12-blue)]()

This cookiecutter `ds-template` is a customized modification of  [py-pkgs-cookiecutter](https://github.com/py-pkgs/py-pkgs-cookiecutter) for data science projects, mainly adding the following features:
- Development Container with pre-configured tools: Conda, Poetry and Git
- Makefile with commands for installation, testing, qa, etc.
- Complete pre-commit yaml for code formatting and qa


`py-pkgs-cookiecutter` is a [`cookiecutter`](https://cookiecutter.readthedocs.io/en/latest/) template for creating a fully-featured Python package using [`poetry`](https://python-poetry.org). It supplements the [Python Packages book](https://py-pkgs.org) by Tomas Beuzen and Tiffany Timbers but can be used independently.

## Usage

Please refer to the [documentation](https://py-pkgs-cookiecutter.readthedocs.io/en/latest/) for more detail on using `py-pkgs-cookiecutter`. We provide the fundamental steps below:

1. Install [`cookiecutter`](https://cookiecutter.readthedocs.io/en/latest/):

    ```bash
    pip install cookiecutter
    ```

2. Generate a Python package structure:

    ```bash
    cookiecutter https://github.com/angelmtenor/ds_template.git
    ```

3. After responding to the prompts you should have a directory structure similar to that shown below. To learn more about the contents of this directory structure, please refer to the reference `py-pkgs-cookiecutter` [documentation](https://py-pkgs-cookiecutter.readthedocs.io/en/latest/).

```text
├── CHANGELOG.md
├── CONDUCT.md
├── CONTRIBUTING.md
├── .devcontainer
│   ├── devcontainer.json
│   └── Dockerfile
├── Dockerfile
├── docs
│   ├── changelog.md
│   ├── conduct.md
│   ├── conf.py
│   ├── contributing.md
│   ├── index.md
│   ├── make.bat
│   ├── Makefile
│   ├── requirements.txt
│   └── usage.ipynb
├── .gitignore
├── LICENSE
├── Makefile
├── notebooks_dev
│   └── pkg_dev.ipynb
├── .pre-commit-config.yaml
├── pyproject.toml
├── README.md
├── .readthedocs.yml
├── src
│   └── my_pkg
│       ├── __init__.py
│       ├── logger.py
│       └── pkg.py
├── styleguide.md
└── tests
    ├── conftest.py
    ├── __pycache__
    └── test_pkg.py
```

4. Open the `README.md` created in the new structure and refer to the **Installation in Dev / Editor modeMode** Section


## License

The original `py-pkgs-cookiecutter` was created by Tomas Beuzen and Tiffany Timbers. It is licensed under the terms of the BSD license.
This modified version of `py-pkgs-cookiecutter` was created by Angel Martinez-Tenor.

## Acknowledgements
Original `py-pkgs-cookiecutter`: https://github.com/py-pkgs/py-pkgs-cookiecutter

`py-pkgs-cookiecutter` was originally developed for use in the University of British Columbia's (UBC) `Master of Data Science`_ program (MDS). It was inspired by the pyOpenSci `cookiecutter` [template](https://github.com/pyOpenSci/cookiecutter-pyopensci).
