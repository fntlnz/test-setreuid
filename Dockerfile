FROM scratch

ADD test /test

ENTRYPOINT ["/test"]
