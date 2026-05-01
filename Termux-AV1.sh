#!/data/data/com.termux/files/usr/bin/bash

# المسارات العامة (هيعمل فولدرات في مجلد التحميلات عندك)
INPUT="/sdcard/Download/Video_Input"
OUTPUT="/sdcard/Download/Video_Compressed_AV1"
mkdir -p "$INPUT" "$OUTPUT"

files=("$INPUT"/*.mp4)
if [ ! -e "${files[0]}" ]; then 
    echo "❌ حط الفيديوهات اللي عايز تضغطها في فولدر: Download/Video_Input"
    exit 1
fi

total=${#files[@]}
count=0

echo "🌀 AV1 Mode: Extreme Compression"
for f in "${files[@]}"; do
    count=$((count+1))
    filename=$(basename "$f")
    
    if [ -f "$OUTPUT/$filename" ] || [ -f "$OUTPUT/${filename%.mp4}_Original.mp4" ]; then
        echo "[$count/$total] ⏭️  Skipped: $filename"
        continue
    fi

    echo "[$count/$total] 🌀 AV1 Processing: $filename"
    oldSize=$(stat -c%s "$f")

    ffmpeg -hide_banner -loglevel error -i "$f" \
    -c:v av1_mediacodec -b:v 1000k -maxrate 1300k -bufsize 2600k \
    -g 60 -c:a copy \
    "$OUTPUT/temp.mp4"

    newSize=$(stat -c%s "$OUTPUT/temp.mp4")

    if [ "$newSize" -lt "$oldSize" ]; then
        mv "$OUTPUT/temp.mp4" "$OUTPUT/$filename"
        echo "   ✅ AV1 Done! Saved: $(( (oldSize-newSize)/1024/1024 )) MB"
    else
        rm "$OUTPUT/temp.mp4"
        cp "$f" "$OUTPUT/${filename%.mp4}_Original.mp4"
        echo "   ⚠️  Kept Original (Larger size)"
    fi
done
