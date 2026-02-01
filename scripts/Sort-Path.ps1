# Sort-Path.ps1
# 获取当前用户 Path 变量
$pathType = "User" 
$rawPath = [Environment]::GetEnvironmentVariable("Path", $pathType)

# 拆分、去除空格、验证路径是否存在、去重并排序
$pathList = $rawPath -split ";" | ForEach-Object { $_.Trim() } | Where-Object { 
    $_ -ne "" -and (Test-Path $_) 
} | Select-Object -Unique | Sort-Object

# 拼接新路径
$newPath = $pathList -join ";"

# 预览排序结果
Write-Host "--- 排序后的路径预览 ---" -ForegroundColor Cyan
$pathList | Out-String

# 如需正式写入，请取消下面一行的注释并以管理员权限运行
# [Environment]::SetEnvironmentVariable("Path", $newPath, $pathType)