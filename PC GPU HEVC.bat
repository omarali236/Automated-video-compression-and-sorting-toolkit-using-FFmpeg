@echo off
setlocal enabledelayedexpansion

if not exist "Finished_GPU" mkdir "Finished_GPU"
set /a count=0
set /a total=0
for %%a in (*.mp4) do set /a total+=1

echo ==================================================
echo [ GPU Mode: HEVC NVENC - High Speed ]
echo ==================================================

for %%f in (*.mp4) do (
    set /a count+=1
    echo Processing [!count! / !total!]: %%f
    set "oldSize=%%~zf"
    
    :: استخدام كرت الشاشة NVENC لضغط HEVC
    ffmpeg -v quiet -stats -i "%%f" -c:v hevc_nvenc -preset p4 -cq 28 -c:a copy "Finished_GPU\temp_%%~nf.mp4"
    
    for %%I in ("Finished_GPU\temp_%%~nf.mp4") do set "newSize=%%~zI"
    
    if !newSize! LSS !oldSize! (
        move /y "Finished_GPU\temp_%%~nf.mp4" "Finished_GPU\%%~nf.mp4" >nul
        echo [SUCCESS] Size reduced.
    ) else (
        del "Finished_GPU\temp_%%~nf.mp4"
        copy /y "%%f" "Finished_GPU\%%~nf_Original.mp4" >nul
        echo [SKIPPED] Original was smaller.
    )
)
pause
