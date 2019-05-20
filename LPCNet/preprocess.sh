#../dataset/LJSpeech-1.1/pcms

mkdir -p ../dataset/LJSpeech-1.1/pcms
for i in ../dataset/LJSpeech-1.1/wavs/*.wav
do sox $i -r 16000 -c 1 -t sw - > ../dataset/LJSpeech-1.1/pcms/audio-$(basename "$i" | cut -d. -f1).s16
done

#merge all PCM to single file

for i in ../dataset/LJSpeech-1.1/pcms/*.s16
do 
    cat "$i" >> final.pcm
    echo $i
done
echo "Final.pcm created..."

#make using make clean , make dump_data ( no taco=1 Flag)
make clean && make dump_data
./dump_data -train final.pcm features.f32 data.u8
