# Mklink-Helper.ps1
# 示例：将某个 AppData 目录映射到 D 盘

$source = "$env:USERPROFILE\AppData\Local\LargeFolder"
$destination = "D:\03_Software\Cache\LargeFolder"

# 逻辑：
# 1. 确保目标文件夹（D 盘）已存在
# 2. 剪切原文件夹内容到目标位置
# 3. 在原位置创建 Junction 链接

Write-Host "使用说明：请以管理员权限运行，并根据需要修改脚本内的路径变量。" -ForegroundColor Yellow
# 命令示例:
# mklink /j "$source" "$destination"