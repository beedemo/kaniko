FROM scratch

COPY ./executor /kaniko/executor
COPY ./docker-credential-gcr /usr/local/bin/docker-credential-gcr
COPY ./docker-credential-ecr-login /usr/local/bin/docker-credential-ecr-login
COPY ./certs/ /kaniko/ssl/certs/
COPY ./busybox/ /busybox/
ENV HOME /root
ENV USER /root
ENV PATH /usr/local/bin:/busybox
ENV SSL_CERT_DIR=/kaniko/ssl/certs
ENTRYPOINT ["/kaniko/executor"]
