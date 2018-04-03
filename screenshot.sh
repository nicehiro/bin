# ffmpeg -video_size 1920x1080 -framerate 25 -f x11grab -i :0.0 -f alsa -ac 2 -i hw:0 ~/Videos/output.mkv

ffmpeg -framerate 25 -video_size 1920x1080 -f x11grab -i :0.0 -f alsa -ac 2 -i pulse -vcodec libx264 -crf 0 -preset ultrafast -acodec pcm_s16le ~/Videos/output.mkv
