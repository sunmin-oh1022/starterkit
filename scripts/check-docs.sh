#!/usr/bin/env bash
# 문서·정합성 검증 (스타터킷 generic 버전).
#   - 스타터킷 기본 골격 파일이 모두 있나
#   - AGENTS.md → behavior.md → rules/methodology 자동 로드 체인이 살아 있나
#   - CLAUDE.md 심링크 (Day 0 산출물) — 없으면 경고만, 잘못 가리키면 실패
#   - methodology 내부 상호 링크 (README ↔ templates)
#   - `(TODO …)` 플레이스홀더 잔여 수 — Phase 1 채움 진행 신호
#   - 프로젝트별 1초 검증은 자리만 마련해두고, 채우는 건 본 프로젝트의 일
# 사용: bash scripts/check-docs.sh   (루트 어디서 호출해도 OK)
# 종료 코드: 0 = 통과 (warning 무관), 1 = 한 가지라도 실패

set -uo pipefail
cd "$(dirname "$0")/.."

FAIL=0
ok()      { printf '  \033[32m✓\033[0m %s\n' "$*"; }
warn()    { printf '  \033[33m!\033[0m %s\n' "$*"; }
miss()    { printf '  \033[31m✗\033[0m %s\n' "$*"; FAIL=$((FAIL+1)); }
section() { printf '\n== %s ==\n' "$*"; }

section "1. 스타터킷 기본 골격 파일 존재"
PATHS=(
  AGENTS.md
  CHECKLIST.md DEVLOG.md HISTORY.md SHARE.md README.md
  rules/behavior.md rules/boundaries.md rules/architecture.md
  rules/commands.md rules/domain.md rules/ui.md rules/ux.md
  rules/methodology/README.md rules/methodology/templates.md
  docs/product/PRD.md docs/product/glossary.md docs/product/personas.md
  docs/requirements/REQ.md docs/requirements/flows/FLOW-001.md
  docs/policies/POL.md
  docs/screens/SCR-001.md
  docs/acceptance/TC.md
)
for p in "${PATHS[@]}"; do
  if [ -e "$p" ] || [ -L "$p" ]; then ok "$p"; else miss "$p"; fi
done

section "2. 자동 로드 체인 (AGENTS.md → behavior.md → methodology)"
grep -q '@rules/behavior.md'   AGENTS.md && ok 'AGENTS.md @rules/behavior.md'   || miss 'AGENTS.md @rules/behavior.md 누락'
grep -q '@rules/boundaries.md' AGENTS.md && ok 'AGENTS.md @rules/boundaries.md' || miss 'AGENTS.md @rules/boundaries.md 누락'
grep -q 'rules/methodology'    AGENTS.md && ok 'AGENTS.md → rules/methodology'  || miss 'AGENTS.md → rules/methodology 누락'

section "3. CLAUDE.md → AGENTS.md 심볼릭링크 (Day 0 산출물)"
if [ -L CLAUDE.md ] && [ "$(readlink CLAUDE.md)" = 'AGENTS.md' ]; then
  ok 'CLAUDE.md -> AGENTS.md'
elif [ ! -e CLAUDE.md ]; then
  warn 'CLAUDE.md 없음 — Day 0 에서 `ln -s AGENTS.md CLAUDE.md` 로 만든다 (Codex/Claude Code 한 벌 관리용)'
else
  miss 'CLAUDE.md 가 AGENTS.md 를 가리키지 않음'
fi

section "4. methodology 내부 상호 링크"
grep -qF '[templates.md](./templates.md)' rules/methodology/README.md    && ok 'README → templates' || miss 'README → templates 끊김'
grep -qF '[README.md](./README.md)'       rules/methodology/templates.md && ok 'templates → README' || miss 'templates → README 끊김'

section "5. (TODO) 플레이스홀더 잔여 — Phase 1 채움 진행 신호"
TODO_LINES=$(grep -rE '\(TODO' AGENTS.md rules/ docs/ 2>/dev/null | wc -l | tr -d ' ')
TODO_FILES=$(grep -rlE '\(TODO' AGENTS.md rules/ docs/ 2>/dev/null | wc -l | tr -d ' ')
if [ "$TODO_LINES" -gt 0 ]; then
  warn "TODO 잔여 — ${TODO_FILES}개 파일, ${TODO_LINES}개 줄 (Phase 1 진행 중이면 정상. 모두 채워지면 ✓ 로 바뀜)"
else
  ok 'TODO 잔여 없음 — Phase 1 완료 신호'
fi

section "6. 프로젝트별 1초 검증 (TODO — rules/commands.md 채운 뒤 여기 호출 추가)"
# 본 프로젝트의 빌드·테스트 명령을 여기에 추가한다. 예시:
#   - swift test --package-path Core
#   - npm test  /  pytest -q  /  go test ./...
# 그리고 외부 통신 0건 가드(TC-103)도 함께. 채워지면 위 warn 을 ok 로 바꾼다.
warn '아직 미정 — `rules/commands.md` 에 빌드·테스트 명령 채우고 이 섹션에 호출 추가'

echo ""
if [ "$FAIL" -eq 0 ]; then
  printf '\033[32mALL GREEN\033[0m  (warning 은 Day 0/1 진행 신호일 수 있음)\n'
  exit 0
else
  printf '\033[31mFAILED — %d 항목 실패\033[0m\n' "$FAIL"
  exit 1
fi
