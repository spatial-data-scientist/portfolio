@echo off
setlocal enabledelayedexpansion

:: Set the root folder where your themes are located
set "ROOT=C:\portfolio\themes"

:: Loop through each theme directory
for /d %%i in ("%ROOT%\*") do (
    echo Updating SCSS files in theme directory: %%i

    :: Find all .scss files in the theme directory
    for /r "%%i" %%f in (*.scss) do (
        echo Adding global import to %%f
        (
            echo @import "../../node_modules/include-media/dist/_include-media.scss";
            type "%%f"
        ) > "%%f.tmp"
        move /y "%%f.tmp" "%%f"
    )
)
endlocal
