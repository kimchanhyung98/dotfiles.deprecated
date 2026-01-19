# Brew - Programming Languages

프로그래밍 언어 런타임입니다.

## 패키지 목록

| 패키지 | 언어 | 버전 관리 | 공식 사이트 |
|--------|------|-----------|-------------|
| `dotnet` | .NET | - | [dotnet.microsoft.com](https://dotnet.microsoft.com/) |
| `go` | Go | - | [go.dev](https://go.dev/) |
| `node` | Node.js | nvm | [nodejs.org](https://nodejs.org/) |
| `openjdk` | Java | - | [openjdk.org](https://openjdk.org/) |
| `php` | PHP | - | [php.net](https://www.php.net/) |
| `python` | Python | pyenv | [python.org](https://www.python.org/) |
| `python-setuptools` | Python 빌드 | - | [pypi.org](https://pypi.org/project/setuptools/) |
| `ruby` | Ruby | rbenv | [ruby-lang.org](https://www.ruby-lang.org/) |
| `rust` | Rust | rustup | [rust-lang.org](https://www.rust-lang.org/) |
| `kotlin` | Kotlin | - | [kotlinlang.org](https://kotlinlang.org/) |

## 설치

### 전체 설치

```bash
brew install dotnet go node openjdk php python python-setuptools ruby rust kotlin
```

### 개별 설치

```bash
brew install <language>
```

## 상세 설명

### dotnet (.NET)

Microsoft .NET 플랫폼.

```bash
# 버전 확인
dotnet --version

# 새 프로젝트
dotnet new console -n MyApp
dotnet run

# 패키지 추가
dotnet add package Newtonsoft.Json
```

### go (Go)

Google의 시스템 프로그래밍 언어.

```bash
# 버전 확인
go version

# 모듈 초기화
go mod init myproject

# 빌드 & 실행
go build
go run main.go

# 패키지 설치
go get github.com/gin-gonic/gin
```

**GOPATH 설정:**
```bash
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
```

### node (Node.js)

JavaScript 런타임.

```bash
# 버전 확인
node --version
npm --version

# 패키지 설치
npm install express

# 스크립트 실행
node app.js
```

**nvm (선택):**
```bash
# nvm 설치
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# 버전 관리
nvm install 20
nvm use 20
```

### openjdk (Java)

Java Development Kit.

```bash
# 버전 확인
java --version
javac --version

# 환경 변수 설정 (필요시)
export JAVA_HOME=$(/usr/libexec/java_home)
```

**심볼릭 링크 설정:**
```bash
sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
```

### php (PHP)

웹 개발 언어.

```bash
# 버전 확인
php --version

# 내장 서버
php -S localhost:8000

# Composer (패키지 매니저)
composer require vendor/package
```

### python (Python)

범용 프로그래밍 언어.

```bash
# 버전 확인
python3 --version
pip3 --version

# 가상환경
python3 -m venv venv
source venv/bin/activate

# 패키지 설치
pip install requests
```

**pyenv (선택):**
```bash
brew install pyenv
pyenv install 3.12
pyenv global 3.12
```

### ruby (Ruby)

동적 프로그래밍 언어.

```bash
# 버전 확인
ruby --version

# Gem 설치
gem install bundler

# rbenv (버전 관리)
rbenv install 3.3.0
rbenv global 3.3.0
```

### rust (Rust)

시스템 프로그래밍 언어.

```bash
# 버전 확인
rustc --version
cargo --version

# 새 프로젝트
cargo new myproject

# 빌드 & 실행
cargo build
cargo run

# 패키지 추가
cargo add serde
```

**rustup (권장):**
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### kotlin (Kotlin)

JVM 기반 현대적 언어.

```bash
# 버전 확인
kotlin -version
kotlinc -version

# REPL
kotlinc

# 컴파일
kotlinc main.kt -include-runtime -d main.jar
java -jar main.jar
```

## Brewfile 항목

```ruby
# Programming Languages
brew "dotnet"
brew "go"
brew "node"
brew "openjdk"
brew "php"
brew "python"
brew "python-setuptools"
brew "ruby"
brew "rust"
brew "kotlin"
```

## 버전 관리 도구

| 언어 | 버전 관리자 | 설치 |
|------|-------------|------|
| Node.js | nvm | `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh \| bash` |
| Python | pyenv | `brew install pyenv` |
| Ruby | rbenv | `brew install rbenv` |
| Rust | rustup | `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \| sh` |
| Java | jenv | `brew install jenv` |

## 요약

| 항목 | 값 |
|------|-----|
| **총 패키지 수** | 10 |
| **설치 용량** | ~3GB |
| **주요 용도** | 개발 환경 |
