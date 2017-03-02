FROM smebberson/alpine-base
ADD rootfs /
EXPOSE 3310-3320
RUN apk add --no-cache clamav-daemon clamav-libunrar
RUN sed -i -e 's@/run/clamav/@/tmp/@' -e 's@#TCPSocket@TCPSocket@' \
-e 's@#StreamMinPort.*@StreamMinPort 3311@' \
-e 's@#StreamMaxPort.*@StreamMaxPort 3320@' /etc/clamav/*; \
freshclam --update-db=main
