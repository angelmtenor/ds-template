"""
- Title:            App Backend
- Project/Topic:    Data Science Template
- Author/s:         Angel Martinez-Tenor
- Source:           https://github.com/angelmtenor/ds-template
- Dev Date:         2017-2024

- Status:           Production Ready
"""

import os
from contextlib import asynccontextmanager

from fastapi import Depends, FastAPI, HTTPException, status
from fastapi.middleware.cors import CORSMiddleware
from fastapi.security import HTTPAuthorizationCredentials, HTTPBearer
from pydantic import BaseModel

from {{ cookiecutter.__package_slug }} import logger  # ,MyObject, load_parameters

log = logger.init(level="DEBUG", save_log=True, simple_format=False)
log.info("RAG Backend App")  # pylint: disable=W1203

bearer_scheme = HTTPBearer()
# my_object: MyObject = None

BEARER_TOKEN = os.getenv("BEARER_TOKEN", None)
environment = os.getenv("ENVIRONMENT", "")
if environment != "":
    environment = "/" + environment


def validate_token(credentials: HTTPAuthorizationCredentials = Depends(bearer_scheme)):
    """
    Validates the token provided in the request.

    Args:
        credentials (HTTPAuthorizationCredentials): The credentials provided in the request.

    Returns:
        HTTPAuthorizationCredentials: The validated credentials.

    Raises:
        HTTPException: If the token is invalid or missing.
    """

    if BEARER_TOKEN is None:
        if credentials.scheme != "Bearer":
            raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid or missing token")
    else:
        if credentials.scheme != "Bearer" or credentials.credentials != BEARER_TOKEN:
            raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid or missing token")
        return credentials
    return credentials


def create_my_object():
    """
    Creates the object to be used for the main service.
    Returns:
        MyObject: My object Instance
    """
    # example:     params = load_parameters(scenario_path)
    # return MyObject(scenario_path, **params)
    return None


@asynccontextmanager
async def lifespan(app: FastAPI):  # pylint: disable=unused-argument,redefined-outer-name
    """
    Initializes the application on startup  and sets the global variables `my_object`
    """
    # global my_object  # pylint: disable=global-statement

    log.info("Starting up...")

    # my_object = create_my_object()
    yield


app = FastAPI(
    title="Backend APP for {{ cookiecutter.__package_slug }}",
    description="",
    version="0.1.0",
    lifespan=lifespan,
)

origins = [
    "http://localhost",  # Allow requests from http://localhost
    "*",  # Allow requests from any origin (not recommended in production)
]

# Add CORS middleware to the FastAPI app with the specified configuration
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,  # Specify the list of allowed origins
    allow_credentials=True,  # Allow sending credentials (e.g., cookies)
    allow_methods=["*"],  # Allow all HTTP methods (GET, POST, etc.)
    allow_headers=["*"],  # Allow all HTTP headers
)

# Health Check Endpoint -----------------


class HealthCheck(BaseModel):
    """
    A class used to represent the health status of the system.

    Attributes
    ----------
    status : str
        a string that indicates the health status of the system, default is "OK"
    """

    status: str = "App OK"


@app.get(f"{environment}/", status_code=status.HTTP_200_OK, response_model=HealthCheck)
def get_health() -> HealthCheck:
    """
    Check the health status of the system.

    Returns:
        HealthCheck: An instance of the HealthCheck class with the status attribute set to "OK".
    """
    return HealthCheck()


# Custom Endpoint -----------------


class UserRequest(BaseModel):
    """
    Request Object

    ### Attributes:
        - **user_request** (str): The user's request.
    """

    user_request: str


class Response(BaseModel):
    """
    Response Object

    ### Attributes:
        - **response** (str): The response to the user's request.
        - **error_msg** (str): The error message, if any.
    """

    response: str
    error_msg: str = ""


# Template for a custom endpoint
# @app.post(
#     f"{environment}/request",
#     tags=["user request"],
#     dependencies=[Depends(validate_token)],
# )
# async def request(user_request: UserRequest):
#     """
#     Describe your endpoint here.
#     """
#     # global my_object  # pylint: disable=global-statement, global-variable-not-assigned

#     response = my_object.request(user_request.user_request)

#     return Response(
#         response=json.dumps(response),
#         error_msg=my_object.error_msg,
#     )
