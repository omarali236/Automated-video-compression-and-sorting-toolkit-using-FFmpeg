#(translated from arabic to eng)

Video-Compression-Toolkit
Video Processing Toolkit

Welcome to the "Video Grinder". This repository contains powerful scripts to automate video compression and sorting, whether you're using a mobile device (Termux) or a computer (Windows).

📱 Android (Termux)

These scripts are designed to run at maximum performance using your phone’s built-in hardware acceleration.

🔧 Step 0: Environment Setup

Before running any script, open Termux (you can install it from F-Droid) and run the following commands in order:

# 1. Update packages
pkg update && pkg upgrade -y

# 2. Install FFmpeg
pkg install ffmpeg -y

# 3. Grant storage access (press Allow when prompted)
termux-setup-storage
⚙️ Notes
Later, you can use AV1 scripts if your device supports it.
Otherwise, use HEVC (H.265) for faster performance.
💻 Windows

If you prefer using your PC’s processing power, you have two tools:

1. PC Compress (CPU)
Uses the x265 codec with smart settings to reduce file size while maintaining quality.
Automatically organizes your work into a folder called Finished.
If the compressed file ends up larger than the original, it deletes the new file and copies the original into the Finished folder with _Original added to its name.
2. Video Sorter (filter.bat)
A powerful tool that uses ffprobe to detect the codec of each video.
Automatically sorts videos into folders based on codec type (e.g., all H.264 videos go into one folder).
🧠 How the Scripts Work
📂 VideoSorter.bat
Scan: The script scans all videos in its current folder.
Detection: Uses ffprobe to identify each video's codec.
Sorting: Moves each file into a folder named after its codec (e.g., H264, HEVC) inside a main folder called Sorted_Videos.
Result: Clean, well-organized video library.
💻 Compress CPU Script (Compress cpu.bat)
Location: Compresses any video in the same folder where the script is located.
Output: Creates a folder named Finished and saves compressed videos there.
Smart Logic: If the compressed file is larger than the original, it deletes the new file and keeps the original with _Original added to its name.
⚡ Additional Notes
Windows scripts currently use CPU processing.
GPU versions for faster performance will be added later.
You may need to manually edit file paths (input/output) depending on your setup.
📱 Termux Scripts
Same idea applies using .sh scripts for Termux.
GPU-based mobile scripts will also be added.
GPU support for PC will be added soon as well.
