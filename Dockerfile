FROM alpine:3.16

COPY mpd.conf /etc/mpd.conf

#RUN adduser -DH mpd \
RUN apk --no-cache add mpd \
      && setcap -r /usr/bin/mpd
#      && mkdir -p /mpd/cache/playlists \
#      && touch \
#        /mpd/cache/tag_cache \
#        /mpd/cache/state \
#        /mpd/cache/sticker.sql \
#      && chown -R mpd /mpd/cache \
#      && chmod 744 /etc/mpd.conf

VOLUME /var/lib/mpd
EXPOSE 6600 8000

CMD ["mpd", "--no-daemon", "--stdout"]
