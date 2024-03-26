FROM golang:1.22 AS download-gotty

RUN go install github.com/sorenisanerd/gotty@v1.5.0

FROM docker:26-dind

WORKDIR /app

COPY --from=download-gotty /go/bin/gotty /app/gotty

# https://stackoverflow.com/a/35613430
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

COPY start-shell.sh start-shell.sh

# run docker containers inside this docker container.
# therefore, each client is isolated from each other
CMD ["/app/gotty", "-w", "/bin/sh", "start-shell.sh"]

EXPOSE 8080

