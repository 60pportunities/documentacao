FROM squidfunk/mkdocs-material:latest
LABEL maintainer="Horacio Vasconcellos, horacio.vasconcellos@gmail.com"

COPY action.sh /action.sh

RUN apk add --no-cache bash build-base linux-headers && chmod +x /action.sh

ENTRYPOINT ["/action.sh"]
