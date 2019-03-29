FROM alpine:3.9

RUN echo '@testing http://nl.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    apk add --no-cache zim@testing

RUN mkdir /notebook && \
    chown -R 1001:1001 /notebook

USER 1001
VOLUME /notebook
EXPOSE 8080

ENTRYPOINT ["/usr/bin/zim", "--server", "--port", "8080"]
CMD ["/notebook/notebook.zim"]
