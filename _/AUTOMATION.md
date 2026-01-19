# llms.txt 자동 업데이트 가이드

이 문서는 dotfiles 프로젝트에서 llms.txt를 자동으로 업데이트하는 4가지 방법을 설명합니다.

## 🎯 설정된 자동화 시스템

현재 프로젝트에는 다음 파일들이 설정되어 있습니다:

1. **CLAUDE.md** - 프로젝트별 자동화 규칙
2. **AGENTS.md** - 전용 에이전트 정의
3. **.claude/skills/update-llms.md** - 커스텀 skill
4. **.claude/settings.json** - Hook 설정

## 방법 1: CLAUDE.md (✅ 현재 활성화)

### 작동 방식
- 프로젝트 디렉토리에 진입하면 자동으로 로드됨
- 파일 수정 시 Claude가 규칙을 읽고 자동으로 llms.txt 업데이트

### 트리거 조건
```
Brewfile 변경 → 자동 업데이트
dot_* 파일 변경 → 자동 업데이트
run_once_*.sh 변경 → 자동 업데이트
.macos 변경 → 자동 업데이트
```

### 장점
- ✅ 가장 간단하고 직관적
- ✅ 별도 명령어 불필요
- ✅ 프로젝트별 커스터마이징 용이

### 사용 예시
```bash
# 사용자가 요청
$ "Brewfile에 tmux 추가해줘"

# Claude 동작
1. Brewfile 수정
2. CLAUDE.md 규칙 확인
3. llms.txt 자동 업데이트
4. "llms.txt를 업데이트했습니다" 메시지 출력
```

## 방법 2: AGENTS.md (✅ 현재 활성화)

### 작동 방식
- `llms-keeper` 에이전트가 파일 변경 감시
- `dotfiles-expert` 에이전트가 검증 수행

### 에이전트 역할

**llms-keeper**:
- 파일 변경 감지
- llms.txt 자동 업데이트
- 품질 검증

**dotfiles-expert**:
- chezmoi 규칙 준수 확인
- 스크립트 멱등성 검증
- 개선 사항 제안

### 장점
- ✅ 전문화된 에이전트
- ✅ 협업 가능
- ✅ 품질 보증 강화

## 방법 3: Custom Skill (✅ 현재 활성화)

### 작동 방식
- `/update-llms` 명령어로 수동 실행
- 또는 CLAUDE.md 규칙에 따라 자동 실행

### 사용 방법
```bash
# 명시적 실행
$ /update-llms

# 결과
✅ llms.txt를 업데이트했습니다
- 업데이트된 섹션: 패키지 관리, Shell 설정
- 새로 추가된 정보: tmux 패키지
- 변경 사항: Brewfile에 tmux 추가
```

### 장점
- ✅ 필요 시 수동 제어 가능
- ✅ 재사용 가능
- ✅ 다른 프로젝트에서도 사용 가능

## 방법 4: Hook 설정 (✅ 현재 활성화)

### 작동 방식
- Write/Edit 도구 사용 후 자동으로 hook 실행
- 특정 파일 패턴 감지 시 알림

### 설정 내용
```json
{
  "hooks": {
    "Write": {
      "after": "파일 변경 감지 스크립트"
    },
    "Edit": {
      "after": "파일 변경 감지 스크립트"
    }
  }
}
```

### 장점
- ✅ 시스템 레벨 자동화
- ✅ 놓칠 수 없음
- ✅ 다른 자동화와 조합 가능

## 🚀 권장 사용 방법

### 일반 작업
**자동으로 처리됨** - 아무것도 하지 않아도 됩니다!

```bash
# 사용자
"Brewfile에 neovim 추가"

# Claude (자동)
1. Brewfile 수정
2. llms.txt 자동 업데이트 ← CLAUDE.md 규칙
3. 완료 메시지
```

### 수동 업데이트가 필요한 경우
```bash
# 여러 파일을 한 번에 수정한 후
$ /update-llms
```

### 검증이 필요한 경우
```bash
# llms.txt가 정확한지 확인
$ "llms.txt 검증해줘"
```

## 📊 각 방법의 우선순위

```
1. CLAUDE.md (기본, 항상 작동)
   ↓
2. AGENTS.md (전문 에이전트 활용)
   ↓
3. Custom Skill (명시적 실행)
   ↓
4. Hook (백그라운드 모니터링)
```

## 🔧 문제 해결

### llms.txt가 업데이트되지 않는 경우

1. **CLAUDE.md 확인**:
   ```bash
   cat CLAUDE.md
   ```

2. **수동 실행**:
   ```bash
   /update-llms
   ```

3. **명시적 요청**:
   ```
   "llms.txt를 업데이트해줘"
   ```

### 업데이트가 부정확한 경우

1. **전체 재생성**:
   ```
   "llms.txt를 처음부터 다시 생성해줘"
   ```

2. **특정 섹션만 업데이트**:
   ```
   "llms.txt의 패키지 관리 섹션만 업데이트해줘"
   ```

## ⚙️ 커스터마이징

### 트리거 조건 추가

`CLAUDE.md` 수정:
```markdown
### 업데이트 트리거
1. 기존 조건들...
2. **새 조건**: 특정 파일 변경 시
```

### 새 에이전트 추가

`AGENTS.md` 수정:
```markdown
## new-agent
**역할**: 새로운 역할
**행동 규칙**: ...
```

### Skill 확장

`.claude/skills/` 에 새 skill 추가

## 📝 테스트

### 자동화 테스트
```bash
# 1. 파일 수정
echo "brew 'test'" >> Brewfile

# 2. Claude에게 요청
"Brewfile을 읽고 llms.txt를 업데이트해줘"

# 3. 결과 확인
cat llms.txt | grep "test"
```

### 전체 워크플로우 테스트
```bash
# 1. 새 스크립트 생성 요청
"run_once_10_test.sh 스크립트를 만들어줘"

# 2. 자동으로:
# - 스크립트 생성
# - llms.txt 업데이트 (파일 구조 섹션)
# - 완료 메시지

# 3. 검증
cat llms.txt | grep "run_once_10"
```

## 🎓 추가 정보

- **Claude Code 문서**: https://claude.com/claude-code
- **chezmoi 문서**: https://www.chezmoi.io
- **SuperClaude**: ~/.claude/CLAUDE.md

## 📌 요약

✅ **4가지 방법 모두 설정 완료**
✅ **기본적으로 자동 업데이트 활성화**
✅ **수동 제어도 가능**
✅ **문제 발생 시 여러 백업 방법 존재**

**결론**: 이제 파일을 수정할 때마다 llms.txt가 자동으로 업데이트됩니다! 🎉
