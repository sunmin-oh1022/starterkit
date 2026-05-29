# AGENTS.md — 진입점 (얇게 유지, 권장 200줄 이하)

> 이 파일은 AI 코딩 에이전트가 매 세션 가장 먼저 읽는 프로젝트 설명서다.
> Claude Code는 CLAUDE.md, Codex는 AGENTS.md를 읽는다. 한 벌만 관리하려면: `ln -s AGENTS.md CLAUDE.md`

## 이 프로젝트는 — (TODO 프로젝트명)
- (TODO 한 줄 정의) → `docs/product/PRD.md` 참조
- 두 레이어:
  - **(TODO Core 모듈명)/** — 순수 로직. (TODO 표준 API)만, UI·네트워크 의존 없음.
  - **(TODO App 모듈명)/** — UI 레이어. Core 호출만.

## 항상 적용 (자동 로드)
@rules/behavior.md
@rules/boundaries.md

## Rule Index (작업에 맞는 것만 추가로 읽는다 — 전부 읽지 않는다)
- 구조·아키텍처 맥락       → `rules/architecture.md`
- 빌드 / 테스트 / 린트     → `rules/commands.md`
- 화면·UI 작업            → `rules/ui.md`, `rules/ux.md`
- 도메인 로직·규칙 수정     → `rules/domain.md`
- **기획 방법론·작업 프로세스 → `rules/methodology/README.md`** (새 기능 기획, 마감 전 셀프 검토 시)

## 기획 문서 (무엇을 만드나)
- 정의·범위        → `docs/product/PRD.md`
- 용어(단일 진실)   → `docs/product/glossary.md`
- 요건 목록        → `docs/requirements/REQ.md`
- 정책·금지        → `docs/policies/POL.md`
- 화면(상태매트릭스) → `docs/screens/SCR-001.md` 등
- 사용자 플로우     → `docs/requirements/flows/FLOW-001.md`
- 검증 기준(GWT)   → `docs/acceptance/TC.md`

## 1초 검증
프로젝트 루트에서 실행한다. `rules/commands.md` 참조.

## 작업 지시 예시 (핸드오프 — 한 줄)
> REQ-001 을 SCR-001 에 구현해. POL-001 정책 지키고 TC-001 통과시켜.
> 상태 매트릭스 모든 케이스를 구현하고, glossary.md 표기를 그대로 따라.
