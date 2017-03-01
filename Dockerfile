FROM smebberson/alpine-base
ADD rootfs /
EXPOSE 3310
RUN apk add --no-cache clamav-daemon clamav-libunrar
RUN sed -i -e 's@/run/clamav/@/tmp/@' -e 's@#TCPSocket@TCPSocket@' /etc/clamav/*; \
freshclam --update-db=main
