# Generic Template for Data Science Projects based on py-pkgs

[![python](https://img.shields.io/badge/python-%5E3.8-blue)]()

This cookiecutter is a customized modification of  [py-pkgs-cookiecutter](https://github.com/py-pkgs/py-pkgs-cookiecutter) for data science projects. `py-pkgs-cookiecutter` is a [`cookiecutter`](https://cookiecutter.readthedocs.io/en/latest/) template for creating a fully-featured Python package using [`poetry`](https://python-poetry.org). It supplements the [Python Packages book](https://py-pkgs.org) by Tomas Beuzen and Tiffany Timbers but can be used independently.

## Usage

Please refer to the [documentation](https://py-pkgs-cookiecutter.readthedocs.io/en/latest/) for more detail on using `py-pkgs-cookiecutter`. We provide the fundamental steps below:

1. Install [`cookiecutter`](https://cookiecutter.readthedocs.io/en/latest/):

    ```bash
    pip install cookiecutter
    ```

2. Generate a Python package structure using [`cookiecutter-ds-generic`](https://github.com/angelmtenor/ds_template.git):

    ```bash
    cookiecutter https://github.com/angelmtenor/ds_template.git
    ```

3. After responding to the prompts you should have a directory structure similar to that shown below. To learn more about the contents of this directory structure, please refer to the reference `py-pkgs-cookiecutter` [documentation](https://py-pkgs-cookiecutter.readthedocs.io/en/latest/).

    ```text
    pkg
    ├── .github                    ┐
    │   └── workflows              │ GitHub Actions workflow
    │       └── ci-cd.yml          ┘
    ├── .gitignore                 ┐
    ├── .readthedocs.yml           │
    ├── CHANGELOG.md               │
    ├── CONDUCT.md                 │
    ├── CONTRIBUTING.md            │
    ├── docs                       │
    │   ├── make.bat               │
    │   ├── Makefile               │
    │   ├── requirements.txt       │
    │   ├── changelog.md           │
    │   ├── conduct.md             │
    │   ├── conf.py                │ Package documentation
    │   ├── contributing.md        │
    │   ├── index.md               │
    │   └── usage.ipynb            │
    ├── LICENSE                    │
    |── README.md                  |
    ├── styleguide.md            (NEW)
    ├── pyproject.toml             ┐
    ├── src                        │
    │   └── pkg                    │ Package source code, metadata,
    │       ├── __init__.py        │ and build instructions
    │       └── pkg.py             |
    ├── .pre-commit-config.yaml  (NEW)
    ├── notebooks_dev            (NEW)
    ├── Dockerfile               (NEW)
    └── tests                      ┐
        └── test_pkg.py            ┘ Package tests
    ```

4. Open the `README.md` created in the new structure and refer to the **Installation Dev / Edior Mode** Section


## License

The original `py-pkgs-cookiecutter` was created by Tomas Beuzen and Tiffany Timbers. It is licensed under the terms of the BSD license.
This modified version of `py-pkgs-cookiecutter` was created by Angel Martinez-Tenor.

## Acknowledgements
Original `py-pkgs-cookiecutter`: https://github.com/py-pkgs/py-pkgs-cookiecutter

`py-pkgs-cookiecutter` was originally developed for use in the University of British Columbia's (UBC) `Master of Data Science`_ program (MDS). It was inspired by the pyOpenSci `cookiecutter` [template](https://github.com/pyOpenSci/cookiecutter-pyopensci).
