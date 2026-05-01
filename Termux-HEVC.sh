#!/data/data/com.termux/files/usr/bin/bash

# المسارات العامة
INPUT="/sdcard/Download/Video_Input"
OUTPUT="/sdcard/Download/Video_Compressed_HEVC"
mkdir -p "$INPUT" "$OUTPUT"

files=("$INPUT"/*.mp4)
if [ ! -e "${files[0]}" ]; then 
    echo "❌ حط الفيديوهات اللي عايز تضغطها في فولدر: Download/Video_Input"
    exit 1
fi

total=${#files[@]}
count=0

echo "🚀 HEVC Mode: Fast & Efficient"
for f in "${files[@]}"; do
    count=$((count+1))
    filename=$(basename "$f")
    
    if [ -f "$OUTPUT/$filename" ] || [ -f "$OUTPUT/${filename%.mp4}_Original.mp4" ]; then
        echo "[$count/$total] ⏭️  Skipped: $filename"
        continue
    fi

    echo "[$count/$total] 🎥 Processing: $filename"
    oldSize=$(stat -c%s "$f")

    ffmpeg -hide_banner -loglevel error -i "$f" \
    -c:v hevc_mediacodec -b:v 1300k -maxrate 1600k -bufsize 3200k \
    -g 60 -profile:v main -c:a copy \
    "$OUTPUT/temp.mp4"

    newSize=$(stat -c%s "$OUTPUT/temp.mp4")

    if [ "$newSize" -lt "$oldSize" ]; then
        mv "$OUTPUT/temp.mp4" "$OUTPUT/$filename"
        echo "   ✅ Saved: $(( (oldSize-newSize)/1024/1024 )) MB"
    else
        rm "$OUTPUT/temp.mp4"
        cp "$f" "$OUTPUT/${filename%.mp4}_Original.mp4"
        echo "   ⚠️  Kept Original (Larger size)"
    fi
done
