# macOS Settings

macOS 시스템 설정 자동화입니다.

**스크립트:** `run_once_01_macos-setting.sh.tmpl`

---

## Dock

### 자동 숨기기

```bash
defaults write com.apple.dock autohide -bool true
```

### 돋보기 효과

```bash
defaults write com.apple.dock magnification -bool true
```

### 아이콘 크기

```bash
# 기본 크기 (48px)
defaults write com.apple.dock tilesize -int 48

# 확대 크기 (64px)
defaults write com.apple.dock largesize -int 64
```

### 최근 사용 앱 숨기기

```bash
defaults write com.apple.dock show-recents -bool false
```

---

## Finder

### 경로 막대 표시

```bash
defaults write com.apple.finder ShowPathbar -bool true
```

### 상태 막대 표시

```bash
defaults write com.apple.finder ShowStatusBar -bool true
```

### 기본 검색 범위

현재 폴더에서 검색:

```bash
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
```

| 값 | 의미 |
|----|------|
| `SCcf` | 현재 폴더 |
| `SCsp` | 이전 검색 범위 |
| `SCev` | 전체 Mac |

### 확장자 변경 경고 비활성화

```bash
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
```

### 모든 파일 확장자 표시

```bash
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
```

### 전체 경로 표시 (제목 표시줄)

```bash
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
```

---

## Keyboard

### 키 반복 속도

```bash
# 반복 속도 (낮을수록 빠름, 기본값: 6)
defaults write NSGlobalDomain KeyRepeat -int 2

# 반복 시작 지연 (낮을수록 빠름, 기본값: 25)
defaults write NSGlobalDomain InitialKeyRepeat -int 15
```

### 누르고 있으면 팝오버 비활성화

특수 문자 팝오버 대신 키 반복 활성화:

```bash
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
```

### 자동 수정 비활성화

```bash
# 맞춤법 자동 수정
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# 자동 대문자
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# 스페이스 두 번에 마침표
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# 스마트 따옴표
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# 스마트 대시
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# 텍스트 자동 완성
defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool false
```

---

## Trackpad

### 탭하여 클릭

```bash
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
```

---

## Screenshot

### 저장 위치

```bash
defaults write com.apple.screencapture location -string "${HOME}/Desktop"
```

### 파일 형식

```bash
defaults write com.apple.screencapture type -string "png"
```

| 형식 | 값 |
|------|-----|
| PNG | `png` |
| JPG | `jpg` |
| GIF | `gif` |
| PDF | `pdf` |
| TIFF | `tiff` |

### 그림자 비활성화

```bash
defaults write com.apple.screencapture disable-shadow -bool true
```

---

## Menu Bar

### 시계 형식

```bash
defaults write com.apple.menuextra.clock DateFormat -string "MM.dd EEE, HH:mm"
```

| 형식 | 예시 |
|------|------|
| `MM.dd EEE, HH:mm` | 01.19 일, 15:30 |
| `yyyy-MM-dd HH:mm` | 2026-01-19 15:30 |
| `EEE MMM d HH:mm` | Sun Jan 19 15:30 |

---

## 변경 적용

설정 변경 후 재시작 필요한 프로세스:

```bash
killall Dock Finder SystemUIServer 2>/dev/null || true
```

**스크립트에서:**
```bash
after() { killall Dock Finder SystemUIServer 2>/dev/null || true; }; after
```

---

## 전체 스크립트

`run_once_01_macos-setting.sh.tmpl`:

```bash
#!/bin/bash

set -e

echo "[macos-setting]"

# 1. Xcode 설치
if ! xcode-select -p >/dev/null 2>&1; then
  xcode-select --install || true
  echo "install xcode"
fi

# 2. Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock tilesize -int 48
defaults write com.apple.dock largesize -int 64
defaults write com.apple.dock show-recents -bool false

# 3. Finder
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# 4. Keyboard
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool false

# 5. Trackpad
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# 6. Screenshot
defaults write com.apple.screencapture location -string "${HOME}/Desktop"
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.screencapture disable-shadow -bool true

# 7. Menu Bar
defaults write com.apple.menuextra.clock DateFormat -string "MM.dd EEE, HH:mm"

# 8. 변경 적용
after() { killall Dock Finder SystemUIServer 2>/dev/null || true; }; after

echo "[macos-setting] done"
```

---

## 설정 확인

### 현재 값 읽기

```bash
defaults read com.apple.dock autohide
defaults read NSGlobalDomain KeyRepeat
```

### 기본값으로 복원

```bash
defaults delete com.apple.dock autohide
defaults delete NSGlobalDomain KeyRepeat
```

---

## 유용한 추가 설정

### Mission Control

```bash
# 데스크탑 자동 재배치 비활성화
defaults write com.apple.dock mru-spaces -bool false
```

### Spotlight

```bash
# Spotlight 검색 범위 제한
defaults write com.apple.spotlight orderedItems -array \
  '{"enabled" = 1;"name" = "APPLICATIONS";}' \
  '{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
  '{"enabled" = 1;"name" = "DIRECTORIES";}' \
  '{"enabled" = 1;"name" = "PDF";}' \
  '{"enabled" = 0;"name" = "FONTS";}' \
  '{"enabled" = 0;"name" = "DOCUMENTS";}'
```

### Safari (개발자용)

```bash
# 개발자 메뉴 표시
defaults write com.apple.Safari IncludeDevelopMenu -bool true

# 웹 인스펙터 활성화
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
```

---

## 요약

| 카테고리 | 설정 수 |
|----------|---------|
| **Dock** | 5 |
| **Finder** | 6 |
| **Keyboard** | 9 |
| **Trackpad** | 2 |
| **Screenshot** | 3 |
| **Menu Bar** | 1 |
| **총계** | **26** |
