"""
- Title:            Pytest Parameters - Empty Template
- Project/Topic:    Data Science Template
- Author/s:         Angel Martinez-Tenor
- Source:           https://github.com/angelmtenor/ds-template
- Dev Date:         2022

- Status:           Template only
"""

# import pytest


# def pytest_addoption(parser):
#     """
#     Definition of input arguments for pytest
#     """
#     # parser.addoption("--cache", action="store")
#     pass


# @pytest.fixture
# def cache_params(request):
#     """
#     Capture cache input arguments for pytest
#     """
#     params = {}
#     # params = {"cache": request.config.getoption("--cache")}
#     for key, value in params.items():
#         params[key] = value != "False"
#     return params
