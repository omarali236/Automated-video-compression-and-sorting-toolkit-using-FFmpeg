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
- ffprobe (included with FFmpeg)

---

## 📱 Android (Termux)

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

### 1. Smart Compressor (CPU)

- Compresses videos in the same folder
- Uses **x265 (HEVC)** codec
- Outputs to `Finished/`
- If compressed file is larger → keeps original as `_Original`

---

### 2. Video Sorter (filter.bat)

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

### Sorting Script
- Detects codec
- Sorts automatically into folders

---

## 📊 Example

Before:
movie.mp4 → 500MB

After:
Finished/movie.mp4 → 120MB

---

## 🛣️ Roadmap

- GPU acceleration (NVENC / MediaCodec)
- AV1 optimization
- GUI version
- Compression statistics

---

## ⚠️ Notes

- You may need to edit input/output paths
- Current version uses CPU

---

## ⭐ Support

If you like this project, give it a star ⭐


## ▶️ Usage

### Windows
```bash
compress.bat
filter.bat

bash compress.sh
