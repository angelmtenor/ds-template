# Start from a lightweight Python 3.12 base image
FROM python:{{ cookiecutter.python_version }}-slim

# Set the working directory to /app
WORKDIR /app

# Copy the requirements file into the container
COPY *.whl .
COPY requirements.txt .

# Install the required packages
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the application code, environment file, and any JSON files into the container
COPY app* .env *.json ./

# Define the command to start the application
CMD ["python3", "app_entrypoint.py"]
