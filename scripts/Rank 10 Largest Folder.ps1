# 扫描用户目录下最大的 10 个文件夹
$UserPath = "C:\Users\%USERNAME%\AppData"
Write-Host "正在扫描 AppData 空间占用，请稍候..." -ForegroundColor Cyan

Get-ChildItem -Path $UserPath -Directory -Recurse -ErrorAction SilentlyContinue | 
    Select-Object FullName, @{Name="SizeGB";Expression={(Get-ChildItem $_.FullName -Recurse -File -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum / 1GB}} | 
    Sort-Object SizeGB -Descending | 
    Select-Object -First 10 | 
    Format-Table -AutoSize