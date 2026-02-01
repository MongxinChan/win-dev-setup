# 优化后的路径迁移逻辑
$CurrentUserName = $env:USERNAME
$BaseSourcePath = "C:\Users\$CurrentUserName"

# 迁移函数
function Move-To-D($folderName, $targetBase = "D:\03_Software") {
    $src = Join-Path $BaseSourcePath $folderName
    $dest = Join-Path $targetBase $folderName
    
    if (Test-Path $src) {
        Write-Host "正在迁移: $folderName" -ForegroundColor Cyan
        if (!(Test-Path $dest)) { New-Item -ItemType Directory -Path $dest -Force }
        Move-Item -Path "$src\*" -Destination $dest -Force -ErrorAction SilentlyContinue
        Remove-Item -Path $src -Recurse -Force
        New-Item -ItemType Junction -Path $src -Target $dest
    }
}

# 执行迁移
Move-To-D -folderName ".gradle"
Move-To-D -folderName "AppData\Local\Microsoft\vscode-cpptools"