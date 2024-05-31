"""
- Title:            Main init file for the package
- Project/Topic:    Data Science Template. Utils
- Author/s:         Angel Martinez-Tenor
- Source:           https://github.com/angelmtenor/ds-template
- Dev Date:         2017-2024

- Status:           Production Ready
"""

# pylint: disable=unused-import
# isort: skip

from importlib.metadata import version

from .utils import logger  # noqa: F401

__version__ = version("{{ cookiecutter.__package_slug }}")
