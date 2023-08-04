FROM python:3.11-slim-bullseye AS builder

ENV LC_ALL=C.UTF-8 \
    LANG=C.UTF-8 \
    EDITOR=nano

RUN apt-get -qqy update \
      && apt-get -qqy upgrade \
      && apt-get -qqy --no-install-recommends install \
            build-essential \
            python-dev \
            libffi-dev \
            rustc \
      && adduser --disabled-password --gecos '' ansible \
      && python3 -m pip install pip --upgrade \
      && mkdir -p /opt/ansible \
      && chown -R ansible:ansible /opt/ansible

USER ansible

ENV LC_ALL=C.UTF-8 \
    LANG=C.UTF-8 \
    EDITOR=nano

WORKDIR /opt/ansible

ADD pyproject.toml pdm.lock /opt/ansible/

RUN python3 -m pip install --user pdm \
      && /home/ansible/.local/bin/pdm sync --clean --production --no-editable

FROM python:3.11-slim-bullseye AS runtime

RUN apt-get -qqy update \
      && apt-get -qqy upgrade \
      && adduser --disabled-password --gecos '' ansible \
      && mkdir -p /opt/ansible \
      && chown -R ansible:ansible /opt/ansible

COPY --chown=ansible:ansible --from=builder /opt/ansible /opt/ansible

WORKDIR /repo
USER ansible

ENV LESS=-R \
      LC_ALL=C.UTF-8 \
      LANG=C.UTF-8 EDITOR=nano \
      PATH="/opt/ansible/.venv/bin:$PATH"

ENTRYPOINT ["ansible-playbook"]
CMD ["--help"]
