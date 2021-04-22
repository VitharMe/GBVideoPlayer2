#!/bin/bash
ffmpeg -ss $START -i video.mp4 -c copy -t $DURATION video_cut.mp4
mv video_cut.mp4 $NAME.mp4
make SOURCE=$NAME.mp4
mv /GBVideoPlayer2/output/$NAME/$NAME.gbc /GBVideoPlayer2/video/.
