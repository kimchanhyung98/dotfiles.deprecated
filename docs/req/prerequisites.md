# Prerequisites

dotfiles 설치 전 필수 사전 요구사항입니다.

## 1. Homebrew

macOS 패키지 관리자입니다.

### 설치

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 환경 변수 설정

**Apple Silicon (M1/M2/M3/M4):**
```bash
echo >> ~/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

**Intel Mac:**
```bash
echo >> ~/.zprofile
echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/usr/local/bin/brew shellenv)"
```

### 확인

```bash
brew --version
# Homebrew 4.x.x
```

### 참고

- [Homebrew 공식 사이트](https://brew.sh/)
- [Homebrew 문서](https://docs.brew.sh/)

---

## 2. Xcode Command Line Tools

macOS 개발에 필요한 기본 도구입니다.

### 설치

```bash
xcode-select --install
```

### 자동 설치

`run_once_01_macos-setting.sh.tmpl`에서 자동으로 설치됩니다:

```bash
if ! xcode-select -p >/dev/null 2>&1; then
  xcode-select --install || true
fi
```

### 확인

```bash
xcode-select -p
# /Library/Developer/CommandLineTools
```

### 포함 내용

- Git
- Clang/LLVM 컴파일러
- Make
- 기타 UNIX 개발 도구

---

## 3. chezmoi

dotfiles 관리 도구입니다.

### 설치

```bash
brew install chezmoi
```

### 초기화

```bash
chezmoi init kimchanhyung98
chezmoi apply
```

### 확인

```bash
chezmoi --version
```

### 참고

- [chezmoi 공식 사이트](https://www.chezmoi.io/)
- [Quick Start](https://www.chezmoi.io/quick-start/)

---

## 설치 순서

```
1. Homebrew 설치
   ↓
2. 환경 변수 설정 (셸 재시작)
   ↓
3. chezmoi 설치
   ↓
4. chezmoi init & apply
   ↓
5. (자동) Xcode CLI Tools 설치
   ↓
6. (자동) 나머지 패키지 설치
```

---

## 시스템 요구사항

| 항목 | 요구사항 |
|------|----------|
| **macOS** | Sonoma 14.0+ 권장 |
| **디스크** | 최소 20GB 여유 공간 |
| **네트워크** | 인터넷 연결 필요 |
| **권한** | 관리자 권한 (sudo) |

---

## 문제 해결

### Homebrew 설치 실패

```bash
# 기존 설치 제거
sudo rm -rf /opt/homebrew  # Apple Silicon
sudo rm -rf /usr/local/Homebrew  # Intel

# 재설치
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Xcode CLI Tools 설치 실패

```bash
# 기존 제거
sudo rm -rf /Library/Developer/CommandLineTools

# 재설치
xcode-select --install
```

### PATH 문제

```bash
# 현재 PATH 확인
echo $PATH

# Homebrew 경로 확인
which brew

# .zprofile 확인
cat ~/.zprofile
```
