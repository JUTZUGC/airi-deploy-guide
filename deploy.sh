#!/usr/bin/env bash
set -euo pipefail
# AIRI 桌面安装包脚本（第三方指南）——按官方文档封装
# 官方文档：https://airi.moeru.ai/docs/
# 更新日期：2026-10-27
# 类型：binary
cd "$(dirname "${BASH_SOURCE[0]}")"

command -v curl >/dev/null 2>&1 || { echo "需要先安装 curl"; exit 1; }

mkdir -p .download
cd .download

if [ "$(uname -s)" = "Darwin" ]; then url=https://github.com/moeru-ai/airi/releases/download/v0.12.0/AIRI-0.12.0-darwin-arm64.dmg ; want=ca547a39394594f2b08d4811454063a943c9c30c8c82ab84cfa80647e8632179 ; curl -fL -o airi.dmg "$url" ; echo "$want  airi.dmg" | shasum -a 256 -c - ; open airi.dmg ; else url=https://github.com/moeru-ai/airi/releases/download/v0.12.0/AIRI-0.12.0-linux-amd64.deb ; want=6a6644d6c586e914a96d4416758ebfaddfb8d240ccc3c35502249983f101a486 ; curl -fL -o airi.deb "$url" ; echo "$want  airi.deb" | sha256sum -c - ; sudo dpkg -i airi.deb || sudo apt-get install -f -y ; fi
echo '安装完成：启动 AIRI，在设置里配置模型与语音服务'

echo ""

echo "部署完成：启动 AIRI 后在设置里填模型与语音服务；浏览器版可直接打开 airi.moeru.ai 试用"
echo "若结果异常或需要改配置，请参考官方文档：https://airi.moeru.ai/docs/"
