FROM gcr.io/kaniko-project/executor:debug

RUN mkdir bin

RUN ln -s /busybox/sh /bin/sh

ENV PATH /usr/local/bin:/bin

ENTRYPOINT ["/kaniko/executor"]
