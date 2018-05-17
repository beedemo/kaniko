FROM gcr.io/kaniko-project/executor:debug

COPY /busybox/ /bin/

ENV PATH /usr/local/bin:/bin

ENTRYPOINT ["/kaniko/executor"]
