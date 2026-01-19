# Chezmoi 기본 가이드

## 개요

chezmoi는 여러 머신에서 개인 설정 파일(dotfiles)을 안전하게 관리할 수 있는 강력한 도구입니다.

**최신 버전**: v2.69.3 (2026년 1월 16일 릴리스)

## 주요 특징

- **템플릿 지원**: Go 템플릿을 사용하여 머신 간 차이를 처리
- **비밀 관리**: 패스워드 매니저 통합으로 비밀 정보 안전 저장
- **파일 암호화**: age, gpg, git-crypt, transcrypt를 사용한 완전한 파일 암호화
- **크로스 플랫폼**: 모든 주요 운영체제에서 실행 가능
- **단일 바이너리**: 의존성 없는 정적 링크 바이너리
- **루트 권한 불필요**: 일반 사용자 권한으로 실행 가능

## 핵심 개념

### Source State vs Target State

- **Source State**: chezmoi가 관리하는 원본 파일들 (보통 `~/.local/share/chezmoi/`)
- **Target State**: 실제 홈 디렉토리에 배포되는 파일들 (보통 `~/`)

### 작업 흐름

```bash
# 1. 초기화
chezmoi init <github-username>

# 2. 변경사항 확인
chezmoi diff

# 3. 적용
chezmoi apply

# 4. 소스 편집
chezmoi edit <file>

# 5. Git에 커밋
chezmoi cd
git add .
git commit -m "Update dotfiles"
git push
```

## 일상적인 사용법

### 파일 추가

```bash
# 기존 파일을 chezmoi로 관리 시작
chezmoi add ~/.zshrc

# 템플릿으로 추가
chezmoi add --template ~/.gitconfig
```

### 변경사항 적용

```bash
# 변경사항 미리보기
chezmoi diff

# 변경사항 적용
chezmoi apply

# 또는 한 번에
chezmoi apply -v
```

### 소스 편집

```bash
# 편집기로 소스 파일 직접 편집
chezmoi edit ~/.zshrc

# 소스 디렉토리로 이동
chezmoi cd
```

### 업데이트

```bash
# 원격 저장소에서 가져오기 및 적용
chezmoi update

# 또는 단계별로
chezmoi cd
git pull
exit
chezmoi apply
```

## 설치

### macOS (Homebrew)

```bash
brew install chezmoi
```

### Linux

```bash
# Snap
snap install chezmoi --classic

# 스크립트로 설치
sh -c "$(curl -fsLS get.chezmoi.io)"
```

## 설정 파일

chezmoi는 `~/.config/chezmoi/chezmoi.toml` 파일로 설정할 수 있습니다.

```toml
[data]
    name = "Your Name"
    email = "your.email@example.com"

[edit]
    command = "code"
    args = ["--wait"]
```

## 참고 자료

- [공식 웹사이트](https://www.chezmoi.io/)
- [GitHub 저장소](https://github.com/twpayne/chezmoi)
- [공식 문서](https://www.chezmoi.io/user-guide/)
- [최신 릴리스](https://github.com/twpayne/chezmoi/releases)

## 다음 단계

- [파일 명명 규칙](./file-naming-conventions.md) - chezmoi의 특수 파일명 접두사/접미사
- [템플릿 문법](./template-syntax.md) - Go 템플릿 사용법
- [생명주기 스크립트](./lifecycle-scripts.md) - 자동화 스크립트 작성법
- [프로젝트 구조](./project-structure.md) - 현재 dotfiles 구조 설명
