# Claude Code 전역 지침

## 기본 규칙

- 한국어로 응답
- 기술 용어와 코드 식별자는 원어 유지
- 코드 주석은 영어 또는 한국어 (프로젝트 컨벤션 따름)

## 코딩 스타일

- ESLint/Prettier 규칙 준수
- 일관된 네이밍 컨벤션 유지
- 함수형 프로그래밍 선호 (가능한 경우)

## 커밋 메시지

- 형식: `type: description`
- 타입: feat, fix, docs, style, refactor, test, chore
- 예시: `feat: Add user authentication`

## 보안

- API 키, 비밀번호, 토큰 노출 금지
- .env 파일 내용 출력 금지
- 민감한 정보 마스킹 처리

## 작업 규칙

- 변경 전 git status 확인
- 대규모 변경 전 백업 권장
- 테스트 실행 후 커밋
