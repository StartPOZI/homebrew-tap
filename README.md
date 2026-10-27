# StartPOZI Homebrew Tap

Homebrew-tap для браузера StartPOZI: **cask** для macOS + **formula** для Linux.

## Установка (macOS)

```bash
brew tap startpozi/tap https://github.com/StartPOZI/homebrew-tap
brew trust startpozi/tap   # обязательно в Homebrew ≥ 4.5 для сторонних tap'ов
brew install --cask --no-quarantine startpozi-browser
```

> `--no-quarantine` нужен, пока релизная сборка не подписана
> (codesign + notarization). После запуска файла без quarantine
> первый старт: ПКМ по приложению → «Открыть».

## Установка (Linux / Linuxbrew)

```bash
brew tap startpozi/tap https://github.com/StartPOZI/homebrew-tap
brew trust startpozi/tap
brew install --formula startpozi/tap/startpozi-browser
```

Formula ставит AppImage в `bin/startpozi-browser`. Требования:
- FUSE при запуске (или флаг `--appimage-extract-and-run`);
- для Tor: `brew install tor` (браузер найдёт его через PATH).

## Обновление

```bash
brew update
brew upgrade --cask startpozi-browser      # macOS
brew upgrade startpozi-browser             # Linux
```

## Публикация новой версии (для мейнтейнеров)

1. Опубликовать GitHub Release с тегом `v<version>` и файлами
   `StartPOZI Browser-<version>-mac.zip` и `StartPOZI Browser-<version>.AppImage`
   в репозитории [StartPOZI/StartPOZI-Desktop-Browser](https://github.com/StartPOZI/StartPOZI-Desktop-Browser).
   GitHub сам заменит пробелы точками: asset'ы будут называться
   `StartPOZI.Browser-<version>-mac.zip` и `StartPOZI.Browser-<version>.AppImage` —
   именно эти имена в cask и formula.
2. Обновить `Casks/startpozi-browser.rb`: `version`, `sha256`
   (`shasum -a 256 "StartPOZI Browser-<version>-mac.zip"`).
3. Обновить `Formula/startpozi-browser.rb`: `version`, `url` и `sha256`
   (`shasum -a 256 "StartPOZI Browser-<version>.AppImage"`).
4. Закоммитить и запушить в этот репозиторий.

## Почему не официальный homebrew/cask

В `homebrew/cask` принимают только подписанные и notarized приложения,
собранные на macOS, плюс нужен PR с ревью. Когда появится macOS-сборка
с подписью — можно подать cask в официальный репозиторий.

Этот tap работает уже сейчас и полностью под контролем проекта.
