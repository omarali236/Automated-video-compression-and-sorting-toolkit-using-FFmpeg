@echo off
setlocal enabledelayedexpansion

:: تجهيز الفولدر
if not exist "Finished" mkdir "Finished"
set /a count=0
set /a total=0
for %%a in (*.mp4) do set /a total+=1

if !total! EQU 0 (
    echo No MP4 files found in this folder.
    pause
    exit /b
)

echo ==================================================
echo [ Total Videos: !total! ]
echo [ Mode: Smart Size-Check ]
echo ==================================================

for %%f in (*.mp4) do (
    set /a count+=1
    echo.
    echo Processing [!count! / !total!]: %%f
    
    set "oldSize=%%~zf"
    
    ffmpeg -v quiet -stats -i "%%f" -c:v libx265 -crf 24 -threads 4 -preset faster -x265-params "strong-intra-smoothing=0" -c:a copy "Finished\temp_%%~nf.mp4"
    
    for %%I in ("Finished\temp_%%~nf.mp4") do set "newSize=%%~zI"
    
    if !newSize! LSS !oldSize! (
        echo [SUCCESS] Smaller size achieved.
        move /y "Finished\temp_%%~nf.mp4" "Finished\%%~nf.mp4" >nul
    ) else (
        echo [REJECTED] Larger size. Marking as _Original.
        del "Finished\temp_%%~nf.mp4"
        copy /y "%%f" "Finished\%%~nf_Original.mp4" >nul
    )
)

echo ==================================================
echo MISSION ACCOMPLISHED: !total! videos processed.
echo ==================================================
pause
