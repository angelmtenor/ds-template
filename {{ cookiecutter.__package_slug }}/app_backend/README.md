# {{ cookiecutter.__package_slug }} Backend Application

This application is designed to run both as a standalone service and within a container for deployment readiness.

**Current Status: Template**

## Description

- (Please provide a comprehensive description of the application here)

## API Endpoints

The application deploys a FastAPI service with the following endpoints:

- `/`: A basic health check endpoint
- (Please describe the remaining endpoints here)

## Setup and Usage

To set up the application, generate a `.env` file from the provided `.env.template`. This file should contain the necessary environment variables:

- (Please describe the required environment variables here)

For running the application, refer to the `Makefile`. It contains commands for both non-containerized development and containerized modes.

To interact with the API, use the Swagger UI. It can be accessed at the following URL when the application is running: http://localhost:8000/docs

## Acknowledgements
This application is based on the Data Science Template by Angel Martinez-Tenor, available at: https://github.com/angelmtenor/ds-template
