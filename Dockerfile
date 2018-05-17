FROM alpine

# need to have `nohup`
RUN apk add --no-cache coreutils

COPY ./executor /kaniko/executor
COPY ./docker-credential-gcr /usr/local/bin/docker-credential-gcr
COPY ./docker-credential-ecr-login /usr/local/bin/docker-credential-ecr-login
COPY ./certs/ /kaniko/ssl/certs/
ENV HOME /root
ENV USER /root
ENV PATH /bin:/usr/bin:/usr/local/bin
ENV SSL_CERT_DIR=/kaniko/ssl/certs
ENTRYPOINT ["/kaniko/executor"]
