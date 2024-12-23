FROM squidfunk/mkdocs-material:latest
LABEL maintainer="Horacio Vasconcellos, horacio.vasconcellos@gmail.com"

COPY 60opt_github.sh /60opt_github.sh

RUN apk add --no-cache bash build-base linux-headers && chmod +x /60opt_github.sh

ENTRYPOINT ["/60opt_github.sh"]
