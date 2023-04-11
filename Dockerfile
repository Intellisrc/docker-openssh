# Dockerfile for lighttpd
FROM intellisrc/alpine:3.14

RUN apk add --no-cache openssh && \
    rm -rf /var/cache/apk/*

EXPOSE 22

# Set user password
ENV USER alpine
ENV PASSWORD default
COPY start.sh /usr/local/bin/start.sh
VOLUME /home/

RUN ssh-keygen -A
RUN ssh-keygen -N "" -t rsa -b 4096 -f  /etc/ssh/ssh_host_key

CMD ["/usr/local/bin/start.sh"]
