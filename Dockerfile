FROM alpine:3.21

COPY mpd.conf /etc/mpd.conf

RUN set -eux ; \
      apk --no-cache add mpd

VOLUME /var/lib/mpd
EXPOSE 6600 8000

CMD ["mpd", "--no-daemon", "--stdout"]
