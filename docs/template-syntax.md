# Chezmoi 템플릿 문법

## 개요

chezmoi는 Go 템플릿을 사용하여 동적 설정을 생성합니다. 이를 통해 하나의 dotfiles 세트로 여러 환경에 적응할 수 있습니다.

## 기본 템플릿 구조

### 변수 출력

```go
{{ .variable_name }}
```

**예시:**
```go
[user]
    name = {{ .name }}
    email = {{ .email }}
```

### 따옴표로 감싸기

```go
{{ .variable_name | quote }}
```

**예시:**
```go
name = {{ .name | quote }}
# 결과: name = "John Doe"
```

## 조건문

### if/else

```go
{{- if eq .chezmoi.os "darwin" }}
# macOS specific configuration
{{- else if eq .chezmoi.os "linux" }}
# Linux specific configuration
{{- else }}
# Other OS configuration
{{- end }}
```

**실제 예시 (dot_gitconfig.tmpl):**
```go
{{- if eq .chezmoi.os "darwin" }}
[credential]
    helper = osxkeychain
{{- else if eq .chezmoi.os "linux" }}
[credential]
    helper = cache
{{- end }}
```

### 여러 조건

```go
{{- if and (eq .chezmoi.os "darwin") (eq .chezmoi.arch "arm64") }}
# Apple Silicon Mac
{{- end }}

{{- if or (eq .chezmoi.os "darwin") (eq .chezmoi.os "linux") }}
# Unix-like systems
{{- end }}
```

## 사용 가능한 변수

### chezmoi 내장 변수

| 변수 | 설명 | 예시 |
|------|------|------|
| `.chezmoi.os` | 운영체제 | `darwin`, `linux`, `windows` |
| `.chezmoi.arch` | 아키텍처 | `amd64`, `arm64` |
| `.chezmoi.hostname` | 호스트명 | `my-macbook` |
| `.chezmoi.username` | 사용자명 | `johndoe` |
| `.chezmoi.homeDir` | 홈 디렉토리 경로 | `/Users/johndoe` |
| `.chezmoi.osRelease` | OS 릴리스 정보 (Linux) | `{ "ID": "ubuntu" }` |
| `.chezmoi.kernel` | 커널 정보 | `{ "ostype": "Darwin" }` |

### 사용자 정의 변수

`.chezmoi.toml.tmpl` 파일에서 정의:

```toml
{{- $name := promptStringOnce . "name" "Full name" -}}
{{- $email := promptStringOnce . "email" "Email address" -}}
{{- $password := promptStringOnce . "password" "Sudo password" -}}

[data]
    name = {{ $name | quote }}
    email = {{ $email | quote }}
    password = {{ $password | quote }}
```

템플릿에서 사용:

```go
{{ .name }}
{{ .email }}
{{ .password }}
```

## 공백 제어

### 좌측 공백 제거 (`-`)

```go
{{- if condition }}
# 이전 줄과의 공백 제거
{{- end }}
```

### 우측 공백 제거 (`-`)

```go
{{ if condition -}}
# 다음 줄과의 공백 제거
{{ end -}}
```

### 양쪽 공백 제거

```go
{{- if condition -}}
# 양쪽 공백 모두 제거
{{- end -}}
```

## 함수

### 문자열 함수

```go
# 소문자 변환
{{ .name | lower }}

# 대문자 변환
{{ .name | upper }}

# 문자열 교체
{{ .text | replace "old" "new" }}

# 문자열 분할
{{ .path | split "/" }}
```

### 비교 함수

```go
# 같음
{{ if eq .value "expected" }}

# 같지 않음
{{ if ne .value "unexpected" }}

# 작음
{{ if lt .number 10 }}

# 작거나 같음
{{ if le .number 10 }}

# 큼
{{ if gt .number 5 }}

# 크거나 같음
{{ if ge .number 5 }}
```

### 논리 함수

```go
# AND
{{ if and (eq .os "darwin") (eq .arch "arm64") }}

# OR
{{ if or (eq .os "darwin") (eq .os "linux") }}

# NOT
{{ if not (eq .os "windows") }}
```

## 반복문

### range

```go
{{ range .packages -}}
brew {{ . | quote }}
{{ end -}}
```

**실제 예시 (Brewfile 생성):**
```bash
{{ range .packages.darwin.brews -}}
brew {{ . | quote }}
{{ end -}}
{{ range .packages.darwin.casks -}}
cask {{ . | quote }}
{{ end -}}
```

데이터 (chezmoi.toml):
```toml
[data.packages.darwin]
    brews = ["git", "vim", "tmux"]
    casks = ["iterm2", "visual-studio-code"]
```

## 환경 변수

### 읽기

```go
{{ env "HOME" }}
{{ env "PATH" }}
```

### 기본값 제공

```go
{{ env "CUSTOM_VAR" | default "default_value" }}
```

## 명령어 실행

### output

```go
{{ output "git" "config" "user.name" }}
```

### 조건부 실행

```go
{{- if lookPath "brew" }}
# Homebrew가 설치되어 있음
{{- end }}
```

## 프롬프트 함수

### promptStringOnce

한 번만 물어보고 답변을 저장합니다:

```go
{{- $name := promptStringOnce . "name" "Full name" -}}
```

### promptString

매번 물어봅니다:

```go
{{- $name := promptString "What is your name" -}}
```

### promptBool

예/아니오 질문:

```go
{{- $install := promptBool "Install development tools" -}}
{{- if $install }}
# 설치 코드
{{- end }}
```

## 실제 예시

### .chezmoi.toml.tmpl

```toml
{{- $name := promptStringOnce . "name" "Full name" -}}
{{- $email := promptStringOnce . "email" "Email address" -}}
{{- $password := promptStringOnce . "password" "Sudo password" -}}

[data]
    name = {{ $name | quote }}
    email = {{ $email | quote }}
    password = {{ $password | quote }}

[edit]
    command = "code"
    args = ["--wait"]
```

### dot_gitconfig.tmpl

```toml
[user]
    name = {{ .name | quote }}
    email = {{ .email | quote }}

[core]
    editor = vim

{{- if eq .chezmoi.os "darwin" }}
[credential]
    helper = osxkeychain
{{- else if eq .chezmoi.os "linux" }}
[credential]
    helper = cache
{{- end }}
```

### run_once_01_macos-setting.sh.tmpl

```bash
#!/bin/bash

{{- if eq .chezmoi.os "darwin" }}
set -e

echo "[macos-setting]"

# Xcode 설치
if ! xcode-select -p >/dev/null 2>&1; then
  xcode-select --install || true
  echo "install xcode"
fi

# macOS 설정 수정
defaults write com.apple.dock autohide -bool true
defaults write com.apple.finder ShowPathbar -bool true

echo "[macos-setting] done"
{{- end }}
```

### run_once_02_install-brewfile.sh.tmpl

```bash
#!/bin/bash

{{- if eq .chezmoi.os "darwin" }}
set -e

echo "[install-brewfile]"

if command -v brew &> /dev/null; then
  echo "  - brew bundle install..."
  brew bundle --file={{ .chezmoi.sourceDir }}/Brewfile || true
fi

echo "[install-brewfile] done"
{{- end }}
```

## 디버깅

### 변수 출력

```go
# 모든 chezmoi 변수 확인
{{ .chezmoi | toJson }}

# 특정 변수 확인
{{ .chezmoi.os }}
{{ .chezmoi.arch }}
```

### 템플릿 실행 보기

```bash
# 템플릿 처리 결과 미리보기
chezmoi cat ~/.gitconfig

# 모든 템플릿 데이터 확인
chezmoi data
```

## 모범 사례

### 1. OS별 설정 분리

```go
{{- if eq .chezmoi.os "darwin" }}
# macOS 설정
{{- else if eq .chezmoi.os "linux" }}
# Linux 설정
{{- end }}
```

### 2. 민감한 정보 프롬프트 사용

```go
{{- $password := promptStringOnce . "password" "Sudo password" -}}
```

### 3. 공백 제어로 깔끔한 출력

```go
{{- if condition -}}
내용
{{- end -}}
```

### 4. 기본값 제공

```go
{{ .custom_var | default "default_value" }}
```

### 5. 조건부 명령어 실행

```go
{{- if lookPath "brew" -}}
brew install package
{{- end -}}
```

## 참고 자료

- [공식 문서 - Templating](https://www.chezmoi.io/user-guide/templating/)
- [Go Template 문법](https://pkg.go.dev/text/template)
- [Template Functions](https://www.chezmoi.io/reference/templates/functions/)

## 다음 단계

- [생명주기 스크립트](./lifecycle-scripts.md) - 자동화 스크립트 작성법
- [프로젝트 구조](./project-structure.md) - 현재 dotfiles 구조 설명
