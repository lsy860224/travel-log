# travel-log

**Project type**: GitHub Pages 정적 PWA (Vanilla HTML/CSS/JS, 빌드 불필요)
**Owner**: lsy860224 (바비파)
**Live URL**: https://lsy860224.github.io/travel-log/

---

## 📌 프로젝트 정체

**달력 기반 가족 일정 관리 PWA.** 모바일 홈화면에 설치해서 가족의 일정과 여행을 한 곳에서 관리하는 용도.

- **빌드 도구 없음** — `index.html` 하나에 HTML/CSS/JS 인라인
- **외부 의존성 1개** — Pretendard 폰트 (CDN)
- **데이터 저장** — `localStorage` 단일 키 `travel-log:v2` (모든 일정 데이터)
- **PWA** — `manifest.json` + `sw.js`로 홈화면 설치·오프라인 동작

> 이전엔 동해·삼척 단일 여행을 하드코딩한 정적 페이지였으나, 범용 달력 앱으로 전면 재구성됨 (커밋 `d91b2f1`).

---

## 🧩 앱 구조 (`index.html` 단일 파일)

### 화면(View)
- **달력 뷰** (`#v-cal`) — 월간 그리드, 이전/다음 달, 오늘 강조, 일정 dot, FAB 추가 버튼
- **상세 뷰** (`#v-detail`) — 여행 일정의 전체 상세 (슬라이드인)
- **바텀시트** (`#sheet`) — 생성/조회/편집 공용. `sheetMode` 로 `create`·`view`·`edit` 전환

### 일정(Event) 데이터 모델
`localStorage['travel-log:v2']` = `{ [id]: Event }`

| 필드 | 단일 일정 (`single`) | 여행 일정 (`travel`) |
|---|---|---|
| `type` | `'single'` | `'travel'` |
| `category` | 카테고리 id (가족·여행·약속·기념일·건강·기타) | 동일 |
| `startDate` / `endDate` | 같은 날 | 기간 |
| `content` | 메모 텍스트 | — |
| `title` | — | 여행 이름 |
| `accommodation` / `destinations` / `meals` | — | 문자열 배열 |
| `packing` | — | `{id,label,checked}[]` 체크리스트 |

- **단일 일정** — 달력에 제목 박스(카테고리 색), 메모 한 덩어리
- **여행 일정** — 달력에 기간만큼 이어지는 제목 박스(카테고리 색), 숙소·여행지·식사·준비물 관리
- **달력 표시** — 음영 없이 모든 일정을 카테고리 색 + 제목 **얇은 박스**로 레인에 쌓음(셀당 3개, 초과 `+N개`). 같은 일정은 전 기간 동일 레인, 주 경계에서 라벨 반복. 정의: `index.html` 의 `assignLanes`/`evLabel`/`.cal-ev`.
- **카테고리** — 기본 6종(가족·여행·약속·기념일·건강·기타) **+ 사용자가 직접 추가·수정·삭제** 가능. 진입: 상단바 태그 버튼 → 관리 시트(전체 CRUD), 또는 생성/편집 피커의 "+ 직접 추가". 색은 스와치 + 직접 색상(native color). 저장 `localStorage['travel-log:cats']`, 기본값 `index.html` `DEFAULT_CATS`. 미지정/삭제된 카테고리 일정은 타입별 기본색 폴백.

---

## 🎨 디자인 시스템

**`BRAND.md` 가 색·로고·타이포·보이스의 단일 출처(SSOT).** `index.html` 의 `:root` 변수는 BRAND.md 토큰과 일치해야 함.

핵심 토큰 (전체는 `BRAND.md` §3):

| 변수 | 용도 | 값 |
|---|---|---|
| `--stamp` | 메인 브랜드 (로고·강조·CTA) | `#b84a32` |
| `--ink` | 본문·헤딩 | `#2b2018` |
| `--sea` | 보조 강조 (링크·여행 dot) | `#4d7d8e` |
| `--paper` | 메인 배경 | `#f7efe0` |
| `--sand` | 카드·hover 배경 | `#ede1c8` |
| `--line` | divider·border | `#d9c9a8` |
| `--serif` | 헤딩 세리프 | Iowan Old Style 계열 |

본문 폰트는 Pretendard Variable. 한글 가독성 최우선. **새 컬러 추가 금지 — BRAND.md 토큰만 사용.**

---

## 📁 파일 구조

```
travel-log/
├─ index.html       # 앱 전체 (달력·시트·상세 + 인라인 CSS/JS)
├─ manifest.json    # PWA 매니페스트
├─ sw.js            # 서비스 워커 (precache + stale-while-revalidate)
├─ assets/          # 로고·파비콘·apple-touch-icon·og-image
├─ BRAND.md         # 디자인 시스템 SSOT
├─ FEATURE_MAP.md   # 기능 연관도·로드맵 (작성중)
├─ README.md        # 레포 설명 + 배포 가이드
├─ CLAUDE.md        # 이 파일
├─ .gitattributes   # LF 줄바꿈 정규화
└─ .gitignore
```

---

## 🔧 코드 컨벤션

- **HTML**: 시맨틱 태그. 뷰는 `.view`, 시트는 `.sheet` 클래스 토글로 전환
- **CSS**: 단일 `<style>` 블록, `:root` CSS 변수로 토큰 통제, BEM 안 씀
- **JS**: IIFE로 감싸 전역 오염 방지. 사용자 입력은 `esc()` 로 이스케이프
- **localStorage 키**: 일정 `travel-log:v2`, 카테고리 `travel-log:cats`. 스키마 변경 시 bump + 마이그레이션
- **줄바꿈**: LF 고정 (`.gitattributes`). 에디터가 CRLF로 저장하지 않도록 주의

---

## ⚠️ 주의사항

- 🚫 **빌드 시스템 도입 금지** — Next.js, Astro 등 over-engineering 금지. 단일 파일 유지.
- 🚫 **node_modules 만들지 않기** — 순수 정적 파일로 GitHub Pages 직배포가 목적.
- ✅ **Pretendard CDN 유지** — npm 패키지로 받지 말 것.
- ✅ **모바일 우선** — 모든 변경은 iPhone Safari에서 먼저 테스트.
- ✅ **디자인은 BRAND.md 준수** — 토큰·로고 자산 재사용, 새 색 추가 금지.
- ✅ **SW 캐시 버전** — `index.html` 등 배포 자산을 바꾸면 `sw.js` 의 `CACHE` 버전을 bump (안 하면 사용자에게 갱신 지연).

---

## 🚀 작업 완료 후 워크플로

**작업이 끝나면 사용자에게 묻지 말고 바로 커밋 & 푸시한다.** GitHub Pages 자동 재배포까지가 한 작업의 완료 단위.

- 작은 기능 추가/버그 수정/콘텐츠 변경 모두 동일하게 적용
- 단, 다음 경우는 푸시 전에 사용자 확인을 받는다:
  - 파괴적 작업 (force push, 파일 대량 삭제, 히스토리 수정 등)
  - 여러 작업이 한 세션에 섞여 있어 커밋 단위가 불분명할 때
  - 사용자가 명시적으로 "푸시는 나중에" 또는 "커밋만"이라고 한 경우
