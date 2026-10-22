# Generated from hldb build.json; update with the source repository's distribution command.
class Hldb < Formula
  desc "HeimLink debug bridge for app logs and paired device control"
  homepage "https://github.com/International-IoT-Association/tools"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/International-IoT-Association/tools/releases/download/debug-bridge-v0.3.0/hldb-darwin-arm64", using: :nounzip
      sha256 "0fbb12968af3d9811c58a915a400790ad58ab5912472322c45d5b1b3981ce0d7"
    end
    on_intel do
      url "https://github.com/International-IoT-Association/tools/releases/download/debug-bridge-v0.3.0/hldb-darwin-x64", using: :nounzip
      sha256 "70eefeb91b41cc27fc1073e11529f6c35491cb77499521ae8a55a3c090d039a0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/International-IoT-Association/tools/releases/download/debug-bridge-v0.3.0/hldb-linux-arm64", using: :nounzip
      sha256 "40cbf653aaa6c5e49cb592461fb61e200413a00afaa5d2666b7c3cf6524c6108"
    end
    on_intel do
      url "https://github.com/International-IoT-Association/tools/releases/download/debug-bridge-v0.3.0/hldb-linux-x64", using: :nounzip
      sha256 "9cbad299257b8f2cbd2dbd090ab1c2286783ace5198777c7ee350776fa9e2680"
    end
  end

  def install
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "x64"
    bin.install "hldb-#{os}-#{arch}" => "hldb"
    (bin/"hldb").chmod 0755
  end

  def caveats
    <<~EOS
      运行 hldb start 后，用 HeimLink App 扫码接入。
      安装或更新 Agent skill：
        hldb skills install --force
        hldb skills install --name heimlink-device-control --force
      其它 Agent 使用 --dir 指定技能根目录。
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/hldb --version").strip
    system bin/"hldb", "device", "--help"
  end
end
