FROM python:3.9-alpine AS builder

ENV VIRTUAL_ENV=/opt/ansible

RUN apk add --no-cache --update build-base make libressl-dev musl-dev \
      libffi-dev libressl rust cargo \
      && pip install pip --upgrade \
      && addgroup -S ansible \
      && adduser -S -G ansible ansible \
      && python -m venv $VIRTUAL_ENV \
      && chown -R ansible:ansible /opt/ansible

USER ansible

ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY requirements.txt .

RUN pip install -r requirements.txt

FROM python:3.9-alpine

ENV VIRTUAL_ENV=/opt/ansible

RUN apk add --no-cache --update sshpass nano libressl \
      && addgroup -S ansible \
      && adduser -S -G ansible ansible \
      && python -m venv $VIRTUAL_ENV

COPY --from=builder /opt/ansible /opt/ansible

RUN chown -R ansible:ansible /opt/ansible

WORKDIR /repo
USER ansible

ENV LESS=-R \
      LC_ALL=C.UTF-8 \
      LANG=C.UTF-8 EDITOR=nano \
      PATH="$VIRTUAL_ENV/bin:$PATH"

ENTRYPOINT ["ansible-playbook"]
CMD ["--help"]

