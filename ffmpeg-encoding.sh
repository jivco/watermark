ffmpeg -v debug -i ../test.mov \
-map 0:0 -map 0:2 -map 0:0 -map 0:2 -map 0:0 -map 0:2 -map 0:0 -map 0:2 \
-c:v:0 libx264 -b:v:0 3M -g:v:0 80 -x264-params:0 keyint=80:scenecut=0 -profile:v:0 high -pix_fmt:v:0 yuv420p \
-c:a:0 libfdk_aac -b:a:0 192k -ac:0 2 -ar:0 48000 \
-c:v:1 libx264 -s:1 1280x720 -b:v:1 2M -g:v:1 80 -x264-params:1 keyint=80:scenecut=0 -profile:v:1 high -pix_fmt:v:1 yuv420p \
-c:a:1 libfdk_aac -b:a:1 192k -ac:1 2 -ar:1 48000 \
-c:v:2 libx264 -s:2 1024x576 -b:v:2 1.5M -g:v:2 80 -x264-params:2 keyint=80:scenecut=0 -profile:v:2 high -pix_fmt:v:2 yuv420p \
-c:a:2 libfdk_aac -b:a:2 192k -ac:2 2 -ar:2 48000 \
-c:v:3 libx264 -s:3 640x360 -b:v:3 0.7M -g:v:3 80 -x264-params:3 keyint=80:scenecut=0 -profile:v:3 high -pix_fmt:v:3 yuv420p \
-c:a:3 libfdk_aac -b:a:3 192k -ac:3 2 -ar:3 48000 \
-f tee "[select=\'v:0,a:0\':f=hls:hls_playlist_type=vod:hls_key_info_file=../enc.keyinfo:hls_segment_filename=\'1080p_%1d.ts\']1080p.m3u8|\
[select=\'v:1,a:1\':f=hls:hls_playlist_type=vod:hls_key_info_file=../enc.keyinfo:hls_segment_filename=\'720p_%1d.ts\']720p.m3u8|\
[select=\'v:2,a:2\':f=hls:hls_playlist_type=vod:hls_key_info_file=../enc.keyinfo:hls_segment_filename=\'576p_%1d.ts\']576p.m3u8|\
[select=\'v:3,a:3\':f=hls:hls_playlist_type=vod:hls_key_info_file=../enc.keyinfo:hls_segment_filename=\'360p_%1d.ts\']360p.m3u8"

ffmpeg -ss 00:00:00 -t 00:00:20 -v debug -i ../test.mov \
-map 0:0 -map 0:2 -map 0:0 -map 0:2 -map 0:0 -map 0:2 -map 0:0 -map 0:2 \
-c:v:0 libx264 -b:v:0 3M -g:v:0 80 -x264-params:0 keyint=80:scenecut=0 -profile:v:0 high -pix_fmt:v:0 yuv420p -filter_script:v:0 ../f1080p.txt \
-c:a:0 libfdk_aac -b:a:0 192k -ac:0 2 -ar:0 48000 \
-c:v:1 libx264 -s:1 1280x720 -b:v:1 2M -g:v:1 80 -x264-params:1 keyint=80:scenecut=0 -profile:v:1 high -pix_fmt:v:1 yuv420p -filter_script:v:1 ../f1080p.txt \
-c:a:1 libfdk_aac -b:a:1 192k -ac:1 2 -ar:1 48000 \
-c:v:2 libx264 -s:2 1024x576 -b:v:2 1.5M -g:v:2 80 -x264-params:2 keyint=80:scenecut=0 -profile:v:2 high -pix_fmt:v:2 yuv420p -filter_script:v:2 ../f1080p.txt \
-c:a:2 libfdk_aac -b:a:2 192k -ac:2 2 -ar:2 48000 \
-c:v:3 libx264 -s:3 640x360 -b:v:3 0.7M -g:v:3 80 -x264-params:3 keyint=80:scenecut=0 -profile:v:3 high -pix_fmt:v:3 yuv420p -filter_script:v:3 ../f1080p.txt \
-c:a:3 libfdk_aac -b:a:3 192k -ac:3 2 -ar:3 48000 \
-f tee "[select=\'v:0,a:0\':f=hls:hls_playlist_type=vod:hls_key_info_file=../enc.keyinfo:hls_segment_filename=\'w1080p_%1d.ts\']w1080p.m3u8|\
[select=\'v:1,a:1\':f=hls:hls_playlist_type=vod:hls_key_info_file=../enc.keyinfo:hls_segment_filename=\'720p_%1d.ts\']w720p.m3u8|\
[select=\'v:2,a:2\':f=hls:hls_playlist_type=vod:hls_key_info_file=../enc.keyinfo:hls_segment_filename=\'576p_%1d.ts\']w576p.m3u8|\
[select=\'v:3,a:3\':f=hls:hls_playlist_type=vod:hls_key_info_file=../enc.keyinfo:hls_segment_filename=\'360p_%1d.ts\']w360p.m3u8"

f1080p.txt:
drawbox=y=(ih-140):x=(iw-(1+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(11+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(21+1)):w=1:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(31+1)):w=1:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(41+1)):w=1:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(51+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(61+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(71+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(81+1)):w=1:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(91+1)):w=1:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(101+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(111+1)):w=1:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(121+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(131+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(141+1)):w=1:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(151+1)):w=1:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(161+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(171+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(181+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(191+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(201+1)):w=1:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(211+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(221+1)):w=1:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(231+1)):w=1:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(241+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(251+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(261+1)):w=1:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(271+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(281+1)):w=1:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(291+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(301+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(311+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(321+1)):w=1:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(331+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(341+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(351+1)):w=1:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(361+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(371+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(381+1)):w=1:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(391+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(401+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(411+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(421+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(431+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(441+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(451+1)):w=1:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(461+1)):w=1:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(471+1)):w=1:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(481+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(491+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(501+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(511+1)):w=1:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(521+1)):w=1:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(531+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(541+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(551+3)):w=3:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(561+1)):w=1:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(571+1)):w=1:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(581+1)):w=1:h=1:color=white@1,drawbox=y=(ih-140):x=(iw-(591+1)):w=1:h=1:color=white@1
