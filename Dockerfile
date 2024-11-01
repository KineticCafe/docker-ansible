# syntax=docker/dockerfile:1

FROM python:3.13-slim-bookworm AS builder

ENV LC_ALL=C.UTF-8 \
    LANG=C.UTF-8 \
    EDITOR=nano

RUN <<BUILD_SETUP
set -eux

apt-get -y update
apt-get -y upgrade
apt-get -y --no-install-recommends install \
    build-essential  \
    python3-dev \
    libffi-dev  \
    rustc

adduser --disabled-password --gecos '' ansible
python3 -m pip install pip --upgrade

mkdir -p /opt/ansible
chown -R ansible:ansible /opt/ansible
BUILD_SETUP

USER ansible

ENV LC_ALL=C.UTF-8 \
    LANG=C.UTF-8 \
    EDITOR=nano

WORKDIR /opt/ansible

ADD pyproject.toml pdm.lock /opt/ansible/

RUN <<BUILD_PROJECT
set -eux

python3 -m pip install --user pdm
/home/ansible/.local/bin/pdm sync --clean --production --no-editable
BUILD_PROJECT

FROM python:3.13-slim-bookworm AS runtime

RUN <<SETUP
set -eux

apt-get -y update
apt-get -y upgrade
apt-get -y --no-install-recommends install \
  less \
  nano \
  vim-nox

adduser --disabled-password --gecos '' ansible

mkdir -p /opt/ansible
chown -R ansible:ansible /opt/ansible
SETUP

COPY --chown=ansible:ansible --from=builder /opt/ansible /opt/ansible

WORKDIR /repo
USER ansible

ENV LESS=-R \
      LC_ALL=C.UTF-8 \
      LANG=C.UTF-8 EDITOR=nano \
      PATH="/opt/ansible/.venv/bin:$PATH"

ENTRYPOINT ["ansible-playbook"]
CMD ["--help"]
