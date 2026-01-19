# Brew - Development Tools

개발 관련 도구 및 패키지 매니저입니다.

## 패키지 목록

| 패키지 | 설명 | 관련 언어/플랫폼 |
|--------|------|------------------|
| `awscli` | AWS CLI | Cloud |
| `composer` | PHP 패키지 매니저 | PHP |
| `gcloud-cli` | Google Cloud CLI (cask) | Cloud |
| `git` | 버전 관리 | All |
| `git-lfs` | Git Large File Storage | Git |
| `npm` | Node 패키지 매니저 | JavaScript |
| `pipx` | Python 앱 설치 도구 | Python |
| `rbenv` | Ruby 버전 관리 | Ruby |
| `sqlite` | 경량 데이터베이스 | Database |
| `uv` | Python 패키지 관리자 | Python |
| `vim` | 텍스트 에디터 | All |
| `watchman` | 파일 변경 감지 | React Native |
| `xcodes` | Xcode 버전 관리 | iOS/macOS |
| `yarn` | JavaScript 패키지 매니저 | JavaScript |

## 설치

```bash
# brew packages
brew install awscli composer git git-lfs npm pipx rbenv sqlite uv vim watchman xcodes yarn

# cask packages
brew install --cask google-cloud-sdk
```

## 상세 설명

### awscli (AWS CLI)

Amazon Web Services 명령줄 인터페이스.

```bash
# 버전 확인
aws --version

# 설정
aws configure

# 사용 예시
aws s3 ls
aws ec2 describe-instances
```

**필요 정보:**
- AWS Access Key ID
- AWS Secret Access Key
- Default region (예: ap-northeast-2)

### composer

PHP 의존성 관리자.

```bash
# 버전 확인
composer --version

# 프로젝트 초기화
composer init

# 패키지 설치
composer require vendor/package
composer install

# 오토로더
composer dump-autoload
```

### gcloud-cli

Google Cloud Platform CLI.

```bash
# 초기화
gcloud init

# 로그인
gcloud auth login

# 프로젝트 설정
gcloud config set project PROJECT_ID

# 사용 예시
gcloud compute instances list
gcloud app deploy
```

### git

버전 관리 시스템.

```bash
# 설정
git config --global user.name "Your Name"
git config --global user.email "your@email.com"

# 기본 사용
git init
git add .
git commit -m "message"
git push

# 브랜치
git checkout -b feature-branch
git merge feature-branch
```

### git-lfs

대용량 파일 관리.

```bash
# 초기화
git lfs install

# 파일 추적
git lfs track "*.psd"
git lfs track "*.zip"

# 추적 목록
git lfs ls-files

# .gitattributes 커밋
git add .gitattributes
```

### npm

Node.js 패키지 매니저.

```bash
# 버전 확인
npm --version

# 패키지 설치
npm install package
npm install -g global-package

# 스크립트 실행
npm run build
npm test

# 패키지 업데이트
npm update
npm outdated
```

### pipx

Python 애플리케이션을 독립적으로 설치.

```bash
# 설치
brew install pipx
pipx ensurepath

# 패키지 설치
pipx install package-name

# 업그레이드
pipx upgrade package-name
pipx upgrade-all

# 목록
pipx list
```

### rbenv

Ruby 버전 관리자.

```bash
# 설치 가능 버전
rbenv install -l

# 설치
rbenv install 3.3.0

# 전역 설정
rbenv global 3.3.0

# 로컬 설정 (프로젝트별)
rbenv local 3.2.0

# 현재 버전
rbenv version
```

### sqlite

경량 SQL 데이터베이스.

```bash
# 데이터베이스 열기
sqlite3 database.db

# 기본 명령어 (SQLite 프롬프트)
.tables
.schema table_name
.quit

# SQL 실행
sqlite3 database.db "SELECT * FROM users;"
```

### uv

빠른 Python 패키지 관리자 (Rust 기반).

```bash
# 패키지 설치
uv pip install package

# 가상환경
uv venv
source .venv/bin/activate

# requirements 설치
uv pip install -r requirements.txt

# 동기화
uv pip sync requirements.txt
```

### vim

텍스트 에디터.

```bash
# 파일 열기
vim file.txt

# 기본 모드
i       # Insert 모드
Esc     # Normal 모드
:w      # 저장
:q      # 종료
:wq     # 저장 후 종료
:q!     # 강제 종료
```

### watchman

파일 시스템 변경 감지.

```bash
# 버전 확인
watchman --version

# 감시 시작
watchman watch /path/to/project

# 감시 목록
watchman watch-list

# React Native에서 자동 사용됨
```

### xcodes

Xcode 버전 관리.

```bash
# 설치 가능 버전
xcodes list

# 설치
xcodes install 15.0

# 현재 버전
xcodes installed

# 선택
xcodes select 15.0
```

### yarn

대안 JavaScript 패키지 매니저.

```bash
# 버전 확인
yarn --version

# 패키지 설치
yarn add package
yarn global add global-package

# 스크립트 실행
yarn build
yarn test

# 업그레이드
yarn upgrade
```

## Brewfile 항목

```ruby
# Development Tools
brew "awscli"
brew "composer"
brew "git"
brew "git-lfs"
brew "npm"
brew "pipx"
brew "rbenv"
brew "sqlite"
brew "uv"
brew "vim"
brew "watchman"
brew "xcodes"
brew "yarn"

# Cask
cask "google-cloud-sdk"
```

## 클라우드 CLI 비교

| CLI | 플랫폼 | 설치 방법 |
|-----|--------|-----------|
| `awscli` | AWS | `brew install awscli` |
| `gcloud-cli` | GCP | `brew install --cask google-cloud-sdk` |
| `az` | Azure | `brew install azure-cli` (선택) |

## 요약

| 항목 | 값 |
|------|-----|
| **총 패키지 수** | 14 |
| **brew** | 13 |
| **cask** | 1 |
| **설치 용량** | ~1GB |
