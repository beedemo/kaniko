FROM gcr.io/kaniko-project/executor:debug

ADD /busybox/sh /bin/sh

ENV PATH /usr/local/bin:/bin

ENTRYPOINT ["/kaniko/executor"]
