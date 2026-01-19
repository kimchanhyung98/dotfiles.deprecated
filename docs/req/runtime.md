# Runtime & Package Managers

런타임 환경 및 패키지 매니저 설정입니다.

**스크립트:** `run_once_05_install-runtime-base.sh`

---

## pipx

Python 애플리케이션을 독립적인 가상환경에 설치합니다.

### 설치

```bash
brew install pipx
pipx ensurepath
```

### PATH 설정

```bash
# .zshrc에 추가
export PATH="$HOME/.local/bin:$PATH"
```

### 사용법

```bash
# 패키지 설치
pipx install package-name

# 설치 목록
pipx list

# 업그레이드
pipx upgrade package-name
pipx upgrade-all

# 제거
pipx uninstall package-name
```

### 장점

- 패키지별 독립 가상환경
- 전역 Python 환경 오염 방지
- 명령줄 도구 설치에 최적화

### 공식 문서

- [pipx 공식 사이트](https://pipx.pypa.io/)
- [GitHub](https://github.com/pypa/pipx)

---

## Bun

JavaScript/TypeScript 올인원 런타임입니다.

### 설치

```bash
curl -fsSL https://bun.sh/install | bash
```

### PATH 설정

```bash
# .zshrc에 추가
export PATH="$HOME/.bun/bin:$PATH"
```

### 사용법

```bash
# 버전 확인
bun --version

# 스크립트 실행
bun run script.ts
bun run script.js

# 패키지 설치
bun install
bun add package-name

# 테스트
bun test

# 번들링
bun build ./index.ts --outdir ./dist
```

### 특징

| 기능 | 설명 |
|------|------|
| **런타임** | Node.js 대체 |
| **패키지 매니저** | npm/yarn/pnpm 대체 |
| **번들러** | webpack/esbuild 대체 |
| **테스트 러너** | Jest 대체 |
| **성능** | Node.js 대비 4배 빠름 |

### npm 호환

```bash
# package.json 그대로 사용
bun install              # npm install
bun run build           # npm run build
bun add express         # npm install express
bun remove express      # npm uninstall express
```

### 공식 문서

- [Bun 공식 사이트](https://bun.sh/)
- [GitHub](https://github.com/oven-sh/bun)

---

## npm

Node.js 기본 패키지 매니저입니다.

### 설치

```bash
brew install node
# npm은 node와 함께 설치됨
```

### 사용법

```bash
# 버전 확인
npm --version

# 전역 설치
npm install -g package-name

# 프로젝트 설치
npm install
npm install package-name

# 스크립트 실행
npm run script-name
npm test
npm start

# 업데이트
npm update
npm outdated
```

### 전역 패키지 위치

```bash
# 전역 패키지 경로
npm root -g

# 전역 패키지 목록
npm list -g --depth=0
```

### npx

패키지 실행 도구.

```bash
# 설치 없이 실행
npx create-react-app my-app
npx eslint .
npx prettier --write .
```

### 공식 문서

- [npm 공식 사이트](https://www.npmjs.com/)
- [npm Docs](https://docs.npmjs.com/)

---

## 비교

| 기능 | npm | yarn | pnpm | bun |
|------|-----|------|------|-----|
| **속도** | 보통 | 빠름 | 빠름 | 매우 빠름 |
| **디스크** | 많음 | 많음 | 적음 | 적음 |
| **호환성** | 높음 | 높음 | 높음 | 보통 |
| **Monorepo** | 보통 | 좋음 | 좋음 | 좋음 |

---

## 설치 스크립트

`run_once_05_install-runtime-base.sh` 전체 내용:

```bash
#!/bin/bash

set -e

echo "[install-runtime-base]"

# 1. pipx
if ! command -v pipx >/dev/null 2>&1; then
  brew install pipx || true
fi

pipx ensurepath || true
if ! grep -q 'export PATH="$HOME/.local/bin' "$HOME/.zshrc" 2>/dev/null; then
  export PATH="$HOME/.local/bin:$PATH"
  echo "install pipx"
fi

# 2. bun
if ! command -v bun >/dev/null 2>&1; then
  curl -fsSL https://bun.sh/install | bash
  export PATH="$HOME/.bun/bin:$PATH"
  if ! grep -q 'export PATH="$HOME/.bun/bin' "$HOME/.zshrc" 2>/dev/null; then
    echo 'export PATH="$HOME/.bun/bin:$PATH"' >> "$HOME/.zshrc"
  fi
  echo "install bun"
fi

# 3. npm
if ! command -v npm >/dev/null 2>&1; then
  brew install node
fi

echo "[install-runtime-base] done"
```

---

## 요약

| 도구 | 용도 | 설치 방법 |
|------|------|-----------|
| **pipx** | Python CLI 앱 | `brew install pipx` |
| **Bun** | JS/TS 런타임 | `curl -fsSL https://bun.sh/install \| bash` |
| **npm** | Node 패키지 매니저 | `brew install node` |

| 항목 | 값 |
|------|-----|
| **총 도구 수** | 3 |
| **설치 용량** | ~500MB |
