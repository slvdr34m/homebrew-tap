class Arthas < Formula
  desc "Java diagnostic tool for troubleshooting production JVMs"
  homepage "https://arthas.aliyun.com/"
  url "https://github.com/alibaba/arthas/releases/download/arthas-all-4.3.5/arthas-bin.zip"
  version "4.3.5"
  sha256 "f4ea8e4ab4bb20a9925c21780bfb91331e73968eae881fd89b855cccaad21f1c"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
    regex(/arthas[._-]all[._-]v?(\d+(?:\.\d+)+)/i)
  end

  depends_on "openjdk"

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"as.sh"

    # as.sh resolves symlinks (rreadlink) and uses its own directory as
    # ARTHAS_HOME when the jars sit next to it, so nothing is ever downloaded
    # into ~/.arthas at runtime.
    bin.install_symlink libexec/"as.sh" => "arthas"
    bin.install_symlink libexec/"as.sh" => "as.sh"
  end

  def caveats
    <<~EOS
      Arthas 4 requires JDK 8+ and attaches with the JDK that JAVA_HOME points at.
      To attach to a process running on another JDK:
        JAVA_HOME=$(/usr/libexec/java_home -v 1.8) arthas <pid>

      Check for a new upstream release and update this formula with:
        brew arthas-update
    EOS
  end

  test do
    assert_match "Arthas script version: #{version}", shell_output("#{bin}/arthas --help")
  end
end
