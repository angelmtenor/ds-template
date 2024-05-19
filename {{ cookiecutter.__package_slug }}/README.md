# {{ cookiecutter.__package_slug }}

{{ cookiecutter.package_short_description }}

[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)<br>

## Installation in Dev / Editor mode

### Step 0: Setting Up Your Development Environment

**Prerequisites**: We recommend using a Debian/Ubuntu machine, VM, or container for optimal compatibility.

This one-time setup applies to all data science projects. You'll need a machine with Conda, Git, and Poetry installed. Ensure that your configuration closely matches the one defined in `.devcontainer/Dockerfile`.

Here are some key points about this setup:

- The Dockerfile is configured with a non-root user, making it compatible with WSL Ubuntu machines or any Debian/Ubuntu VM (e.g., Azure, AWS, Google).
- If you're already using an Ubuntu/Debian machine with a non-root user (e.g., Ubuntu in WSL), follow these commands from the root folder of the repo:

    ```bash
    # Sudo-level tools
    chmod +x .devcontainer/setup_sudo.sh
    sudo .devcontainer/setup_sudo.sh

    # User tools: Git, Conda, Poetry
    chmod +x .devcontainer/setup_user.sh
    source .devcontainer/setup_user.sh
    ```

- Note that on some cloud VMs, Git and Conda are likely already installed, so you can skip those steps.
- For a quick setup, use the development container defined in `.devcontainer/Dockerfile` (Docker required). In Visual Studio Code, open the root folder of this repo, press `F1`, and select **Dev Containers: Open Workspace in Container**. The container will open the same workspace after building the Docker image.


**Step 1**. Navigate to the root directory of the repository and create a new conda environment for development:

```bash
conda create -n dev python={{ cookiecutter.python_version }} -y && conda activate dev
```

**Step 2**. Install all dependencies and initialize the repository in editor mode. This step also performs quality assurance using pre-commit hooks. The exact steps for this process can be found under the `setup` label in the Makefile. It is recommended to run `make setup` twice if any warnings or format fixes have been made to ensure all pre-commit tests pass.

```bash
make setup
```
Please note, if any warnings are encountered or format fixes are made during the execution of the command, it is recommended to run the command a second time. This also applies to pre-commit instructions. If a pre-commit hook modifies a file during its run, executing the pre-commit again will likely pass the test.


**Step 3**. (Optional) If you've created a new repository, link your local repository to the remote repository. Replace the URL with your repository's URL. If you've cloned an existing repository, you can skip this step.

```bash
git remote add origin <url-remote-repository>.git
git branch -M main
git push -u origin main
```

## Installation for Fast Evaluation Usage

This section is for read-only usage. The package should have been previously created in the dev environment using `poetry build`. The steps for this process can be found under the `conda create` and `pip install` labels in the Makefile.

```bash
conda create -n {{ cookiecutter.__package_slug }} python={{ cookiecutter.python_version }} -y && conda activate {{ cookiecutter.__package_slug }}
pip install dist/{{ cookiecutter.__package_slug }}-0.1.0-py3-none-any.whl
```

## Usage

- TODO: Add detailed instructions for using the package. Refer to the  labels in`Makefile` for execution commands and steps.

## Contributing

Check out the contributing guidelines.

### Before Committing

Before committing your changes, run the following quality assurance checks:

- **Manual pre-commit** - Complete set of checks (slow). The steps for this process can be found under the `make qa` label in the Makefile.

```bash
make qa
```

- **Manual pre-commit** - Reduced set of checks (fast). The steps for this process can be found under the `make qa-fast` label in the Makefile.

```bash
make qa-fast
```

- **Automatic pre-commit hooks** (advanced, not recommended for fast development). This installs pre-commit hooks that automatically run before each commit.

```bash
pre-commit install
```

## License

`{{ cookiecutter.__package_slug }}` was created by {{ cookiecutter.author_name }}. {% if cookiecutter.open_source_license != 'None' -%}It is licensed under the terms of the {{ cookiecutter.open_source_license }} license.{% else %}{{ cookiecutter.author_name }} retains all rights to the source and it may not be reproduced, distributed, or used to create derivative works.{% endif %}

## Credits

`{{ cookiecutter.__package_slug }}` originated from [Angel Martinez-Tenor's Data Science Template](https://github.com/angelmtenor/ds-template), which itself was developed based on the [py-pkgs-cookiecutter template](https://github.com/py-pkgs/py-pkgs-cookiecutter)
