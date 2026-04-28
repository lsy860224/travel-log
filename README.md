# travel-log

가족 여행 일정을 GitHub Pages 정적 사이트로 정리한 저장소.

## 🌐 라이브 URL

레포명을 `travel-log`로 만들면 자동으로 아래 주소에서 접속됩니다.

```
https://lsy860224.github.io/travel-log/
```

---

## 🚀 배포 방법 (3분 컷)

### 1. 새 레포 생성

GitHub에서 **새 레포지토리** 만들기 — 이름은 `travel-log`, **Public**으로 설정.
(Private 레포에서도 GitHub Pages는 가능하지만 무료 플랜에서는 Public이 가장 깔끔)

### 2. 파일 푸시

이 폴더(`index.html`, `README.md`)를 그대로 푸시:

```bash
cd path/to/travel-log
git init
git add .
git commit -m "feat: 동해 가족여행 2026.05 일정 추가"
git branch -M main
git remote add origin https://github.com/lsy860224/travel-log.git
git push -u origin main
```

### 3. GitHub Pages 활성화

레포 페이지 → **Settings** → **Pages** →
- **Source**: `Deploy from a branch`
- **Branch**: `main` / `/ (root)` 선택 → Save

1~2분 후 위의 라이브 URL로 접속 가능. ✅

---

## 📁 향후 확장 구조 (여행이 늘어났을 때)

지금은 단일 여행이라 `index.html` 하나로 충분하지만, 여행이 쌓이면 이 구조로 옮기는 걸 권장합니다.

```
travel-log/
├─ index.html              ← 여행 목록 인덱스
├─ trips/
│  ├─ 2026-05-donghae/
│  │  └─ index.html        ← 지금 이 파일
│  ├─ 2026-08-jeju/
│  │  └─ index.html
│  └─ ...
└─ README.md
```

이렇게 하면 각 여행은 다음 URL로 접근:
```
https://lsy860224.github.io/travel-log/trips/2026-05-donghae/
```

루트 `index.html`에는 카드 형태로 여행 목록을 나열. 필요할 때 다시 요청하시면 인덱스 페이지 만들어 드릴 수 있습니다.

---

## 🛠 수정 워크플로우

여행 중에도 모바일 → GitHub 앱 또는 PR 머지로 즉시 반영 가능.

```bash
# 일정 변경 후
git add index.html
git commit -m "fix: 5/2 점심 장소 변경"
git push
```

푸시 후 약 30초 ~ 1분 내 라이브 사이트에 반영됩니다.

---

## ✨ 페이지 기능

- **모바일 우선 디자인** (Pretendard, iOS Safari 최적화)
- **상단 sticky 네비** — 5/1, 5/2, 5/3, 짐 빠르게 점프
- **각 장소 네이버 지도 링크** (한국 여행이라 카카오/네이버가 더 정확)
- **준비물 체크리스트 + localStorage 저장** — 탭하면 저장, 다시 와도 그대로
- **인쇄 친화 스타일** — 차량용 출력본 필요 시 그대로 출력 가능

---

## 🎨 디자인 토큰

수정하고 싶으면 `index.html`의 `:root` CSS 변수만 바꾸면 전체 톤이 바뀝니다.

| 변수 | 용도 | 현재 값 |
|---|---|---|
| `--ocean-deep` | 메인 강조색 | `#0a4d5e` |
| `--coral` | 포인트 색 | `#e87a5d` |
| `--paper` | 배경 | `#fcf8ee` |
| `--sand` | 카드 배경 | `#faf3e3` |
