# hldb

hldb 汇聚 HeimLink App 与串口日志，并经 App 操作已配对设备。
当前版本：0.3.0。源码构建提交：4e37d13b。

## macOS / Linux

先安装 [Homebrew](https://brew.sh)，然后运行：

```bash
brew tap heimlink/tools https://github.com/International-IoT-Association/tools
brew install heimlink/tools/hldb
hldb version
hldb start
```

升级：`brew upgrade hldb`。卸载：`brew uninstall hldb`。
macOS 支持 Apple Silicon 和 Intel；Linux 支持 ARM64 和 x86-64（glibc 环境）。

## Windows

先安装 [Scoop](https://scoop.sh)，然后运行：

```powershell
scoop bucket add heimlink https://github.com/International-IoT-Association/tools
scoop install heimlink/hldb
hldb version
hldb start
```

升级：`scoop update hldb`。卸载：`scoop uninstall hldb`。当前提供 Windows x64 二进制。

## App 与 Agent 接入

手机与电脑使用同一局域网。启动后选择是否读取串口日志，多端口时按编号选择。
在 HeimLink App 的“设置”中连点版本号 7 次，进入“开发者选项 → 调试桥”，扫描启动时显示的二维码。
工具输出不可见时使用 `hldb start --no-serial --qr image` 打开系统图片预览。

二进制自带运行时，不需要安装 Node.js 或 Bun。安装或升级后，同步 Agent skill：

```bash
hldb skills install --force
hldb skills install --name heimlink-device-control --force
```

默认安装到 Claude Code 的技能目录。其它 Agent 使用 `--dir` 指定技能根目录。
配置与日志保存在 `~/.hl-debug-bridge`，升级和卸载程序不会删除这些数据。
设备控制需要支持 device-control-v1 的 App，并在手机前台的设备列表确认授权。

## 版本与校验

[Release](https://github.com/International-IoT-Association/tools/releases) 提供各平台程序、`SHA256SUMS`、`build.json` 和使用说明。
安装清单引用固定版本和 SHA256。程序不会自行更新；由包管理器执行升级。
