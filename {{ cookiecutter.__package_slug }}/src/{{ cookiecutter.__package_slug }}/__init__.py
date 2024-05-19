""" Python Package init file """

# read version from installed package
from importlib.metadata import version

from .utils import logger  # noqa: F401, pylint: disable=unused-import # must be placed before Assistant # isort: skip

__version__ = version("{{ cookiecutter.__package_slug }}")
