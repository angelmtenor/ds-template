import sys
import importlib.metadata
from packaging import version


MIN_CC_VERSION = "2.0.0"

# assert cookiecutter >= 2.0.0
cc_version = importlib.metadata.version("cookiecutter")
if version.parse(cc_version) < version.parse(MIN_CC_VERSION):
    print(
        f"ERROR: please install cookiecutter >= {MIN_CC_VERSION} (current "
        f"version is {cc_version}):\n"
        f"\tpip install 'cookiecutter>=2', OR\n"
        f"\tconda install 'cookiecutter>=2'"
    )
    sys.exit(1)
