# travel-log

달력 기반 **가족 일정 관리 PWA**. GitHub Pages 정적 사이트 — 모바일 홈화면에 설치해서 가족의 일정과 여행을 한 곳에서 관리합니다.

## 🌐 라이브 URL

```
https://lsy860224.github.io/travel-log/
```

---

## ✨ 기능

- **월간 달력** — 이전/다음 달 이동, 오늘 강조, 날짜별 일정 dot 표시
- **두 가지 일정 타입**
  - **단일 일정** — 특정 날짜의 메모
  - **여행 일정** — 기간에 걸친 여행 + 숙소·여행지·식사·준비물 체크리스트
- **바텀시트 편집** — 날짜를 탭해서 생성·조회·편집
- **여행 상세 페이지** — 숙소·동선·준비물을 한 화면에
- **PWA** — iPhone "홈 화면에 추가"로 앱처럼 설치, 오프라인 조회
- **localStorage 저장** — 입력한 일정은 기기에 저장 (계정·서버 없음)
- **모바일 우선** — Pretendard, iOS Safari 최적화

---

## 🚀 배포 (GitHub Pages)

이미 `lsy860224/travel-log` 레포 + Pages 활성화 상태. 변경 후 push만 하면 자동 재배포됩니다.

```bash
git add .
git commit -m "fix: ..."
git push          # 약 30초~1분 후 라이브 반영
```

처음 설정하는 경우: **Settings → Pages → Source** `Deploy from a branch`, **Branch** `main` / `/(root)`.

---

## 🧱 구조

```
travel-log/
├─ index.html      # 앱 전체 (달력·시트·상세 + 인라인 CSS/JS)
├─ manifest.json   # PWA 매니페스트
├─ sw.js           # 서비스 워커 (오프라인 캐싱)
├─ assets/         # 로고·파비콘·OG 이미지
├─ BRAND.md        # 디자인 시스템 (색·로고·타이포)
└─ FEATURE_MAP.md  # 기능 로드맵
```

빌드 도구·node_modules 없음. 외부 의존성은 Pretendard 폰트(CDN) 하나.

> 로컬 미리보기: `npx serve .` 후 브라우저로 접속 (또는 `.claude/launch.json` 사용).

---

## 🎨 디자인 토큰

색·로고·타이포는 **`BRAND.md` 가 단일 출처**. 톤을 바꾸려면 `index.html` 의 `:root` CSS 변수만 수정하면 전체에 반영됩니다.

| 변수 | 용도 | 값 |
|---|---|---|
| `--stamp` | 메인 브랜드·강조 | `#b84a32` |
| `--ink` | 본문·헤딩 | `#2b2018` |
| `--sea` | 보조 강조 (링크·여행) | `#4d7d8e` |
| `--paper` | 배경 | `#f7efe0` |
| `--sand` | 카드 배경 | `#ede1c8` |
