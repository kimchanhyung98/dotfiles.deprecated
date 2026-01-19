# Brew - Applications

GUI 애플리케이션 (cask) 목록입니다.

## Development Apps

개발용 애플리케이션입니다.

| 앱 | 설명 | 공식 사이트 |
|----|------|-------------|
| `docker` | 컨테이너 플랫폼 | [docker.com](https://www.docker.com/) |
| `figma` | 디자인 도구 | [figma.com](https://www.figma.com/) |
| `flutter` | 모바일 앱 SDK | [flutter.dev](https://flutter.dev/) |
| `github` | GitHub Desktop | [desktop.github.com](https://desktop.github.com/) |
| `postman` | API 테스트 | [postman.com](https://www.postman.com/) |
| `proxyman` | HTTP 프록시 | [proxyman.io](https://proxyman.io/) |

### 설치

```bash
brew install --cask docker figma flutter github postman proxyman
```

### 상세 설명

#### Docker

컨테이너 기반 개발 환경.

```bash
# Docker 실행 후
docker --version
docker-compose --version

# 컨테이너 실행
docker run -d -p 80:80 nginx
docker ps

# 이미지 관리
docker images
docker pull ubuntu:latest
```

#### Flutter

크로스플랫폼 모바일 개발.

```bash
# 환경 확인
flutter doctor

# 프로젝트 생성
flutter create my_app

# 실행
flutter run
```

**PATH 설정:**
```bash
export PATH="$PATH:/opt/homebrew/Caskroom/flutter/*/flutter/bin"
```

#### Postman

API 테스트 및 문서화.

- REST/GraphQL API 테스트
- 컬렉션 및 환경 변수
- 자동화 테스트 (Newman)
- API 문서 생성

#### Proxyman

HTTP/HTTPS 트래픽 분석.

- 네트워크 요청 모니터링
- SSL 핀닝 우회
- 요청/응답 수정
- 브레이크포인트

---

## Productivity Apps

일반 생산성 도구입니다.

| 앱 | 설명 | 공식 사이트 |
|----|------|-------------|
| `appcleaner` | 앱 제거 도구 | [freemacsoft.net](https://freemacsoft.net/appcleaner/) |
| `google-chrome` | 웹 브라우저 | [google.com/chrome](https://www.google.com/chrome/) |
| `iina` | 미디어 플레이어 | [iina.io](https://iina.io/) |
| `iterm2` | 터미널 에뮬레이터 | [iterm2.com](https://iterm2.com/) |
| `keka` | 압축 도구 | [keka.io](https://www.keka.io/) |
| `rectangle` | 윈도우 관리 | [rectangleapp.com](https://rectangleapp.com/) |
| `slack` | 팀 커뮤니케이션 | [slack.com](https://slack.com/) |
| `stats` | 시스템 모니터 | [github.com/exelban/stats](https://github.com/exelban/stats) |
| `zoom` | 화상 회의 | [zoom.us](https://zoom.us/) |

### 설치

```bash
brew install --cask appcleaner google-chrome iina iterm2 keka rectangle slack stats zoom
```

### 상세 설명

#### iTerm2

고급 터미널 에뮬레이터.

**주요 기능:**
- 탭 및 분할 창
- 검색
- 자동 완성
- 프로필 및 테마
- Triggers 및 트리거

**단축키:**
| 단축키 | 기능 |
|--------|------|
| `Cmd+T` | 새 탭 |
| `Cmd+D` | 세로 분할 |
| `Cmd+Shift+D` | 가로 분할 |
| `Cmd+[/]` | 패널 이동 |

#### Rectangle

윈도우 관리 도구.

**단축키:**
| 단축키 | 기능 |
|--------|------|
| `Ctrl+Opt+←` | 왼쪽 절반 |
| `Ctrl+Opt+→` | 오른쪽 절반 |
| `Ctrl+Opt+↑` | 위쪽 절반 |
| `Ctrl+Opt+↓` | 아래쪽 절반 |
| `Ctrl+Opt+Enter` | 최대화 |
| `Ctrl+Opt+C` | 중앙 |

#### Stats

메뉴 바 시스템 모니터.

**표시 정보:**
- CPU 사용량
- 메모리 사용량
- 디스크 사용량
- 네트워크 속도
- 배터리 상태
- 팬 속도

---

## Optional Apps

주석 처리된 선택 설치 앱입니다.

### Code Editors

| 앱 | 설명 | 설치 |
|----|------|------|
| `visual-studio-code` | VS Code | `brew install --cask visual-studio-code` |
| `cursor` | AI 코드 에디터 | `brew install --cask cursor` |
| `windsurf` | AI 코드 에디터 | `brew install --cask windsurf` |

### JetBrains

[JetBrains Toolbox](https://www.jetbrains.com/toolbox-app/)를 통한 설치 권장.

| 앱 | 설명 | 설치 |
|----|------|------|
| `jetbrains-toolbox` | JetBrains 관리 | `brew install --cask jetbrains-toolbox` |
| `android-studio` | Android 개발 | `brew install --cask android-studio` |
| `pycharm` | Python IDE | `brew install --cask pycharm` |
| `goland` | Go IDE | `brew install --cask goland` |
| `phpstorm` | PHP IDE | `brew install --cask phpstorm` |
| `datagrip` | Database IDE | `brew install --cask datagrip` |

---

## Brewfile 항목

```ruby
# Development Apps
cask "docker"
cask "figma"
cask "flutter"
cask "github"
cask "postman"
cask "proxyman"

# Other Apps
cask "appcleaner"
cask "google-chrome"
cask "iina"
cask "iterm2"
cask "keka"
cask "rectangle"
cask "slack"
cask "stats"
cask "zoom"

# Optional (주석 처리됨)
# cask "visual-studio-code"
# cask "cursor"
# cask "windsurf"
# cask "jetbrains-toolbox"
```

---

## 요약

| 카테고리 | 앱 수 |
|----------|-------|
| **Development Apps** | 6 |
| **Productivity Apps** | 9 |
| **Optional** | 8+ |
| **총계 (기본)** | **15** |

| 항목 | 값 |
|------|-----|
| **설치 용량** | ~5GB |
| **설치 위치** | `/Applications` |
