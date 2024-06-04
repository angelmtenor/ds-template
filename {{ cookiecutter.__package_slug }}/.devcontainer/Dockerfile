# Dev Container: DS Ubuntu 24. Includes miniconda, git and poetry
# Angel Martinez-Tenor 2022-2024
# https://github.com/angelmtenor/ds-template

FROM ubuntu:24.04

RUN touch /var/mail/ubuntu && chown ubuntu /var/mail/ubuntu && userdel -r ubuntu
# Root user (replicate in commands line with sudo) ---------------------------------------------------------------------

# From https://hub.docker.com/r/continuumio/miniconda/dockerfile
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

RUN apt update --fix-missing -y && apt upgrade -u -y \
  && apt install -y --no-install-recommends git git-flow make curl wget ca-certificates \
  nano htop gcc gpp clang linux-libc-dev pipx unzip zip

# GPU ONLY: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html
# RUN apt-get install nvtop ubuntu-drivers-common -y
# RUN apt-get install nvidia-kernel-common-555 -y

# Optional
# RUN apt-get install nvidia-cuda-toolkit -y

# CREATE AND ACTIVATE A NON ROOT USER:

ARG USERNAME=ubuntu
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN if ! getent group $USER_GID; then groupadd --gid $USER_GID $USERNAME; fi \
  && if ! id -u $USERNAME; then useradd --uid $USER_UID --gid $USER_GID -m $USERNAME; else usermod -a -G $USER_GID $USERNAME; fi \
  && apt-get update \
  && apt-get install -y sudo \
  && mkdir -p /etc/sudoers.d/ \
  && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
  && chmod 0440 /etc/sudoers.d/$USERNAME

USER $USERNAME

# # From here: non-root user (no sudo) -----------------------------------------------------------------------------------

# # Instructions to Replicate in commands line. Valid for any Debian/Ubuntu machine (on-prem, WSL, CLoud VMs ...):
# #   - Remove RUN: e.g.: RUN mkdir .....   -> mkdir ....
# #   - Replace ENV by export: e.g.: ENV PATH="$HOME/.local/bin:$PATH"   -> export PATH="$HOME/.local/bin:$PATH"
# # Note: Restating the shell to apply changes is sometimes required.

SHELL ["/usr/bin/bash", "-c"]
ENV SHELL /usr/bin/bash


# INSTALL MINICONDA (user)
RUN mkdir -p ~/miniconda3 && \
  curl -sSL https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o ~/miniconda3/miniconda.sh && \
  bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3 && \
  rm ~/miniconda3/miniconda.sh && \
  ~/miniconda3/bin/conda init bash && \
  ~/miniconda3/bin/conda init zsh

# ENV PATH="$HOME/.local/bin:$PATH"

# # RUN /usr/bin/bash
# # RUN source ~/.bashrc
# # Allow git to work in any directory as root (security issue but useful for dev containers)
# # RUN git config --global --add safe.directory '*'

# # Poetry
# # RUN curl -sSL https://install.python-poetry.org | python3 -
# # ENV PATH="$HOME/.local/bin:$PATH"

RUN pipx install poetry
RUN pipx install cookiecutter
RUN pipx ensurepath
# # Manually:
# # echo 'export PATH="/home/'$USER'/.local/bin:$PATH"' >> ~/.bashrc
# # source ~/.bashrc

# # Git: Change default branch to main
RUN git config --global init.defaultBranch main
RUN source ~/.bashrc

# # Create a Customized conda dev environment with cookiecutter and ipykernel  (last step to avoid env conflicts):
# #  Do not use ENV PATH=~/miniconda3/bin:$PATH for conda before another block of commands

# Dev environment with cookiecutter and ipykernel. Can be used with poetry, pip...
ENV PATH=~/miniconda3/bin:$PATH
# RUN conda update --all -y
RUN conda create -n dev python=3.12 -y && conda init bash && \
  echo "conda activate dev" >> ~/.bashrc && source activate dev && \
  pip install ipykernel
# conda install -y -c conda-forge 'cookiecutter>=2' ipykernel

# # Docker (optional - reboot required in case of post-installation)
# # RUN curl -fsSL https://get.docker.com -o get-docker.sh
# # RUN sudo sh get-docker.sh
# # RUN sudo usermod -aG docker ${USER}

# # Entrypoint - BASH
CMD [ "/usr/bin/bash"]
