# Chezmoi 파일 명명 규칙

## 개요

chezmoi는 특수한 접두사(prefix)와 접미사(suffix)를 사용하여 파일의 동작을 제어합니다. 이를 "속성(attributes)"이라고 합니다.

## 접두사 및 접미사 목록

### 파일 타입별 허용 속성

| 파일 타입 | 허용 접두사 | 허용 접미사 |
|-----------|-------------|-------------|
| **디렉토리** | `remove_`, `external_`, `exact_`, `private_`, `readonly_`, `dot_` | 없음 |
| **일반 파일** | `encrypted_`, `private_`, `readonly_`, `empty_`, `executable_`, `dot_` | `.tmpl` |
| **생성 파일** | `create_`, `encrypted_`, `private_`, `readonly_`, `empty_`, `executable_`, `dot_` | `.tmpl` |
| **수정 파일** | `modify_`, `encrypted_`, `private_`, `readonly_`, `executable_`, `dot_` | `.tmpl` |
| **삭제 파일** | `remove_`, `dot_` | 없음 |
| **스크립트** | `run_`, `once_` 또는 `onchange_`, `before_` 또는 `after_` | `.tmpl` |
| **심볼릭 링크** | `symlink_`, `dot_` | `.tmpl` |

## 주요 접두사 설명

### `dot_` - 점(.)으로 시작하는 파일

숨김 파일을 생성할 때 사용합니다.

```bash
# 소스: dot_zshrc
# 타겟: ~/.zshrc

# 소스: dot_config/nvim/init.vim
# 타겟: ~/.config/nvim/init.vim
```

**예시:**
```bash
# 현재 프로젝트의 예시
dot_bashrc          → ~/.bashrc
dot_gitconfig.tmpl  → ~/.gitconfig (템플릿 처리됨)
dot_vimrc           → ~/.vimrc
dot_zshrc           → ~/.zshrc
```

### `run_` - 실행 스크립트

파일 내용을 스크립트로 실행합니다.

```bash
# 소스: run_setup.sh
# 동작: chezmoi apply 시 매번 실행
```

### `once_` - 한 번만 실행

스크립트를 한 번만 실행합니다 (내용이 변경되지 않은 경우).

```bash
# 소스: run_once_install-packages.sh
# 동작: 최초 1회만 실행 (성공 시)
```

**예시:**
```bash
# 현재 프로젝트의 예시
run_once_01_macos-setting.sh.tmpl        # macOS 설정 (한 번만)
run_once_02_install-brewfile.sh.tmpl     # Homebrew 패키지 설치
run_once_03_clone-github.sh.tmpl         # GitHub 저장소 클론
run_once_04_ohmyzsh-setting.sh           # Oh My Zsh 설정
run_once_05_install-runtime-base.sh      # 런타임 설치
run_once_06_install-ai-npm.sh            # AI 도구 (npm)
run_once_07_install-ai-pipx.sh           # AI 도구 (pipx)
run_once_08_install-ai-others.sh         # 기타 AI 도구
run_once_99_validate-installation.sh     # 설치 검증
```

### `onchange_` - 변경 시 실행

스크립트 내용이 변경될 때마다 실행합니다.

```bash
# 소스: run_onchange_update-packages.sh
# 동작: 스크립트 내용 변경 시 실행
```

### `before_` / `after_` - 실행 순서 제어

파일 업데이트 전/후에 스크립트를 실행합니다.

```bash
# 소스: run_before_backup.sh
# 동작: 파일 업데이트 전에 실행

# 소스: run_after_reload.sh
# 동작: 파일 업데이트 후에 실행
```

### `private_` - 권한 제한

그룹 및 기타 사용자의 모든 권한을 제거합니다 (chmod 600).

```bash
# 소스: private_id_rsa
# 타겟: ~/.ssh/id_rsa (권한: 600)
```

### `readonly_` - 읽기 전용

모든 쓰기 권한을 제거합니다.

```bash
# 소스: readonly_config.yaml
# 타겟: ~/.config/config.yaml (읽기 전용)
```

### `executable_` - 실행 가능

파일에 실행 권한을 추가합니다.

```bash
# 소스: executable_script.sh
# 타겟: ~/script.sh (실행 가능)
```

### `empty_` - 빈 파일 유지

빈 파일도 유지합니다 (기본적으로 빈 파일은 제거됨).

```bash
# 소스: empty_placeholder
# 타겟: ~/placeholder (빈 파일이어도 유지)
```

### `encrypted_` - 암호화된 파일

소스 상태에서 파일을 암호화합니다.

```bash
# 소스: encrypted_secrets.yaml
# 동작: 암호화된 상태로 저장, 적용 시 복호화
```

### `exact_` - 정확한 디렉토리

chezmoi가 관리하지 않는 파일을 디렉토리에서 제거합니다.

```bash
# 소스: exact_dot_config
# 동작: ~/.config에 chezmoi가 관리하지 않는 파일 제거
```

### `remove_` - 파일/디렉토리 제거

타겟에서 파일이나 디렉토리를 제거합니다.

```bash
# 소스: remove_old_file
# 동작: ~/old_file 삭제
```

## 접미사

### `.tmpl` - 템플릿 파일

파일을 Go 템플릿으로 처리합니다.

```bash
# 소스: dot_gitconfig.tmpl
# 동작: 템플릿 처리 후 ~/.gitconfig 생성
```

**예시:**
```bash
# 현재 프로젝트의 예시
.chezmoi.toml.tmpl                       # chezmoi 설정 템플릿
dot_gitconfig.tmpl                       # Git 설정 템플릿
run_once_01_macos-setting.sh.tmpl        # macOS 설정 스크립트 템플릿
run_once_02_install-brewfile.sh.tmpl     # Brewfile 설치 템플릿
run_once_03_clone-github.sh.tmpl         # GitHub 클론 템플릿
```

## 속성 조합 규칙

### 접두사 순서

접두사는 특정 순서로 사용해야 합니다:

**일반 파일:**
```bash
encrypted_private_readonly_empty_executable_dot_filename.tmpl
```

**스크립트:**
```bash
run_once_before_scriptname.sh.tmpl
run_onchange_after_scriptname.sh.tmpl
```

**디렉토리:**
```bash
remove_external_exact_private_readonly_dot_dirname
```

### 조합 예시

```bash
# 암호화된 개인 실행 파일
encrypted_private_executable_dot_ssh_key

# 한 번만 실행되는 사전 스크립트 (템플릿)
run_once_before_install.sh.tmpl

# 변경 시 실행되는 사후 스크립트
run_onchange_after_update.sh

# 정확한 개인 디렉토리
exact_private_dot_config

# 읽기 전용 템플릿 파일
readonly_dot_profile.tmpl
```

## 실용 팁

### 번호 접두사 사용

스크립트 실행 순서를 명확히 하려면 숫자를 사용하세요:

```bash
run_once_01_macos-setting.sh.tmpl
run_once_02_install-brewfile.sh.tmpl
run_once_03_clone-github.sh.tmpl
run_once_99_validate-installation.sh
```

### literal_ 접두사

속성 파싱을 중단하려면 `literal_`을 사용하세요:

```bash
# 소스: literal_dot_example
# 타겟: ~/dot_example (dot_이 파일명으로 유지됨)
```

## 참고 자료

- [공식 문서 - Source State Attributes](https://www.chezmoi.io/reference/source-state-attributes/)
- [공식 문서 - Target Types](https://www.chezmoi.io/reference/target-types/)

## 다음 단계

- [템플릿 문법](./template-syntax.md) - Go 템플릿 사용법
- [생명주기 스크립트](./lifecycle-scripts.md) - 스크립트 작성 가이드
