"""
- Title:            App Backend Entrypoint
- Project/Topic:    Data Science Template
- Author/s:         Angel Martinez-Tenor
- Source:           https://github.com/angelmtenor/ds-template
- Dev Date:         2017-2024

- Status:           Production Ready
"""

import os

import uvicorn
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()  # Use override=True for development / debugging purposes

# Set default values for environment variables
DEFAULT_PORT = 8000
DEFAULT_DEBUG = False

# Get environment variables or use default values if not set
PORT = int(os.getenv("PORT", DEFAULT_PORT))
DEBUG = os.getenv("DEBUG", str(DEFAULT_DEBUG)).lower() == "true"

# Set host and log level
HOST = "0.0.0.0"
LOG_LEVEL = "debug" if DEBUG else "info"

if __name__ == "__main__":
    uvicorn.run("app:app", host=HOST, port=PORT, reload=DEBUG, log_level=LOG_LEVEL)
