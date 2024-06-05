FROM aler9/rtsp-simple-server AS rtsp

FROM alpine:3.12
RUN apk add --no-cache ffmpeg nginx

RUN mkdir /run/nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=rtsp /rtsp-simple-server /
# COPY rtsp-simple-server.yml /
# expose 8002:8002
ENTRYPOINT [ "sh", "-c", "nginx && /rtsp-simple-server" ]
