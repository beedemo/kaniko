FROM gcr.io/kaniko-project/executor:debug

RUN /busybox/mkdir bin

RUN /busybox/ln -s /busybox/sh /bin/sh

ENV PATH /usr/local/bin:/bin

ENTRYPOINT ["/kaniko/executor"]
