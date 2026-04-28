# travel-log

**Project type**: GitHub Pages 정적 사이트 (Vanilla HTML/CSS/JS, 빌드 불필요)
**Owner**: lsy860224 (바비파)
**Live URL**: https://lsy860224.github.io/travel-log/

---

## 📌 프로젝트 정체

가족 여행 일정을 정적 HTML 페이지로 정리하는 저장소. 모바일에서 여행 중에 보기 위한 용도.

- **빌드 도구 없음** — `index.html` 하나로 동작
- **외부 의존성 1개** — Pretendard 폰트 (CDN)
- **데이터 저장**: `localStorage` (체크리스트 상태 유지)

---

## 🎯 Claude Code에서 처리할 작업

### Phase 1. 초기 셋업 (지금)

1. `git init` 후 main 브랜치 초기화
2. GitHub에 `lsy860224/travel-log` 레포 생성 (Public)
3. 첫 푸시
4. GitHub Pages 활성화 (Settings → Pages → main / root)
5. 라이브 URL 동작 확인

### Phase 2. 운영 (여행 후 또는 다음 여행 추가 시)

여행이 2개 이상 쌓이면 폴더 구조 리팩터링:

```
travel-log/
├─ index.html              ← 여행 목록 인덱스 (새로 작성 필요)
├─ trips/
│  ├─ 2026-05-donghae/
│  │  └─ index.html        ← 현재 index.html을 여기로 이동
│  └─ {다음 여행}/
└─ CLAUDE.md
```

이때 루트 `index.html`은 카드 형태로 여행 목록을 나열하는 인덱스 페이지로 새로 만들어야 함.

---

## 📁 파일 구조 (현재)

```
travel-log/
├─ index.html       # 메인 페이지 — 동해·삼척 가족여행 2026.05
├─ README.md        # 레포 설명 + 배포 가이드
├─ CLAUDE.md        # 이 파일
└─ .gitignore       # macOS .DS_Store 등
```

---

## 🎨 디자인 시스템

`index.html`의 `:root` CSS 변수로 통제:

| 변수 | 용도 | 값 |
|---|---|---|
| `--ocean-deep` | 메인 강조색 | `#0a4d5e` |
| `--ocean` | 보조 강조색 | `#1a7a8e` |
| `--coral` | 포인트 색 | `#e87a5d` |
| `--paper` | 배경 | `#fcf8ee` |
| `--sand` | 카드 배경 | `#faf3e3` |
| `--serif` | 헤딩용 세리프 폰트 | Iowan Old Style 계열 |

본문 폰트는 Pretendard Variable. 한글 가독성 최우선.

---

## 🔧 코드 컨벤션

- **HTML**: 시맨틱 태그 (`<section>`, `<header>`, `<nav>`, `<main>`)
- **CSS**: 단일 `<style>` 블록, BEM 안 씀 (작은 사이트라 불필요)
- **JS**: IIFE로 감싸서 전역 오염 방지
- **localStorage 키**: `travel-log:{trip-slug}` 형식 (예: `travel-log:donghae-2026-05`)

여행을 추가할 때마다 storage key의 trip-slug를 바꿔야 체크리스트가 섞이지 않음.

---

## ⚠️ 주의사항

- 🚫 **빌드 시스템 도입 금지** — Next.js, Astro 등으로 over-engineering 하지 말 것. 현재 구조 유지.
- 🚫 **node_modules 만들지 않기** — 순수 정적 파일로 GitHub Pages 직배포가 목적.
- ✅ **Pretendard CDN은 유지** — npm 패키지로 받지 말 것.
- ✅ **모바일 우선** — 모든 변경은 iPhone Safari에서 먼저 테스트.

---

## 📝 다음 여행 추가 SOP

1. 새 폴더 `trips/{YYYY-MM-region}/` 생성
2. 현재 `index.html`을 복사 후 일정 내용만 교체
3. localStorage 키를 새 trip-slug로 변경
4. 루트 `index.html`(여행 목록 인덱스)에 카드 추가
5. 푸시 → GitHub Pages 자동 재배포 (1분 내)
