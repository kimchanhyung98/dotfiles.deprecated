# Claude Code

Anthropic Claude AI CLI 도구 및 설정 가이드입니다.

---

## 설치

### npm 설치

```bash
npm install -g @anthropic-ai/claude-code
```

### 로그인

```bash
claude login
```

### 버전 확인

```bash
claude --version
```

**공식 사이트:**
- [Claude Code Docs](https://code.claude.com/docs)
- [GitHub](https://github.com/anthropics/claude-code)

---

## 설정 파일

### 파일 위치

| 파일 | 용도 |
|------|------|
| `~/.claude.json` | 메인 설정 (OAuth, 캐시) |
| `~/.claude/settings.json` | 사용자 설정 (플러그인, 언어) |
| `~/.claude/settings.local.json` | 로컬 오버라이드 (커밋 제외) |
| `.claude/settings.json` | 프로젝트별 설정 |
| `.mcp.json` | 프로젝트별 MCP 서버 |

### 디렉토리 구조

```
~/.claude/
├── settings.json           # 사용자 설정
├── settings.local.json     # 로컬 설정
├── CLAUDE.md              # 전역 프롬프트
├── agents/                # 커스텀 에이전트
├── commands/              # 커스텀 명령어
├── plugins/               # 플러그인 캐시
├── history.jsonl          # 대화 히스토리
├── projects/              # 프로젝트별 상태
└── debug/                 # 디버그 로그
```

---

## 사용자 설정 (settings.json)

### 기본 설정

```json
{
  "language": "Korean",
  "statusLine": {
    "type": "command",
    "command": "your-status-command"
  },
  "enabledPlugins": {
    "plugin-name@source": true
  }
}
```

### 권장 플러그인 설정

```json
{
  "language": "Korean",
  "enabledPlugins": {
    "context7@claude-plugins-official": true,
    "code-review@claude-plugins-official": true,
    "feature-dev@claude-plugins-official": true,
    "commit-commands@claude-plugins-official": true,
    "pr-review-toolkit@claude-plugins-official": true,
    "superpowers@superpowers-marketplace": true,
    "episodic-memory@superpowers-marketplace": true,
    "example-skills@anthropic-agent-skills": true
  }
}
```

---

## 플러그인 시스템

### 플러그인 명령어

```bash
# 마켓플레이스 검색
/plugin marketplace search <keyword>

# 플러그인 설치
/plugin marketplace add <org/repo>
/plugin install <plugin-name>@<source>

# 플러그인 목록
/plugin list

# 플러그인 비활성화
/plugin disable <plugin-name>

# 플러그인 제거
/plugin remove <plugin-name>
```

### 권장 플러그인

| 플러그인 | 소스 | 설명 |
|----------|------|------|
| `context7` | claude-plugins-official | 라이브러리 문서 조회 |
| `code-review` | claude-plugins-official | 코드 리뷰 |
| `feature-dev` | claude-plugins-official | 기능 개발 가이드 |
| `commit-commands` | claude-plugins-official | Git 커밋 자동화 |
| `pr-review-toolkit` | claude-plugins-official | PR 리뷰 도구 |
| `superpowers` | superpowers-marketplace | 향상된 워크플로우 |
| `episodic-memory` | superpowers-marketplace | 세션 간 기억 |
| `example-skills` | anthropic-agent-skills | 스킬 예제 |

### 플러그인 설치 예시

```bash
# 공식 플러그인
/plugin marketplace add claude-plugins-official
/plugin install context7@claude-plugins-official
/plugin install code-review@claude-plugins-official
/plugin install commit-commands@claude-plugins-official

# SuperPowers
/plugin marketplace add superpowers-marketplace
/plugin install superpowers@superpowers-marketplace
/plugin install episodic-memory@superpowers-marketplace
```

---

## MCP 서버

### MCP 명령어

```bash
# 서버 추가
claude mcp add <name> --scope user

# 서버 목록
claude mcp list

# 서버 제거
claude mcp remove <name>

# 서버 테스트
claude mcp get <name>
```

### Scope 옵션

| Scope | 설명 | 파일 위치 |
|-------|------|-----------|
| `local` | 현재 프로젝트 (기본) | `.mcp.json` |
| `project` | 프로젝트 공유 | `.mcp.json` (커밋) |
| `user` | 전역 사용자 | `~/.claude/settings.json` |

### 권장 MCP 서버

```bash
# Context7 - 라이브러리 문서
claude mcp add context7 -s user -- npx -y @upstash/context7-mcp@latest

# Sequential Thinking - 체계적 사고
claude mcp add sequential-thinking -s user -- npx -y @modelcontextprotocol/server-sequential-thinking
```

### MCP 설정 JSON

```json
{
  "mcpServers": {
    "context7": {
      "command": "npx",
      "args": ["-y", "@upstash/context7-mcp@latest"]
    },
    "sequential-thinking": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-sequential-thinking"]
    },
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "${GITHUB_TOKEN}"
      }
    }
  }
}
```

---

## SuperClaude

Claude Code 확장 프레임워크입니다.

### 설치 방법

#### Option 1: PyPI (권장)

```bash
pipx install superclaude
superclaude install
```

#### Option 2: 플러그인 시스템

```bash
/plugin marketplace add SuperClaude-Org/SuperClaude_Plugin
/plugin install sc@superclaude
```

#### Option 3: Git Clone

```bash
git clone https://github.com/SuperClaude-Org/SuperClaude_Framework.git
cd SuperClaude_Framework
./install.sh
```

### 주요 기능

- **30+ 슬래시 명령어**: `/sc:analyze`, `/sc:implement`, `/sc:test` 등
- **인지 페르소나**: 분석가, 아키텍트, 멘토 모드
- **개발 방법론**: TDD, 체계적 디버깅
- **MCP 통합**: Context7, Sequential Thinking

### 설치 확인

```bash
superclaude --version
superclaude list
```

### 백업

설치 전 기존 설정 백업:

```bash
cp ~/.claude/settings.json ~/.claude/settings.json.backup
cp ~/.claude/settings.local.json ~/.claude/settings.local.json.backup
```

**공식 사이트:**
- [SuperClaude](https://superclaude.org/)
- [GitHub](https://github.com/SuperClaude-Org/SuperClaude_Framework)
- [PyPI](https://pypi.org/project/superclaude/)

---

## 전역 프롬프트 (CLAUDE.md)

### 파일 위치

| 위치 | 용도 |
|------|------|
| `~/.claude/CLAUDE.md` | 전역 지침 (모든 프로젝트) |
| `./CLAUDE.md` | 프로젝트별 지침 |

### 기본 구조

```markdown
# Claude Code 지침

## 기본 규칙
- 한국어로 응답
- 코드 주석은 영어

## 코딩 스타일
- ESLint/Prettier 준수
- 함수형 프로그래밍 선호

## 프로젝트 규칙
- 커밋 메시지 형식: type: description
```

---

## 주요 명령어

### 기본 사용

```bash
# 대화형 모드
claude

# 직접 질문
claude "질문 내용"

# 파일과 함께
claude "이 코드 리뷰해줘" --file src/main.js

# 추가 디렉토리 접근
claude --add-dir ../other-project
```

### 슬래시 명령어

| 명령어 | 설명 |
|--------|------|
| `/help` | 도움말 |
| `/clear` | 대화 초기화 |
| `/compact` | 컨텍스트 압축 |
| `/config` | 설정 열기 |
| `/cost` | 토큰 사용량 |
| `/doctor` | 상태 진단 |
| `/init` | 프로젝트 초기화 |
| `/memory` | 메모리 관리 |
| `/mcp` | MCP 서버 관리 |
| `/model` | 모델 선택 |
| `/add-dir` | 디렉토리 추가 |

### 세션 내 명령어

```bash
# 컨텍스트 압축
/compact

# 비용 확인
/cost

# 모델 변경
/model sonnet
/model opus

# 설정 열기
/config
```

---

## 권한 설정

### 파일 접근 제한

`.claude/settings.json`:

```json
{
  "permissions": {
    "deny": [
      "**/.env",
      "**/.env.*",
      "**/secrets/**",
      "**/*.key",
      "**/*.pem"
    ]
  }
}
```

### 도구 접근 제어

```json
{
  "permissions": {
    "allow": [
      "Read",
      "Write",
      "Edit",
      "Bash"
    ],
    "deny": [
      "dangerous-tool"
    ]
  }
}
```

---

## 문제 해결

### 로그인 문제

```bash
# 재로그인
claude logout
claude login

# 인증 파일 초기화
rm -rf ~/.claude/auth*
claude login
```

### 플러그인 문제

```bash
# 플러그인 캐시 정리
rm -rf ~/.claude/plugins/cache

# 재설치
/plugin remove <plugin-name>
/plugin install <plugin-name>
```

### MCP 서버 문제

```bash
# 서버 상태 확인
claude mcp list

# 서버 재시작
claude mcp remove <name>
claude mcp add <name> --scope user -- <command>
```

### 디버그 모드

```bash
# 상세 로그
claude --debug

# 진단
/doctor
```

---

## 설치 스크립트

`run_once_06_install-ai-npm.sh` (Claude 부분):

```bash
#!/bin/bash

set -e

echo "[install-claude]"

if ! command -v npm >/dev/null 2>&1; then
  exit 0
fi

# Claude Code 설치
if ! command -v claude >/dev/null 2>&1; then
  npm install -g @anthropic-ai/claude-code || true
  claude login || true
fi

# SuperClaude 설치 (pipx)
if command -v pipx >/dev/null 2>&1; then
  if ! command -v superclaude >/dev/null 2>&1; then
    pipx install superclaude || true
    superclaude install --force --yes || true
  fi
fi

echo "[install-claude] done"
```

---

## 요약

| 항목 | 값 |
|------|-----|
| **설치** | `npm install -g @anthropic-ai/claude-code` |
| **설정 위치** | `~/.claude/settings.json` |
| **MCP 서버** | `claude mcp add/list/remove` |
| **플러그인** | `/plugin install/list/remove` |
| **확장** | SuperClaude (`pipx install superclaude`) |

## 참고 자료

- [Claude Code Docs](https://code.claude.com/docs/en/settings)
- [MCP Server Guide](https://mcpcat.io/guides/adding-an-mcp-server-to-claude-code/)
- [SuperClaude GitHub](https://github.com/SuperClaude-Org/SuperClaude_Framework)
- [ClaudeLog Configuration Guide](https://claudelog.com/configuration/)
