echo "Start."
cd /images
mkdir -p $RTSP_PATH
url=rtsp://localhost:$RTSP_PORT/$RTSP_PATH
out=$RTSP_PATH.mp4
cam_out=$RTSP_PATH/img-%d.jpg
# ffmpeg -i $url -c copy $out
# ffmpeg -rtsp_transport tcp -i $url -y -c copy $out
# ffmpeg -i $url -b 900k -vcodec copy -r 60 -y $out
# ffmpeg -i $url -vcodec copy -r 60 -y $out
ffmpeg -rtsp_transport tcp -i $url -vf fps=1 $cam_out

# ffmpeg -hide_banner -loglevel error -i rtsp://localhost:$RTSP_PORT/$RTSP_PATH -vf fps=1 $RTSP_PATH/img-%d.jpg
# rm -rf $RTSP_PATH 
# ls /images
# echo "Done"
