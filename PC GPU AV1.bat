@echo off
setlocal enabledelayedexpansion

if not exist "Finished_AV1" mkdir "Finished_AV1"
set /a count=0
set /a total=0
for %%a in (*.mp4) do set /a total+=1

echo ==================================================
echo [ GPU Mode: AV1 NVENC - Future Tech ]
echo ==================================================

for %%f in (*.mp4) do (
    set /a count+=1
    echo Processing [!count! / !total!]: %%f
    set "oldSize=%%~zf"
    
    :: استخدام كرت الشاشة لضغط AV1
    ffmpeg -v quiet -stats -i "%%f" -c:v av1_nvenc -preset p4 -cq 32 -c:a copy "Finished_AV1\temp_%%~nf.mp4"
    
    for %%I in ("Finished_AV1\temp_%%~nf.mp4") do set "newSize=%%~zI"
    
    if !newSize! LSS !oldSize! (
        move /y "Finished_AV1\temp_%%~nf.mp4" "Finished_AV1\%%~nf.mp4" >nul
        echo [SUCCESS] AV1 compression complete.
    ) else (
        del "Finished_AV1\temp_%%~nf.mp4"
        copy /y "%%f" "Finished_AV1\%%~nf_Original.mp4" >nul
        echo [SKIPPED] Kept original.
    )
)
pause
