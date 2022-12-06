FROM python:{{ cookiecutter.python_version }}-slim
WORKDIR /app
ENV PYTHONUNBUFFERED=1 PIP_ROOT_USER_ACTION=ignore

RUN apt-get update
RUN apt-get -y install git
# RUN apt-get -y install cpp g++
RUN pip install --upgrade pip

COPY  pyproject.toml ./
COPY src src
RUN pip install -e .

# COPY usage.py .
# CMD python usage.py
# (optional): Launch Streamlit Service
# (optional): Add jupyter notebook service for dev
