FROM alpine:3.4

# Description
# LABEL description="Latest Alpine base image with libxml2 utilities and lftp."

# Install packages
RUN apk add --no-cache bash libxml2-utils lftp

COPY run.sh /run.sh

ENTRYPOINT ["sh", "/run.sh"]