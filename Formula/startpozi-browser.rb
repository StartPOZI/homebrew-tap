class StartpoziBrowser < Formula
  desc "The safe private browser"
  homepage "https://github.com/StartPOZI/StartPOZI-Desktop-Browser"
  url "https://github.com/StartPOZI/StartPOZI-Desktop-Browser/releases/download/v1.0.0/StartPOZI.Browser-1.0.0.AppImage"
  sha256 "ddb505dc027bad17ef47217bfe2b991791818c675bb1f1ba6517d18eb09275fd"
  version "1.0.0"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  def install
    # имя файла — как называет asset GitHub (пробелы заменены точками)
    bin.install "StartPOZI.Browser-1.0.0.AppImage" => "startpozi-browser"
  end

  def caveats
    <<~EOS
      AppImage требует FUSE во время запуска. На системах без FUSE:
        startpozi-browser --appimage-extract-and-run
      Для поддержки Tor поставьте tor рядом:
        brew install tor
    EOS
  end

  test do
    assert_predicate bin/"startpozi-browser", :executable?
  end

  # При каждом релизе обновлять: version, url и sha256
  # (sha256: shasum -a 256 "StartPOZI Browser-<ver>.AppImage")
end
