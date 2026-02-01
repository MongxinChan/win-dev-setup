@echo off
:: 设置目标路径
set TARGET_DIR=F:\Tool\Microsoft VS Code

echo [*] 正在为 VS Code 开启便携模式...

:: 1. 创建 data 文件夹，VS Code 检测到它后会将插件和配置存入其中
if not exist "%TARGET_DIR%\data" (
    mkdir "%TARGET_DIR%\data"
    echo [+] 已在 %TARGET_DIR% 创建 data 文件夹
)

:: 2. 提示用户手动迁移现有插件 (防止脚本暴力搬运导致文件损坏)
echo [!] 请手动将 C:\Users\%USERNAME%\.vscode\extensions 移动到 %TARGET_DIR%\data\
echo [!] 请手动将 C:\Users\%USERNAME%\AppData\Roaming\Code 移动到 %TARGET_DIR%\data\并重命名为 user-data

pause