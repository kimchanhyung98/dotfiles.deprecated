# AI Tools

AI 개발 도구 및 CLI입니다. (Claude 제외)

> **Note:** Claude Code는 별도 문서로 분리되었습니다. → [claude.md](./claude.md)

---

## Homebrew

### ollama

로컬 LLM 실행 도구.

```bash
brew install ollama
```

**사용법:**
```bash
# 서버 시작
ollama serve

# 모델 실행
ollama run llama2
ollama run codellama
ollama run mistral

# 모델 목록
ollama list

# 모델 다운로드
ollama pull llama2
```

**API 사용:**
```bash
curl http://localhost:11434/api/generate -d '{
  "model": "llama2",
  "prompt": "Hello, world!"
}'
```

**공식 사이트:** [ollama.ai](https://ollama.ai/)

---

## npm 기반 (run_once_06)

### @augmentcode/auggie

Augment Code의 AI 어시스턴트.

```bash
npm install -g @augmentcode/auggie
auggie --login
```

**사용법:**
```bash
auggie              # 대화형 모드
auggie --help       # 도움말
```

### @openai/codex

OpenAI Codex CLI.

```bash
npm install -g @openai/codex
codex login
```

**사용법:**
```bash
codex               # 대화형 모드
codex "질문"        # 직접 질문
codex --help        # 도움말
```

**설정 위치:** `~/.codex/`

**인증 초기화:**
```bash
rm ~/.codex/auth.json
codex login
```

### @google/gemini-cli

Google Gemini AI CLI.

```bash
npm install -g @google/gemini-cli
gemini
```

**사용법:**
```bash
gemini              # 대화형 모드
gemini "질문"       # 직접 질문
gemini --help       # 도움말
```

---

## pipx 기반 (run_once_07)

### SuperGemini

Gemini AI 강화 도구.

```bash
pipx install SuperGemini
SuperGemini install --force --yes
```

**사용법:**
```bash
SuperGemini         # 실행
SuperGemini --help  # 도움말
```

---

## 기타 (run_once_08)

### Opcode (Claudia)

AI 코드 생성 데스크톱 앱.

```bash
git clone https://github.com/getAsterisk/opcode.git ~/opcode
cd ~/opcode
bun install
bun run tauri build
```

**요구사항:**
- Git
- Bun
- Rust (Tauri 빌드용)

**설치 위치:** `~/opcode/`

---

## 선택 설치 (Cask)

### AI 코드 에디터

| 앱 | 설명 | 설치 |
|----|------|------|
| **Cursor** | AI 기반 VS Code 포크 | `brew install --cask cursor` |
| **Windsurf** | Codeium AI 에디터 | `brew install --cask windsurf` |

---

## 요약

| 카테고리 | 도구 | 설치 방법 |
|----------|------|-----------|
| **Homebrew** | ollama | `brew install ollama` |
| **npm** | auggie, codex, gemini | `npm install -g @package` |
| **pipx** | SuperGemini | `pipx install package` |
| **기타** | Opcode | `git clone && bun build` |

| 항목 | 값 |
|------|-----|
| **총 도구 수** | 6 (Claude 제외) |
| **설치 용량** | ~300MB |

---

## API 키 설정

| 도구 | API 키 설정 |
|------|-------------|
| codex | `codex login` |
| auggie | `auggie --login` |
| gemini | `gemini` (초기 설정) |
| ollama | 로컬 실행 (API 키 불필요) |

---

## 문제 해결

### npm 설치 실패

```bash
npm cache clean --force
npm install -g @package/name
```

### pipx 설치 실패

```bash
pipx uninstall package-name
pipx install package-name
```

### 로그인 문제

```bash
# 설정 파일 삭제 후 재로그인
rm -rf ~/.codex
rm -rf ~/.auggie

# 재로그인
codex login
auggie --login
```

---

## 관련 문서

- [Claude Code](./claude.md) - Claude Code 전용 설정
