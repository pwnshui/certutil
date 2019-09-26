#!/bin/bash
for z in $(ls *.m4a); do
	ffmpeg -i $z -filter_complex "[0:a]silencedetect=n=-48dB:d=0.5[outa]" -map [outa] -f s16le -y /dev/null |& F="-nostdin -v warning -i '$z' -y %03d_'${z}'" perl -ne 'INIT { $ss=0; $se=0; } if (/silence_start: (\S+)/) { $ss=$1; $ctr+=1; printf "ffmpeg -ss %f -t %f $ENV{F} \n", $se, ($ss-$se), $ctr; } if (/silence_end: (\S+)/) { $se=$1; } END { printf "ffmpeg -ss %f $ENV{F} \n", $se, $ctr+1; }' | bash -x
	rm $z
done
