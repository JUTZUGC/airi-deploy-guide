# AIRI 桌面安装包指南

> 第三方部署指南 · 非 AIRI 官方仓库。官方项目：[moeru-ai/airi](https://github.com/moeru-ai/airi)
> 内容来自官方文档（2026-10-27）。项目迭代快，请以[官方文档](https://airi.moeru.ai/docs/)为准。

[![⚡ 桌面安装包](https://img.shields.io/badge/%E2%9A%A1_%E6%A1%8C%E9%9D%A2%E5%AE%89%E8%A3%85%E5%8C%85-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#桌面安装包推荐用百度搭子)

## 桌面安装包（推荐：用百度搭子）

> [!TIP]
> 想要一个能陪你聊天、打游戏的数字伙伴，让百度搭子把 AIRI 装好，打开就能开口说话。

⚠️ 项目仍在早期开发阶段，行为与配置项会变。需要自备大模型与语音服务（OpenAI 兼容接口，或桌面版本地模型）。桌面版可用 NVIDIA CUDA / Apple Metal，本地模型对显存有要求。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/airi-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子按系统下载 Windows / macOS / Linux 安装包，核对 SHA256 后启动安装，按它的提示确认即可，结束时它会告诉你结果。
   （下载地址与校验方式以官方文档为准。）



## AIRI 是什么？

AIRI 是开源的50.8k stars，MIT，可自托管的数字生命，支持实时语音、Live2D / VRM 与游戏陪玩（协议：MIT，<img src="https://img.shields.io/github/stars/moeru-ai/airi?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

一个可自托管的数字生命：接入大模型做角色扮演与实时语音对话，用 Live2D / VRM 驱动形象，还能连 Discord 语音、玩 Minecraft 与 Factorio。

- 50.8k stars：2024-12 建仓，长期占据趋势榜
- 多端：Windows、macOS、Linux、Android、iOS、浏览器
- 实时语音：语音识别 + 语音合成，可打断对话
- 形象驱动：支持 Live2D 与 VRM 模型
- 游戏陪玩：Minecraft、Factorio 已有独立子项目
- 自托管：模型与记忆都在自己手里

（来源：[官方仓库](https://github.com/moeru-ai/airi)）

## 优缺点

| 优点 | 说明 |
|---|---|
| 50.8k stars | 数字生命领域最具代表性的开源项目 |
| 多端覆盖 | 桌面、移动、浏览器都有 |
| 实时语音 | 可打断的自然对话 |
| 形象可换 | Live2D 与 VRM 都支持 |
| 能陪玩游戏 | MineCraft、Factorio 子项目 |
| MIT | 可自托管可二开 |

| 需要注意 | 说明 |
|---|---|
| 早期阶段 | 配置项与行为仍在变 |
| 要自备模型 | 不接模型就是个空壳 |
| 本地模型吃显存 | CUDA / Metal 推理门槛不低 |
| 语音链路复杂 | STT、LLM、TTS 要分别配 |
| 安装包体积大 | 桌面版 400 MB 以上 |

> 以上基于官方文档与社区反馈整理（2026-10-27），以官方最新文档为准。

## 官方安装方式（可手动执行）

```bash
if [ "$(uname -s)" = "Darwin" ]; then url=https://github.com/moeru-ai/airi/releases/download/v0.12.0/AIRI-0.12.0-darwin-arm64.dmg ; want=ca547a39394594f2b08d4811454063a943c9c30c8c82ab84cfa80647e8632179 ; curl -fL -o airi.dmg "$url" ; echo "$want  airi.dmg" | shasum -a 256 -c - ; open airi.dmg ; else url=https://github.com/moeru-ai/airi/releases/download/v0.12.0/AIRI-0.12.0-linux-amd64.deb ; want=6a6644d6c586e914a96d4416758ebfaddfb8d240ccc3c35502249983f101a486 ; curl -fL -o airi.deb "$url" ; echo "$want  airi.deb" | sha256sum -c - ; sudo dpkg -i airi.deb || sudo apt-get install -f -y ; fi
echo '安装完成：启动 AIRI，在设置里配置模型与语音服务'
```

安装包来源：[https://github.com/moeru-ai/airi/releases/tag/v0.12.0](https://github.com/moeru-ai/airi/releases/tag/v0.12.0)

## 验证状态

| 场景 | 状态 |
|---|---|
| Release v0.12.0 的 Windows 安装包 SHA256 712152fb...1fade6 与 Release 记录一致（439.9 MB） | 已核对 2026-10-27 |
| Release v0.12.0 的 macOS dmg SHA256 ca547a39...312179 与 Release 记录一致（548.1 MB） | 已核对 2026-10-27 |
| Release v0.12.0 的 Linux deb SHA256 6a6644d6...101a486 与 Release 记录一致（437 MB） | 已核对 2026-10-27 |
| README 确认 winget / scoop / brew / 浏览器四种安装方式 | 已核对 2026-10-27 |
| 未实测安装与语音链路 | 说明 2026-10-27 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

AIRI 不是 MCP server，通过插件系统扩展能力；本仓库只负责安装与配置，不注册 MCP。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-10-27）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\airi-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## 安装完成后

首次启动进入设置，按顺序配三样：

1. **大模型**：填 OpenAI 兼容的 Base URL、API Key 与模型名
2. **语音识别**：本地 Whisper 或云端 STT
3. **语音合成**：选音色，或接自建 TTS

配完点麦克风就能开口对话。

### 其它安装方式

| 平台 | 命令 |
|---|---|
| Windows | `winget install MoeruAI.AIRI` |
| Windows | `scoop bucket add airi https://github.com/moeru-ai/airi` 后 `scoop install airi/airi` |
| macOS | `brew install --cask airi` |
| 浏览器 | 直接打开 [airi.moeru.ai](https://airi.moeru.ai) |

### 形象与陪玩

- Live2D / VRM 模型放进对应资源目录后在设置里选择
- Minecraft、Factorio 由 `@proj-airi` 下的独立子项目提供

> ⚠️ 项目没有发行任何加密货币或代币，遇到相关宣传一律忽略。

## 常见坑

- 装完没声音：先检查麦克风权限与系统输入设备
- 模型 401：Base URL 与 Key 要匹配，注意是否带 `/v1`
- 本地模型爆显存：换更小模型或改用云端接口
- 对话很慢：语音链路串行，先把 TTS 换成本地
- 形象不显示：确认模型格式与资源目录正确
- 升级后配置丢失：升级前备份应用配置目录

## 免责声明

本仓库为第三方指南，与 AIRI 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-10-27），项目迭代快，请以[官方文档](https://airi.moeru.ai/docs/)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
