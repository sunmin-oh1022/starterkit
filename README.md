# starter-kit — 기획자 × AI 페어 작업 범용 스타터킷

> **목적**: 새 프로젝트를 시작할 때, 매번 `rules/methodology/`·`AGENTS.md`·문서 템플릿을 다시 만들지 않게.
> 통째로 복사 → 프로젝트명 채움 → Day 0 → Phase 1 순서.

## 사용법 (3단계, 터미널 안 써도 됨)

### 1단계 — 폴더 복사하기 (Finder만 쓰면 됨)
1. Finder 에서 이 `starter-kit` 폴더를 통째로 선택
2. ⌘C → ⌘V 로 복사 → 복사본 이름을 내 프로젝트 이름으로 바꾸기 (예: `my-new-project`)
3. 원하는 위치로 옮기기 (예: `Documents/Claude/Projects/` 안)

### 2단계 — AI 에게 환경 셋업 부탁
새 폴더를 Cowork(또는 Claude Code)에 연결한 후, 아래 메시지를 그대로 복사해서 보내면 돼:

> 이 폴더에서 Day 0 셋업 해줘:
> 1. Git 저장소 만들고 첫 커밋
> 2. `AGENTS.md` 를 `CLAUDE.md` 로도 인식되게 연결 (심볼릭 링크)
> 3. `AGENTS.md` 안의 `(TODO)` 자리를 같이 채우자 — 프로젝트 이름·정의·기술 스택 정해줘

AI 가 알아서 Git 저장소를 만들고, 두 파일을 같은 진입점으로 연결하고, 무엇을 채워야 할지 하나씩 물어볼 거야.

### 3단계 — 기획 시작
AI 가 셋업을 끝내면, 가장 먼저 같이 읽을 한 페이지:
**[`rules/methodology/README.md`](./rules/methodology/README.md)** — 5대 원리·작업 흐름·셀프 검토 프롬프트.

그다음 PRD 부터 차근차근 채우면 돼. 한 번에 다 완벽히 채울 필요 없음 — Out of scope 칸 하나만 정해도 시작은 충분해.

<details>
<summary>(참고) 터미널이 익숙한 사람용 — 한 줄 명령</summary>

```bash
cp -r starter-kit ~/Documents/Claude/Projects/my-new-project
cd ~/Documents/Claude/Projects/my-new-project
git init && git add -A && git commit -m "chore: 스타터킷 초기화"
ln -s AGENTS.md CLAUDE.md
```
</details>

## 0. 가장 먼저 읽을 한 페이지
[`rules/methodology/README.md`](./rules/methodology/README.md) — 5대 원리, 6 Phase, 4단 체계, Day 0 체크리스트, 마감 셀프 검토 프롬프트. 이거 하나면 작업 흐름이 잡혀.

## 1. 폴더 구조
```
my-new-project/
├── AGENTS.md (= CLAUDE.md 로도 연결)  ← AI 가 매 세션 가장 먼저 읽는 진입점. (TODO) 마커 채움
├── CHECKLIST.md                      ← 환경 셋업 체크리스트
├── DEVLOG.md · HISTORY.md · SHARE.md ← 결정·버전·기능 기록
├── PRIVACY.md · RELEASE.md           ← 출시 운영 (개인정보 처리방침 + 릴리스 노트·체크리스트)
├── rules/                            ← "어떻게 일하나" — 메타 규칙
│   ├── behavior.md · boundaries.md   (항상 @import)
│   ├── architecture.md · commands.md · domain.md · ui.md · ux.md  (작업별)
│   └── methodology/                  ← 기획·작업 방법론 (그대로 두면 됨)
└── docs/                             ← "무엇을 만드나" — 산출물
    ├── product/        PRD · glossary · personas
    ├── requirements/   REQ · flows/FLOW-###
    ├── policies/       POL
    ├── screens/        SCR-### (★ 상태 매트릭스 6개)
    └── acceptance/     TC (Given–When–Then)
```

## 2. 채워야 할 (TODO) 자리 (스택·도메인 의존)
| 파일 | 무엇을 |
| --- | --- |
| `AGENTS.md` | 이 프로젝트 정의 1줄 + Core/App 레이어 이름 |
| `rules/boundaries.md` | 도메인 고유 가드레일 (시간·네이밍·외부 의존 등) |
| `rules/architecture.md` | 폴더 배치 (스택별로 다름) |
| `rules/commands.md` | 1초 검증 명령 (`swift test` / `npm test` / `pytest` ...) |
| `rules/domain.md` | 도메인 단일 출처 규칙 |
| `docs/product/PRD.md` | 정의·범위·KPI·비기능 |
| `docs/product/glossary.md` | 용어·데이터 단일 진실 |
| `docs/policies/POL.md` | 정책 표 (사유 + 적용 시점 필수) |
| `docs/requirements/REQ.md` | 요건 표 (MoSCoW + 화면·정책·TC ID) |
| `docs/screens/SCR-###.md` | 화면별 상태 매트릭스 6개 |
| `docs/acceptance/TC.md` | Given–When–Then |

## 3. ID 체계
`REQ-### → SCR-### → TC-###`, 정책 `POL-###`, 플로우 `FLOW-###`.
한 줄 핸드오프 예: "REQ-001을 SCR-001에 구현. POL-001 지키고 TC-001 통과."

## 4. 문서 4단 체계 (위 → 아래 = 넓은 맥락 → 구체 검증)
| 단계 | 파일 |
| --- | --- |
| ① 상시 브리프 | `docs/product/PRD.md` |
| ② 가드레일 | `docs/policies/POL.md` · `docs/product/glossary.md` · `rules/boundaries.md` |
| ③ 가이드 | `docs/requirements/REQ.md` · `flows/FLOW-001.md` · `screens/SCR-001.md` |
| ④ 검증·기록 | `docs/acceptance/TC.md` · `DEVLOG.md` · `HISTORY.md` |

## 5. 점진 도입 (한 번에 다 안 채워도 됨)
1주차 PRD Out of scope → 2주차 glossary 20개 → 3주차 SCR 상태 매트릭스 → 4주차 ID 체계 → 5주차 셀프 검토 프롬프트 습관화.
새로 '많이' 쓰는 게 아니라 '다르게' 쓰는 일이다.

## 6. 작업 흐름 (각 기능마다 Phase 1→5 반복)
1. 기획 문서 작성 (PRD/REQ/POL/SCR/TC)
2. 셀프 검토 (methodology/README.md 의 프롬프트 그대로 복사)
3. 한 줄 핸드오프 ("REQ-### 을 SCR-### 에 구현. POL-### 지키고 TC-### 통과.")
4. AI 구현 + 1초 검증 (`commands.md`) + 사람 실기기 확인
5. DEVLOG/HISTORY 기록

검증을 1초로 만들면 AI에게 더 많이 안심하고 맡길 수 있다.
