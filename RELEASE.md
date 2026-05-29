# RELEASE — (TODO 앱 이름) v(TODO 버전)

> 출시 운영용 사람-읽기 노트. 기능·정책은 `docs/` 의 단일 진실 참조 (ID 만 적고 중복 금지).

## 한 줄
(TODO 앱 한 줄 요약 — PRD 와 일치)

## 출시 범위
- **In scope**: (TODO REQ-### 묶음) → `docs/requirements/REQ.md`
- **Out of scope · 다음 버전 후보(Backlog) · 핵심 차별점**: → `docs/product/PRD.md`

## 빌드 메타데이터 ((TODO 빌드 시스템 파일) 가 단일 진실)
| 키 | 값 |
| --- | --- |
| Display Name | (TODO) |
| Bundle ID / Package | (TODO) |
| Marketing Version | (TODO) |
| Build Number | (TODO) |
| OS Minimum | (TODO) |
| Device | (TODO) |

## 출시 전 사람-결정 체크리스트 (`rules/ui.md` 의 사람 영역)
- [ ] 앱 아이콘 (1024×1024 + 사이즈 세트)
- [ ] 스토어 스크린샷 (기기·디스플레이별)
- [ ] 스토어 메타데이터: 이름·부제·설명·키워드·카테고리
- [ ] 개인정보 처리방침 호스팅 — `PRIVACY.md` 검토·문의 이메일 확정 후 공개 URL 확보
- [ ] 연령 등급 설정
- [ ] 심사 노트
- [ ] 빌드 업로드 (App Store Connect / Play Console)
- [ ] 베타 테스트 (TestFlight / Internal Testing) 통과 후 심사 제출

## 출시 전 AI-검증 체크리스트 (`rules/ui.md` 의 AI 영역)
- [ ] (TODO) 1초 검증 명령 그린 — `rules/commands.md` 의 swift test / npm test / pytest 등
- [ ] (TODO) 빌드 가드 그린 — Release configuration 또는 prod build
- [ ] `bash scripts/check-docs.sh` ALL GREEN
- [ ] (TODO) 외부 통신·보안 가드 통과 (TC-103 류)
- [ ] PRD 마감 체크리스트 통과 (`rules/methodology/README.md` 의 마감 체크리스트)
- [ ] 사람 실기기/실환경 확인 통과
- [ ] `rules/ux.md` 디자인 원칙 8개 자체 검증·발견 처리 완료
