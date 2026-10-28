class StartpoziBrowser < Formula
  desc "The safe private browser"
  homepage "https://github.com/StartPOZI/StartPOZI-Desktop-Browser"
  url "https://github.com/StartPOZI/StartPOZI-Desktop-Browser/releases/download/v1.0.1/StartPOZI.Browser-1.0.1.AppImage"
  sha256 "b6b9a08b079fdc90e11361deba17b1522d12b7a751d9948390716c10c54bb1f6"
  version "1.0.1"

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
