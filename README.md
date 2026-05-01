# 🚀 Video Compression Toolkit
### Automated Video Compression & Sorting (FFmpeg Powered)


![FFmpeg](https://img.shields.io/badge/Powered%20by-FFmpeg-blue)
![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20Termux-green)
![License](https://img.shields.io/badge/License-MIT-yellow)

## Why this tool?

- Saves up to 60–80% storage
- Fully automated workflow
- Works on both mobile (Termux) and PC (Windows)

A powerful toolkit to **compress, organize, and manage videos automatically** using FFmpeg.  
Supports both **Android (Termux)** and **Windows** for flexible workflows.

---

## ✨ Features

- ⚡ Batch video compression (automatic processing)
- 📂 Smart video sorting by codec (H264 / HEVC / AV1)
- 📱 Full support for Termux (Android)
- 💻 Windows automation scripts
- 🧠 Smart logic: keeps original if compression is inefficient
- 🎯 Optimized for performance and storage saving

---

## 📦 Requirements

- FFmpeg  
- ffprobe (included with FFmpeg) just extrect .exe copy them to system32 on windows 
https://ffmpeg.org/download.html
---

## 📱 Android (Termux)
https://f-droid.org/packages/com.termux/

### Setup

```bash
pkg update && pkg upgrade -y 
pkg install ffmpeg -y
termux-setup-storage
```

### Notes
- Use **AV1** if your device supports it (better compression)
- Use **HEVC (H.265)** for faster encoding

---

## 💻 Windows 

### 1. Smart Compressor (CPU) (PC Compress cpu)

- Compresses videos in the same folder
- Uses **x265 (HEVC)** codec
- Outputs to `Finished/`
- If compressed file is larger → keeps original as `_Original`

---

### 2. Video Sorter (PC VideoSorter.bat)

- Scans videos in folder
- Uses **ffprobe** to detect codec
- Moves files into:

```
Sorted_Videos/
 ├── H264/
 ├── HEVC/
 └── AV1/
```

---

## ⚙️ How It Works

### Compression Script
- Scans folder
- Compresses videos
- Saves to `Finished/`
- Applies smart size check

### Sorting Script (PC VideoSorter)
- Detects codec
- Sorts automatically into folders

---

## 📊 Example

Before:
movie.mp4 → 500MB

After:
Finished/movie.mp4 → 120MB
the is also for who have 11gen or higer cpu can use (PC GPU HEVC.bat) or for  rtx4050 gpus or higer use PC (GPU AV1.bat)

---

## 🛣️ Roadmap

- GPU acceleration (NVENC / MediaCodec)
- AV1 optimization
- GUI version
- Compression statistics

---

## ⚠️ Notes or using

- You may need to edit input/output paths for .sh files copy past or save them on ur termux u can search in youtube 
- Current version of .sh uses gpu u better cheak your phone cpu support codecs 
- on android just give premison instal update and ffmpg and the use .sh file or copy and past or edit path of videos them depend in your need
- on pc for sort or compress just copy the .bat file on video folders
---
# my bat or sh for me was very usfel it compress 60% of my videos
i was have 30gb of vidoes shorts now they 18gb 
if u want edit any value of cocdec for low qaulity and lower size u can ask any ai tool it will explain i use my optmized setings for my eye <3. 
andddddddd i just share usage after long day.

## ⭐ Support

If you like this project, give it a star ⭐
