x2mp3, x2mp4, x2flac, flactags
==============================

# x2mp3

x2mp3 [infile] [outfile] 转换单个文件为mp3

# x2mp4

x2mp4 [infile] [outfile] 转换单个文件为mp4

调用ffmpeg做视频转换，保留原始视频的长宽、码率，默认转换成mp4格式

# x2flac

x2flac [infile] [outfile] 转换单个音乐文件为flac

    $ x2flac xxx.ape xxx.flac  

x2flac [cuefile] [audiofile] 根据cue索引信息拆分[audiofile]音乐文件，按曲目顺序存为多个flac

注意cuetags.sh自动打的tag不含year信息

    $ x2flac xxx.cue xxx.wav
    $ cuetags.sh xxx.cue *.flac

# flactags 

flactags 将当前所在目录的flac打上tag，带上year信息

    $ cd year.artist.album
    $ flactags

示例目录如下：

    1995.周华健.爱相随
    ├── 01.梦到破灭再从头.flac
    ├── 02.爱相随.flac
    ├── 03.天下有情人(齐豫合唱).flac
    ├── 04.痛哭的人.flac
    ├── 05.旧伤新痕.flac
    ├── 06.我心加你心.flac
    ├── 07.世纪的秘密.flac
    ├── 08.女儿歌.flac
    ├── 09.若不是因为你.flac
    ├── 10.谁.flac
    └── 11.女儿歌(口哨独奏曲).flac

    0 directories, 11 files

# install

require ffmpeg, shnsplit, flac, cuetools

windows下ffmpeg可以用 http://ffmpeg.zeranoe.com/builds/
