# AIRI 桌面安装包脚本（第三方指南）——按官方文档封装
# 官方文档：https://airi.moeru.ai/docs/
# 更新日期：2026-10-28
# 类型：binary
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Get-Command curl.exe -ErrorAction SilentlyContinue)) { throw '需要先安装 curl（Windows 10+ 自带 curl.exe）' }

New-Item -ItemType Directory -Force -Path .download | Out-Null
Set-Location -Path .download

$exe = 'AIRI-0.13.0-windows-x64-setup.exe'
curl.exe -L --fail -o $exe "https://github.com/moeru-ai/airi/releases/download/v0.13.0/$exe"
if ((Get-FileHash $exe -Algorithm SHA256).Hash.ToLower() -ne 'c958373e2ea415424e4f9d147f3cc9ffa30f29b0bd5d058ebea7f46f8006e18a') { throw 'SHA256 校验失败，请重新下载' }
Write-Host 'SHA256 校验通过'
Start-Process -FilePath (Join-Path $PWD $exe)

Write-Host ''

Write-Host '部署完成：启动 AIRI 后在设置里填模型与语音服务；浏览器版可直接打开 airi.moeru.ai 试用'
Write-Host '若结果异常或需要改配置，请参考官方文档：https://airi.moeru.ai/docs/'
