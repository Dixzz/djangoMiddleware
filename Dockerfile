# FROM aler9/rtsp-simple-server:v0.20.0 AS video-server

# FROM alpine:3.17
# RUN apk add --no-cache ffmpeg
# RUN apk --no-cache add curl

# COPY --from=video-server /rtsp-simple-server /

# ENTRYPOINT [ "sh", "-c", "/rtsp-simple-server" ]
FROM aler9/rtsp-simple-server AS rtsp
FROM alpine:3.17
RUN apk add --no-cache ffmpeg
# COPY --from=rtsp /rtsp-simple-server /
COPY --from=rtsp /mediamtx /
COPY images /images 
COPY ./rtsp-simple-server.yml /mediamtx.yml
# COPY ./rtsp-simple-server.yml /rtsp-simple-server.yml
ENTRYPOINT [ "/mediamtx" ]
# ENTRYPOINT [ "/rtsp-simple-server" ]