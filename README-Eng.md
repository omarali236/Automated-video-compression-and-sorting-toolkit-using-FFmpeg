(translated from arabic to eng)
Video-Compression-Toolkit
Video Processing Toolkit

Welcome to the "Video Grinder". This repository contains powerful scripts to automate video compression and organization, whether you're using a mobile device (Termux) or a PC (Windows).

📱 Android (Termux)

These scripts are optimized to run at maximum performance using your device’s built-in hardware acceleration.

🔧 Step 0: Environment Setup

Before running any script, open Termux (you can install it from F-Droid) and execute the following commands:

# 1. Update packages
pkg update && pkg upgrade -y

# 2. Install FFmpeg
pkg install ffmpeg -y

# 3. Grant storage access (press Allow when prompted)
termux-setup-storage
⚙️ Notes
If your phone supports it, use AV1 encoding for better compression efficiency.
Otherwise, use HEVC (H.265) for faster performance.
💻 Windows

If you prefer using your PC’s processing power, you have two tools:

1. Smart Compressor (compress.bat) – CPU
Uses the x265 codec with optimized settings to reduce file size while preserving quality.
Automatically organizes output files into a folder called Finished.
If the compressed file ends up larger than the original, the original file is renamed with _Original.
2. Video Sorter (filter.bat)
Uses ffprobe to detect the codec of each video file.
Automatically sorts videos into folders based on codec type (e.g., all H.264 videos in one folder).
⚡ Notes
CPU scripts are included by default.
GPU-based versions may be added later for faster processing.
You may need to manually adjust file paths (input/output) depending on your setup.
