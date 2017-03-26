x2mp3, x2mp4, x2flac
====================

# x2mp3

x2mp3 [infile] [outfile] 转换单个文件为mp3

# x2mp4

x2mp4 [infile] [outfile] 转换单个文件为mp4

调用ffmpeg做视频转换，保留原始视频的长宽、码率，默认转换成mp4格式

# x2flac

x2flac [infile] [outfile]

x2flac xxx.ape xxx.flac  转换单个音乐文件为flac

x2flac [cuefile] [audiofile] 

x2flac xxx.cue xxx.wav  根据xxx.cue索引信息拆分xxx.wav音乐文件，按曲目顺序存为多个flac

# install

require ffmpeg, shnsplit, flac

windows下ffmpeg可以用 http://ffmpeg.zeranoe.com/builds/
