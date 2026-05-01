# 📘 Scripts Detailed Explanation

## VideoSorter.bat

### How it works:
- Scans all videos in current folder
- Uses ffprobe to detect codec
- Moves each file into a folder named after its codec
- Creates main folder: Sorted_Videos

### Result:
Clean and organized video library

---

## Compress CPU Script (compress.bat)

### How it works:
- Compresses videos in the same folder
- Outputs to Finished folder
- Uses x265 codec

### Smart Logic:
- If compressed file is larger than original:
  - Deletes compressed version
  - Copies original instead
  - Renames it with _Original

---

## Termux Scripts (.sh)

- Same idea as Windows scripts
- Optimized for mobile performance
- Uses FFmpeg with hardware acceleration when possible

---

## Future Improvements

- GPU support for mobile
- GPU support for PC
- Faster AV1 encoding
