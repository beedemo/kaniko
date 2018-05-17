FROM busybox:1.28.3

#remove files that conflict with kaniko
RUN mkdir /usr/bin
RUN cp /bin/sh /usr/bin/sh && cp /bin/cat /usr/bin/cat && cp /bin/cp /usr/bin/cp && cp /bin/ls /usr/bin/ls
RUN cd /bin && find . ! -name 'sh' -type f -exec rm -f {} +
COPY ./executor /kaniko/executor
COPY ./docker-credential-gcr /usr/local/bin/docker-credential-gcr
COPY ./docker-credential-ecr-login /usr/local/bin/docker-credential-ecr-login
COPY ./certs/ /kaniko/ssl/certs/
ENV HOME /root
ENV USER /root
ENV PATH /usr/bin:/usr/local/bin
ENV SSL_CERT_DIR=/kaniko/ssl/certs
ENTRYPOINT ["/kaniko/executor"]
