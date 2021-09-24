FROM python:3.9-slim-buster AS builder

ENV VIRTUAL_ENV=/opt/ansible

RUN apt-get -qqy update \
      && pip install pip --upgrade \
      && adduser --disabled-password ansible \
      && python -m venv $VIRTUAL_ENV \
      && chown -R ansible:ansible /opt/ansible

USER ansible

ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY requirements.txt .

RUN pip install -r requirements.txt

FROM python:3.9-slim-buster

ENV VIRTUAL_ENV=/opt/ansible

RUN adduser --disabled-password ansible \
      && python -m venv $VIRTUAL_ENV \
      && chown -R ansible:ansible /opt/ansible

COPY --chown=ansible:ansible --from=builder /opt/ansible /opt/ansible

WORKDIR /repo
USER ansible

ENV LESS=-R \
      LC_ALL=C.UTF-8 \
      LANG=C.UTF-8 EDITOR=nano \
      PATH="$VIRTUAL_ENV/bin:$PATH"

ENTRYPOINT ["ansible-playbook"]
CMD ["--help"]
