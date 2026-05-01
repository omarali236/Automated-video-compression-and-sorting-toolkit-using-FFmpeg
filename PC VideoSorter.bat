@echo off
setlocal enabledelayedexpansion

:: الأداة دي بتشتغل في نفس الفولدر اللي هي فيه
set "SRC=%~dp0"
set "DEST=%~dp0Sorted_Videos"

if not exist "%DEST%" mkdir "%DEST%"

for %%F in (*.mp4 *.mkv *.avi) do (
    echo Processing: %%F
    
    for /f "delims=" %%C in ('ffprobe -v error -select_streams v:0 -show_entries stream^=codec_name -of default^=noprint_wrappers^=1:nokey^=1 "%%F"') do (
        set "codec=%%C"
    )

    if not "!codec!"=="" (
        if not exist "%DEST%\!codec!" mkdir "%DEST%\!codec!"
        move "%%F" "%DEST%\!codec!\"
    )
)

echo Done sorting videos.
pause
