# Chezmoi 생명주기 스크립트

## 개요

chezmoi의 생명주기 스크립트는 `run_` 접두사를 사용하여 자동화된 설정 작업을 수행합니다. 이를 통해 패키지 설치, 시스템 설정, 환경 구성 등을 자동화할 수 있습니다.

## 스크립트 타입

### 기본 스크립트 (`run_`)

`chezmoi apply`를 실행할 때마다 실행됩니다.

```bash
# 파일명: run_update_system.sh
#!/bin/bash
echo "System update running..."
```

**사용 시나리오:**
- 항상 최신 상태를 유지해야 하는 작업
- 동기화가 필요한 설정

### 한 번만 실행 (`run_once_`)

스크립트가 성공적으로 실행된 적이 없거나 내용이 변경된 경우에만 실행됩니다.

```bash
# 파일명: run_once_install_packages.sh
#!/bin/bash
echo "Installing packages..."
brew install vim git
```

**사용 시나리오:**
- 초기 설치 작업
- 시스템 설정 변경
- 한 번만 실행되어야 하는 작업

**현재 프로젝트 예시:**
```bash
run_once_01_macos-setting.sh.tmpl        # macOS 시스템 설정
run_once_02_install-brewfile.sh.tmpl     # Homebrew 패키지 설치
run_once_03_clone-github.sh.tmpl         # GitHub 저장소 클론
run_once_04_ohmyzsh-setting.sh           # Oh My Zsh 설정
run_once_05_install-runtime-base.sh      # 런타임 환경 설치
run_once_06_install-ai-npm.sh            # AI 도구 (npm)
run_once_07_install-ai-pipx.sh           # AI 도구 (pipx)
run_once_08_install-ai-others.sh         # 기타 AI 도구
run_once_99_validate-installation.sh     # 설치 검증
```

### 변경 시 실행 (`run_onchange_`)

스크립트 내용이 변경될 때마다 실행됩니다.

```bash
# 파일명: run_onchange_update_packages.sh
#!/bin/bash
brew bundle --file=/dev/stdin <<EOF
brew "git"
brew "vim"
cask "iterm2"
EOF
```

**사용 시나리오:**
- 패키지 목록 관리
- 설정이 변경될 때마다 적용해야 하는 작업
- 선언적 패키지 관리

### 실행 순서 제어

#### `run_before_` - 파일 업데이트 전 실행

```bash
# 파일명: run_before_backup.sh
#!/bin/bash
echo "Creating backup..."
tar -czf ~/backup.tar.gz ~/.config
```

**사용 시나리오:**
- 백업 작업
- 사전 검증
- 환경 준비

#### `run_after_` - 파일 업데이트 후 실행

```bash
# 파일명: run_after_reload.sh
#!/bin/bash
echo "Reloading configuration..."
source ~/.zshrc
```

**사용 시나리오:**
- 설정 다시 로드
- 서비스 재시작
- 사후 검증

## 실행 순서

스크립트는 다음 순서로 실행됩니다:

1. `run_before_` 스크립트들
2. 파일, 디렉토리, 심볼릭 링크 업데이트
3. `run_` 스크립트들 (ASCII 순서)
4. `run_after_` 스크립트들

**순서 제어 팁:**
- 숫자 접두사 사용: `01_`, `02_`, `03_`, ...
- 알파벳 순서 활용

```bash
run_once_01_macos-setting.sh.tmpl
run_once_02_install-brewfile.sh.tmpl
run_once_03_clone-github.sh.tmpl
run_once_99_validate-installation.sh
```

## 템플릿과 결합

### `.tmpl` 접미사 사용

스크립트에서 템플릿 변수를 사용할 수 있습니다.

```bash
# 파일명: run_once_install.sh.tmpl
#!/bin/bash

{{- if eq .chezmoi.os "darwin" }}
echo "Installing macOS packages..."
brew install git vim
{{- else if eq .chezmoi.os "linux" }}
echo "Installing Linux packages..."
sudo apt-get install git vim
{{- end }}
```

### 조건부 실행

```bash
# 파일명: run_once_darwin_setup.sh.tmpl
{{- if eq .chezmoi.os "darwin" -}}
#!/bin/bash
echo "macOS setup..."
defaults write com.apple.dock autohide -bool true
{{- end -}}
```

## 환경 변수

chezmoi는 스크립트 실행 시 특정 환경 변수를 설정합니다:

| 환경 변수 | 설명 |
|-----------|------|
| `CHEZMOI` | chezmoi 실행 파일 경로 |
| `CHEZMOI_SOURCE_DIR` | 소스 디렉토리 경로 |
| `CHEZMOI_TARGET_DIR` | 타겟 디렉토리 경로 (보통 홈) |
| `CHEZMOI_OS` | 운영체제 (`darwin`, `linux`, 등) |
| `CHEZMOI_ARCH` | 아키텍처 (`amd64`, `arm64`, 등) |
| `CHEZMOI_HOSTNAME` | 호스트명 |
| `CHEZMOI_USERNAME` | 사용자명 |

**사용 예시:**
```bash
#!/bin/bash
echo "Source directory: $CHEZMOI_SOURCE_DIR"
echo "Operating system: $CHEZMOI_OS"
```

## 실제 프로젝트 예시

### run_once_01_macos-setting.sh.tmpl

macOS 시스템 설정을 자동화합니다.

```bash
#!/bin/bash

set -e

echo "[macos-setting]"

# Xcode 설치
if ! xcode-select -p >/dev/null 2>&1; then
  xcode-select --install || true
  echo "install xcode"
fi

# Dock 설정
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock tilesize -int 48

# Finder 설정
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true

# Keyboard 설정
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# 변경사항 적용
killall Dock Finder SystemUIServer 2>/dev/null || true

echo "[macos-setting] done"
```

### run_once_02_install-brewfile.sh.tmpl

Brewfile을 사용하여 패키지를 설치합니다.

```bash
#!/bin/bash

{{- if eq .chezmoi.os "darwin" }}
set -e

echo "[install-brewfile]"

if command -v brew &> /dev/null; then
  echo "  - brew bundle install..."
  brew bundle --file={{ .chezmoi.sourceDir }}/Brewfile || true
else
  echo "  - Homebrew not found"
fi

echo "[install-brewfile] done"
{{- end }}
```

### run_once_99_validate-installation.sh

설치를 검증합니다.

```bash
#!/bin/bash

set -e

echo "[validate-installation]"

# 필수 도구 확인
required_tools=(
  "git"
  "vim"
  "zsh"
  "brew"
)

for tool in "${required_tools[@]}"; do
  if command -v "$tool" &> /dev/null; then
    echo "✓ $tool"
  else
    echo "✗ $tool (not found)"
  fi
done

echo "[validate-installation] done"
```

## 스크립트 작성 모범 사례

### 1. 에러 처리

```bash
#!/bin/bash
set -e  # 에러 발생 시 즉시 중단

# 또는 개별 명령어에 || true 사용
command_that_might_fail || true
```

### 2. 로깅

```bash
#!/bin/bash
echo "[script-name] Starting..."
echo "  - Task 1"
echo "  - Task 2"
echo "[script-name] Done"
```

### 3. 조건 확인

```bash
#!/bin/bash

# 명령어 존재 확인
if command -v brew &> /dev/null; then
  brew install package
else
  echo "Homebrew not found"
fi

# 파일 존재 확인
if [ -f ~/.zshrc ]; then
  source ~/.zshrc
fi
```

### 4. 멱등성 (Idempotency)

스크립트를 여러 번 실행해도 같은 결과를 보장:

```bash
#!/bin/bash

# 나쁜 예
echo "export PATH=/custom/path:$PATH" >> ~/.zshrc

# 좋은 예
if ! grep -q "/custom/path" ~/.zshrc; then
  echo "export PATH=/custom/path:$PATH" >> ~/.zshrc
fi
```

### 5. 작업 디렉토리

스크립트는 타겟 디렉토리에서 실행됩니다:

```bash
#!/bin/bash

# 현재 위치는 보통 ~/
pwd  # /Users/username

# 소스 디렉토리 접근
cd "$CHEZMOI_SOURCE_DIR"
```

## 스크립트 디버깅

### 1. 드라이런 모드

```bash
# 스크립트 실행 없이 확인
chezmoi apply --dry-run --verbose
```

### 2. 특정 스크립트 실행

```bash
# 단일 스크립트만 실행
chezmoi execute-template < run_once_01_macos-setting.sh.tmpl | bash
```

### 3. 상태 초기화

스크립트를 다시 실행하려면 상태를 초기화:

```bash
# 모든 run_once 상태 초기화
chezmoi state delete-bucket --bucket=scriptState

# 또는 특정 스크립트만
rm -rf ~/.config/chezmoi/chezmoistate.boltdb
```

## 고급 패턴

### 선언적 패키지 관리

```bash
# 파일명: run_onchange_install_packages.sh.tmpl
#!/bin/bash

{{- if eq .chezmoi.os "darwin" }}
brew bundle --file=/dev/stdin <<EOF
{{ range .packages.darwin.brews -}}
brew {{ . | quote }}
{{ end -}}
{{ range .packages.darwin.casks -}}
cask {{ . | quote }}
{{ end -}}
EOF
{{- end }}
```

### 조건부 스크립트 실행

```bash
# 파일명: run_once_install_dev_tools.sh.tmpl
{{- if .install_dev_tools -}}
#!/bin/bash
echo "Installing development tools..."
brew install node python rust
{{- end -}}
```

### 다중 OS 지원

```bash
# 파일명: run_once_setup.sh.tmpl
#!/bin/bash

case "{{ .chezmoi.os }}" in
  darwin)
    brew install package
    ;;
  linux)
    sudo apt-get install package
    ;;
  *)
    echo "Unsupported OS"
    exit 1
    ;;
esac
```

## 참고 자료

- [공식 문서 - Scripts](https://www.chezmoi.io/reference/target-types/#scripts)
- [공식 문서 - Install Packages Declaratively](https://www.chezmoi.io/user-guide/advanced/install-packages-declaratively/)

## 다음 단계

- [프로젝트 구조](./project-structure.md) - 현재 dotfiles 구조 이해
- [템플릿 문법](./template-syntax.md) - 템플릿 고급 기능
