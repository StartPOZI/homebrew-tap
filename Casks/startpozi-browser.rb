cask "startpozi-browser" do
  version "1.0.0"
  sha256 "c0b8086e36bba8cb2214decc6d319c4fb519bb5875c8c03321c14b443bc74ab0"

  # GitHub нормализует имена asset'ов: пробелы → точки, поэтому в URL
  # «StartPOZI Browser» превращается в «StartPOZI.Browser» (URL с %20 — 404).
  url "https://github.com/StartPOZI/StartPOZI-Desktop-Browser/releases/download/v#{version}/StartPOZI.Browser-#{version}-mac.zip"
  name "StartPOZI Browser"
  desc "The safe private browser"
  homepage "https://github.com/StartPOZI/StartPOZI-Desktop-Browser"

  # LSMinimumSystemVersion из Info.plist приложения
  depends_on macos: :monterey

  app "StartPOZI Browser.app"

  # Сборка x64-only: на Apple Silicon запускается через Rosetta 2.
  #
  # Артефакт релиза пока НЕ подписан (собран вне macOS), поэтому ставьте
  # без quarantine-атрибута, иначе Gatekeeper заблокирует запуск:
  #   brew install --cask --no-quarantine startpozi/tap/startpozi-browser
  #
  # Когда появится сборка с codesign + notarization на macOS, уберите
  # подсказку про --no-quarantine отсюда и из README tap'а.
  #
  # При каждом релизе обновлять: version + sha256
  # (sha256: shasum -a 256 "StartPOZI Browser-<ver>-mac.zip")
end
