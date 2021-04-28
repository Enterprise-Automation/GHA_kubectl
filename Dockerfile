FROM golang:1.15

COPY src/ /

RUN /install.sh

ENTRYPOINT ["/entrypoint.sh"]