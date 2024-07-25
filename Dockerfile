FROM alpine:latest

ENV HUGO_DIR=/hugo

RUN apk add --no-cache bash bash-completion git tzdata

RUN apk add --no-cache hugo

RUN mkdir -p $HUGO_DIR

EXPOSE 1313

COPY pull.sh /etc/periodic/15min
RUN chmod +x /etc/periodic/15min/pull.sh

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["server", "--bind", "0.0.0.0" ]
