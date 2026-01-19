# Required Packages & Tools

dotfiles 프로젝트에서 설치하는 모든 도구, 패키지, 애플리케이션 인덱스입니다.

---

## 📚 문서 목록

### [Prerequisites](./req/prerequisites.md)

사전 요구사항 및 필수 설치 항목.

- Homebrew 설치 및 설정
- Xcode Command Line Tools
- chezmoi 설치
- 시스템 요구사항

### [Brew - System](./req/brew-system.md)

시스템 유틸리티 및 기본 도구.

| 패키지 | 설명 |
|--------|------|
| bash, zsh | 셸 |
| curl, wget | 다운로드 |
| gh | GitHub CLI |
| gnupg | 암호화 |
| grep | 검색 |
| tmux | 터미널 멀티플렉서 |
| tree | 디렉토리 시각화 |

### [Brew - Languages](./req/brew-languages.md)

프로그래밍 언어 런타임.

| 패키지 | 언어 |
|--------|------|
| dotnet | .NET |
| go | Go |
| node | Node.js |
| openjdk | Java |
| php | PHP |
| python | Python |
| ruby | Ruby |
| rust | Rust |
| kotlin | Kotlin |

### [Brew - DevTools](./req/brew-devtools.md)

개발 도구 및 패키지 매니저.

| 패키지 | 설명 |
|--------|------|
| awscli | AWS CLI |
| gcloud-cli | Google Cloud CLI |
| composer | PHP 패키지 매니저 |
| git, git-lfs | 버전 관리 |
| npm, yarn | JS 패키지 매니저 |
| pipx, uv | Python 도구 |
| rbenv | Ruby 버전 관리 |
| vim | 텍스트 에디터 |
| xcodes | Xcode 관리 |

### [Brew - Apps](./req/brew-apps.md)

GUI 애플리케이션 (cask).

**Development:**
- Docker, Figma, Flutter
- GitHub Desktop, Postman, Proxyman

**Productivity:**
- iTerm2, Rectangle, Stats
- Google Chrome, Slack, Zoom
- AppCleaner, IINA, Keka

### [Runtime](./req/runtime.md)

런타임 환경 및 패키지 매니저.

| 도구 | 용도 |
|------|------|
| pipx | Python CLI 앱 |
| Bun | JS/TS 런타임 |
| npm | Node 패키지 매니저 |

### [Claude Code](./req/claude.md)

Claude Code CLI 및 확장 설정.

- 설치 및 로그인
- settings.json 설정
- 플러그인 시스템
- MCP 서버 설정
- SuperClaude 확장

### [AI Tools](./req/ai-tools.md)

AI 개발 도구 및 CLI (Claude 제외).

**npm:**
- auggie, codex, gemini

**pipx:**
- SuperGemini

**기타:**
- ollama (로컬 LLM)
- Opcode (Claudia)

### [macOS Settings](./req/macos.md)

macOS 시스템 설정 자동화.

- Dock, Finder 설정
- Keyboard, Trackpad 설정
- Screenshot, Menu Bar 설정

---

## 📊 통계

### 패키지 수

| 카테고리 | 수량 |
|----------|------|
| Homebrew brew | 42 |
| Homebrew cask | 15 |
| npm packages | 4 |
| pipx packages | 2 |
| Others | 1 |
| **총계** | **64** |

### 설치 용량

| 카테고리 | 용량 |
|----------|------|
| System Tools | ~200MB |
| Languages | ~3GB |
| DevTools | ~1GB |
| Apps | ~5GB |
| Runtime | ~500MB |
| AI Tools | ~500MB |
| **총계** | **~10GB** |

---

## 🚀 설치 순서

```
1. Prerequisites
   ├── Homebrew
   ├── Xcode CLI Tools
   └── chezmoi

2. chezmoi apply
   ├── run_once_01: macOS Settings
   ├── run_once_02: Brewfile
   ├── run_once_03: GitHub Clone
   ├── run_once_04: Oh My Zsh
   ├── run_once_05: Runtime
   ├── run_once_06: AI (npm)
   ├── run_once_07: AI (pipx)
   ├── run_once_08: AI (others)
   └── run_once_99: Validation
```

---

## 🔗 빠른 설치

### 전체 설치

```bash
# 1. Homebrew 설치
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. 환경 변수 (Apple Silicon)
eval "$(/opt/homebrew/bin/brew shellenv)"

# 3. chezmoi 설치 및 적용
brew install chezmoi
chezmoi init kimchanhyung98
chezmoi apply
```

### 개별 설치

```bash
# Brewfile만
brew bundle --file=Brewfile

# npm AI 도구만
npm install -g @anthropic-ai/claude-code @openai/codex @google/gemini-cli

# pipx AI 도구만
pipx install SuperClaude SuperGemini
```

---

## 📁 파일 구조

```
docs/
├── required.md          # 인덱스 (현재 문서)
└── req/
    ├── prerequisites.md # 사전 요구사항
    ├── brew-system.md   # 시스템 도구
    ├── brew-languages.md # 프로그래밍 언어
    ├── brew-devtools.md # 개발 도구
    ├── brew-apps.md     # GUI 애플리케이션
    ├── runtime.md       # 런타임 환경
    ├── claude.md        # Claude Code 설정
    ├── ai-tools.md      # AI 도구 (Claude 제외)
    └── macos.md         # macOS 설정
```
