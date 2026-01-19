# Dotfiles 문서 인덱스

이 디렉토리는 chezmoi 기반 dotfiles 프로젝트의 상세 문서를 포함합니다.

## 📚 문서 목록

### 1. [Chezmoi 기본 가이드](./chezmoi-basics.md)

chezmoi의 기본 개념과 일상적인 사용법을 다룹니다.

**포함 내용:**
- chezmoi 소개 및 주요 특징
- Source State vs Target State 개념
- 기본 명령어 및 워크플로우
- 설치 방법 (macOS, Linux)
- 설정 파일 구조

**대상 독자:** chezmoi 초보자, 새로운 팀원

### 2. [파일 명명 규칙](./file-naming-conventions.md)

chezmoi의 특수 파일명 접두사와 접미사를 설명합니다.

**포함 내용:**
- 접두사 목록 (`dot_`, `run_`, `once_`, `onchange_`, `private_`, 등)
- 접미사 (`.tmpl`)
- 파일 타입별 허용 속성
- 속성 조합 규칙
- 실제 프로젝트 예시

**대상 독자:** chezmoi 사용자, dotfiles 관리자

### 3. [템플릿 문법](./template-syntax.md)

Go 템플릿을 사용한 동적 설정 파일 생성 방법을 설명합니다.

**포함 내용:**
- 기본 템플릿 구조 (변수, 조건문, 반복문)
- 사용 가능한 변수 (`.chezmoi.*`, 사용자 정의)
- 공백 제어 기법
- 함수 (문자열, 비교, 논리)
- 프롬프트 함수 (`promptStringOnce`, 등)
- 실제 프로젝트 예시
- 디버깅 방법

**대상 독자:** 고급 사용자, 다중 환경 관리자

### 4. [생명주기 스크립트](./lifecycle-scripts.md)

자동화 스크립트 작성 방법과 실행 메커니즘을 다룹니다.

**포함 내용:**
- 스크립트 타입 (`run_`, `run_once_`, `run_onchange_`)
- 실행 순서 제어 (`run_before_`, `run_after_`)
- 템플릿과 결합
- 환경 변수
- 실제 프로젝트 스크립트 상세 분석
- 모범 사례 및 디버깅

**대상 독자:** 자동화 작업자, DevOps 엔지니어

### 5. [프로젝트 구조](./project-structure.md)

현재 dotfiles 프로젝트의 구조와 각 파일의 역할을 설명합니다.

**포함 내용:**
- 전체 디렉토리 구조
- 핵심 파일 상세 설명
- 초기화 스크립트 실행 순서 및 목적
- 워크플로우 다이어그램
- 확장 가이드
- 문제 해결 방법

**대상 독자:** 프로젝트 기여자, 유지보수 담당자

## 🚀 빠른 시작

### 처음 사용자

1. [Chezmoi 기본 가이드](./chezmoi-basics.md) 읽기
2. [프로젝트 구조](./project-structure.md)로 전체 구조 파악
3. 메인 README.md의 설치 방법 따라하기

### 기존 사용자

- 파일 추가: [파일 명명 규칙](./file-naming-conventions.md)
- 템플릿 사용: [템플릿 문법](./template-syntax.md)
- 스크립트 작성: [생명주기 스크립트](./lifecycle-scripts.md)

### 유지보수 담당자

- [프로젝트 구조](./project-structure.md)의 "확장 가이드" 섹션
- [생명주기 스크립트](./lifecycle-scripts.md)의 "모범 사례" 섹션
- CLAUDE.md의 자동화 규칙

## 🔗 관련 링크

### 공식 문서
- [chezmoi 공식 웹사이트](https://www.chezmoi.io/)
- [chezmoi GitHub](https://github.com/twpayne/chezmoi)
- [chezmoi 사용자 가이드](https://www.chezmoi.io/user-guide/)
- [chezmoi 레퍼런스](https://www.chezmoi.io/reference/)

### 최신 정보
- [최신 릴리스 (v2.69.3)](https://github.com/twpayne/chezmoi/releases)
- [변경 로그](https://github.com/twpayne/chezmoi/blob/master/CHANGELOG.md)

### 커뮤니티
- [GitHub Discussions](https://github.com/twpayne/chezmoi/discussions)
- [Reddit r/chezmoi](https://www.reddit.com/r/chezmoi/)

## 📖 학습 경로

### 초급 (1-2시간)
```
Chezmoi 기본 가이드 → 프로젝트 구조 → 실습 (chezmoi init, apply)
```

### 중급 (3-5시간)
```
파일 명명 규칙 → 템플릿 문법 → 실습 (템플릿 파일 작성)
```

### 고급 (5-10시간)
```
생명주기 스크립트 → 고급 템플릿 → 실습 (자동화 스크립트 작성)
```

## 🤝 기여 가이드

### 문서 업데이트

1. **자동 업데이트 (권장)**
   - CLAUDE.md의 규칙에 따라 자동으로 llms.txt 업데이트
   - 파일 변경 시 자동으로 관련 문서 동기화

2. **수동 업데이트**
   ```bash
   # 1. 문서 편집
   vim docs/chezmoi-basics.md

   # 2. Git 커밋
   git add docs/
   git commit -m "docs: Update chezmoi basics guide"

   # 3. llms.txt 업데이트 확인
   # Claude Code가 자동으로 처리
   ```

### 새 문서 추가

1. `docs/` 디렉토리에 마크다운 파일 생성
2. 이 README.md에 링크 추가
3. llms.txt 자동 업데이트 확인
4. Git 커밋

### 문서 스타일 가이드

- **제목**: `#` 사용, 명확하고 간결하게
- **코드 블록**: 언어 지정 (```bash, ```toml, 등)
- **예시**: 실제 프로젝트 파일 참조
- **링크**: 상대 경로 사용 (`./filename.md`)
- **테이블**: 복잡한 정보 정리에 활용
- **강조**: **굵게**, *기울임*, `코드` 적절히 사용

## 🔄 문서 버전 관리

이 문서들은 chezmoi와 프로젝트 업데이트에 맞춰 유지됩니다.

**최근 업데이트:**
- 2026-01-19: 초기 문서 작성
- chezmoi v2.69.3 기준

**업데이트 정책:**
- chezmoi 주요 버전 변경 시 문서 검토
- 프로젝트 구조 변경 시 즉시 반영
- 매 분기 문서 정확성 검증

## 💡 팁

### 효율적인 문서 활용

1. **검색 기능 사용**: 각 문서는 상세한 목차 포함
2. **예시 코드 복사**: 모든 예시는 실행 가능한 코드
3. **링크 활용**: 관련 섹션 간 빠른 이동
4. **북마크**: 자주 참조하는 섹션 북마크

### 문제 해결 흐름

```
문제 발생
  ↓
관련 문서 찾기 (이 README 참조)
  ↓
해당 문서의 "문제 해결" 섹션 확인
  ↓
해결 안 되면 GitHub Issues 검색
  ↓
새 이슈 생성 또는 질문
```

## 📝 피드백

문서 개선 제안이나 오류 발견 시:

1. GitHub Issue 생성
2. Pull Request 제출
3. 직접 문의

**문서 품질 목표:**
- 정확성: 최신 정보 반영
- 완전성: 모든 주요 기능 커버
- 접근성: 초보자도 이해 가능
- 실용성: 실제 사용 예시 중심

---

**마지막 업데이트**: 2026-01-19
**chezmoi 버전**: v2.69.3
**문서 관리자**: kimchanhyung98
