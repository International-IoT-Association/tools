# 开发工具软件源

公司开发工具的安装清单与二进制分发仓库。各工具源码在各自仓库维护。

## 接入软件源

macOS / Linux 使用 [Homebrew](https://brew.sh)：

```bash
brew tap heimlink/tools https://github.com/International-IoT-Association/tools
```

Windows 使用 [Scoop](https://scoop.sh)：

```powershell
scoop bucket add heimlink https://github.com/International-IoT-Association/tools
```

软件源只需添加一次。工具的安装、升级和使用说明随各工具发布。

## 工具目录

| 工具 | 用途 | 支持平台 | 使用说明 |
|---|---|---|---|
| hldb | HeimLink App 与串口日志、已配对设备控制 | macOS ARM64/x64、Linux ARM64/x64、Windows x64 | [安装与使用](docs/hldb.md) |

安装 hldb：

```bash
# macOS / Linux
brew install heimlink/tools/hldb
```

```powershell
# Windows
scoop install heimlink/hldb
```

升级使用 `brew upgrade hldb` 或 `scoop update hldb`。

## 维护规则

- `Formula/` 保存 macOS / Linux 命令行工具的 Homebrew Formula。
- `Casks/` 用于 macOS 桌面应用的 Homebrew Cask，按需添加。
- `bucket/` 保存 Windows 工具的 Scoop manifest。
- `docs/<工具>.md` 保存安装与使用说明，`licenses/<工具>.txt` 保存对应许可。
- 每个工具独立发布版本。Release tag 包含工具名称，安装清单固定版本和 SHA256。
- 先发布 Release 附件，再更新安装清单，避免出现无法下载的安装地址。
- 工具生成器只更新该工具的文件。共享首页由维护者更新。
- 本仓库公开。新增工具时单独确定其分发范围；公司内部使用不代表其二进制可以公开。
