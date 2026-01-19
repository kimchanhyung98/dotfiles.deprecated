# Brew - System Tools

시스템 유틸리티 및 기본 도구입니다.

## 패키지 목록

| 패키지 | 설명 | 공식 사이트 |
|--------|------|-------------|
| `bash` | Bash 셸 (최신 버전) | [gnu.org/software/bash](https://www.gnu.org/software/bash/) |
| `curl` | 데이터 전송 도구 | [curl.se](https://curl.se/) |
| `gh` | GitHub CLI | [cli.github.com](https://cli.github.com/) |
| `gnupg` | GNU Privacy Guard | [gnupg.org](https://gnupg.org/) |
| `grep` | 텍스트 검색 (GNU) | [gnu.org/software/grep](https://www.gnu.org/software/grep/) |
| `pkg-config` | 컴파일러 플래그 관리 | [freedesktop.org](https://www.freedesktop.org/wiki/Software/pkg-config/) |
| `tmux` | 터미널 멀티플렉서 | [github.com/tmux](https://github.com/tmux/tmux) |
| `tree` | 디렉토리 트리 출력 | [oldmanprogrammer.net](http://oldmanprogrammer.net/source.php?dir=projects/tree) |
| `wget` | 파일 다운로드 | [gnu.org/software/wget](https://www.gnu.org/software/wget/) |
| `zsh` | Z 셸 | [zsh.org](https://www.zsh.org/) |

## 설치

### 전체 설치

```bash
brew install bash curl gh gnupg grep pkg-config tmux tree wget zsh
```

### 개별 설치

```bash
brew install <package-name>
```

## 상세 설명

### bash

macOS 기본 bash는 오래된 버전(3.x)입니다. Homebrew로 최신 버전(5.x)을 설치합니다.

```bash
# 버전 확인
bash --version

# 기본 셸로 설정 (선택)
sudo sh -c 'echo /opt/homebrew/bin/bash >> /etc/shells'
chsh -s /opt/homebrew/bin/bash
```

### curl

HTTP/HTTPS 요청 및 파일 다운로드.

```bash
# 사용 예시
curl -fsSL https://example.com/file.txt
curl -X POST -H "Content-Type: application/json" -d '{}' https://api.example.com
```

### gh

GitHub 작업을 CLI에서 수행합니다.

```bash
# 로그인
gh auth login

# PR 생성
gh pr create

# Issue 목록
gh issue list

# 저장소 클론
gh repo clone owner/repo
```

### gnupg

암호화 및 서명 도구.

```bash
# 키 생성
gpg --gen-key

# 키 목록
gpg --list-keys

# Git 서명 설정
git config --global user.signingkey <KEY_ID>
git config --global commit.gpgsign true
```

### grep

텍스트 검색 (GNU 버전).

```bash
# 기본 검색
grep "pattern" file.txt

# 재귀 검색
grep -r "pattern" /path/to/dir

# 정규표현식
grep -E "pattern1|pattern2" file.txt
```

### tmux

터미널 세션 관리.

```bash
# 새 세션
tmux new -s session-name

# 세션 목록
tmux ls

# 세션 연결
tmux attach -t session-name

# 세션 분리
Ctrl+b d
```

### tree

디렉토리 구조 시각화.

```bash
# 기본 출력
tree

# 깊이 제한
tree -L 2

# 숨김 파일 포함
tree -a

# 디렉토리만
tree -d
```

### wget

파일 다운로드.

```bash
# 단일 파일
wget https://example.com/file.zip

# 이어받기
wget -c https://example.com/large-file.zip

# 백그라운드
wget -b https://example.com/file.zip
```

### zsh

기본 셸 (macOS Catalina 이후 기본값).

```bash
# 버전 확인
zsh --version

# 기본 셸 확인
echo $SHELL
```

## Brewfile 항목

```ruby
# System
brew "bash"
brew "curl"
brew "gh"
brew "gnupg"
brew "grep"
brew "pkg-config"
brew "tmux"
brew "tree"
brew "wget"
brew "zsh"
```

## 요약

| 항목 | 값 |
|------|-----|
| **총 패키지 수** | 10 |
| **설치 용량** | ~200MB |
| **의존성** | 최소 |
