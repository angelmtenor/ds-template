""" Python Package init file """
# read version from installed package
from importlib.metadata import version

__version__ = version("{{ cookiecutter.__package_slug }}")
