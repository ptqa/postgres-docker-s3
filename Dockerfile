FROM postgres:9

RUN apt update && apt install -y awscli
COPY docker-entrypoint.sh /usr/local/bin/
COPY get-backup.sh /usr/local/bin/