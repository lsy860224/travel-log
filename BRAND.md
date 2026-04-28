# travel·log Brand Guidelines

> 가족이 떠난 짧은 여행을 *손으로 눌러 찍은 도장*처럼 남기는 정적 사이트.
> 이 문서는 색·로고·타이포·보이스의 단일 출처(single source of truth).

---

## 1. 무드 / 보이스

- **무드** — 따뜻한 가족 일기 + 빈티지 여권 스탬프. 종이의 결, 잉크의 농담, 손도장의 살짝 기운 각도.
- **연상 단어** — 종이, 잉크, 스탬프, 우표, 항공일지, 등대, 모래, 사진앨범
- **피해야 할 톤** — 차가운 SaaS UI, 형광 그라디언트, 디지털 아이콘 풍

### 보이스
- **1인칭 복수**(우리·오늘은)로 다정하게
- 짧은 문장. 한 줄에 하나의 정보.
- 한글이 메인, 영어는 보조 라벨(`Day One`, `Stay`, `Sightseeing`)
- 손글씨처럼 구체적 — *"차에서 먹기 좋음"*, *"어른 것도!"*

---

## 2. 로고

```
╭──────╮
│TRAVEL│   ← 직사각형 도장 박스
│ LOG  │   ← TRAVEL 위, LOG 이탤릭 아래
╰──────╯   ← -2.5° 기울임 (손도장 느낌)
```

### 파일
| 파일 | 용도 | 사이즈 |
|---|---|---|
| `assets/logo.svg` | 풀 로고 (페이지 헤더, BRAND 페이지) | 가변 |
| `assets/favicon.svg` | T·L 모노그램 도장 | 16~64px |
| `assets/favicon.ico` | 멀티 사이즈 (16/32/48/64) | — |
| `assets/apple-touch-icon.png` | iOS 홈화면 | 180×180 |
| `assets/og-image.png` | 카카오톡·슬랙 미리보기 | 1200×630 |

### 사용 규칙
- 단색만 사용 — `--stamp` (#b84a32)
- 종이 톤(`--paper`, `--paper-deep`) 위에서만 사용
- 최소 가시 높이 **24px** (모바일 topbar). 권장 **40px+**.
- clear space — 박스 외곽선 두께의 **2배** 이상

### 금지
- 회전/뒤틀기 (이미 -2.5° 기울임이 들어 있음)
- 그림자, 그라디언트, 외곽선 추가
- 어두운 배경 위 사용 (반전 버전 별도 제작 시까지)
- 정렬 박스 안에 다른 요소 겹치기

---

## 3. 컬러 토큰

> 종이 70% · 잉크 20% · 스탬프 8% · 바다 2% — 이 비율을 깨지 말 것.

### 코어 팔레트

| 토큰 | hex | 역할 |
|---|---|---|
| `--paper` | `#f7efe0` | 메인 배경 (종이) |
| `--paper-deep` | `#ede1c8` | 카드/섹션 배경 |
| `--sand-deep` | `#e0d2b3` | hover, 강조 배경 |
| `--ink` | `#2b2018` | 본문/헤딩 (따뜻한 잉크 다크) |
| `--ink-soft` | `#5d4f43` | 보조 텍스트 |
| `--ink-mute` | `#9a8d7e` | 라벨, 비활성 |
| `--stamp` | `#b84a32` | **메인 브랜드** — 로고, 강조, 액션 버튼 |
| `--stamp-soft` | `#f3d8cc` | hover 배경, 칩 배경 |
| `--sea-deep` | `#2f5a6b` | 보조 강조 (링크 텍스트) |
| `--sea` | `#4d7d8e` | 보조 강조 |
| `--sea-soft` | `#d6e2e6` | 보조 칩 배경 |
| `--line` | `#d9c9a8` | divider, border |

### 배색 원칙
1. **본문은 항상 `--ink`** — 스탬프 레드를 본문 텍스트 색으로 쓰지 말 것
2. **스탬프 레드는 강조용** — 라벨, 도장, primary CTA, 키 포인트만
3. **세이는 링크 색** — 외부 링크, 보조 칩
4. **테마 컬러** (PWA / Safari) — `--stamp` (#b84a32)

---

## 4. 타이포그래피

### 폰트 스택

```css
--serif: "Iowan Old Style", "Palatino", "Apple Garamond",
         "Hoefler Text", Georgia, "Nanum Myeongjo", serif;
--sans:  "Pretendard Variable", Pretendard, -apple-system,
         BlinkMacSystemFont, system-ui, sans-serif;
```

- **세리프** — 헤딩, 숫자, 로고, 영문 라벨. *클래식 여행기·일기 톤*.
- **Pretendard Variable** — 본문, UI. CDN 1개만 로드 (`cdn.jsdelivr.net/gh/orioncactus/pretendard`).

### 위계

| 역할 | 폰트 | 사이즈 | weight | 기타 |
|---|---|---|---|---|
| h1 (hero) | serif | `clamp(40px, 9vw, 64px)` | 400 | letter-spacing -0.02em, color `--ink` |
| h2 / day number | serif | 56px | 400 | letter-spacing -0.03em |
| 카드 제목 (h3) | sans | 17px | 700 | color `--ink` |
| 본문 | sans | 16px / 1.6 | 400 | color `--ink` |
| eyebrow / 라벨 | sans | 12px | 700 | letter-spacing 0.12em, **UPPERCASE**, color `--stamp` |
| 보조 메타 | sans | 13~14px | 500 | color `--ink-soft` |

### 한글·영문 혼용
- 한글이 메인. 영문은 eyebrow/라벨에 보조로 (`Day One · 첫째날`, `Family Trip · East Sea`).
- 강조 1단어는 세리프 이탤릭 + 스탬프 레드 (`<span class="accent">삼척의</span>`).

---

## 5. 모티프 / 디테일

- **도장 박스** — 라운드 직사각형(반지름 14px, stroke 3.4px). 약간 기울이면 손도장 느낌.
- **포스탈 보더** — OG 이미지 상하단의 얇은 빨간 선 두 줄. 우표·엽서 모티프.
- **점 디바이더** — `· · ·` 세 점 + 양쪽 얇은 선. day 안에서 섹션 구분에 사용 가능.
- **종이 그레인** — feTurbulence 기반 미세 노이즈. 과하게 쓰지 말 것 (opacity ~7%).
- **체크박스** — 잉크 다크 배경 + 흰 체크 (도장 누른 듯).

---

## 6. HTML 통합 예시

```html
<!-- favicon stack -->
<link rel="icon" type="image/svg+xml" href="assets/favicon.svg" />
<link rel="alternate icon" href="assets/favicon.ico" />
<link rel="apple-touch-icon" href="assets/apple-touch-icon.png" />

<!-- OG -->
<meta property="og:image" content="https://lsy860224.github.io/travel-log/assets/og-image.png" />
<meta property="og:image:width" content="1200" />
<meta property="og:image:height" content="630" />
<meta name="twitter:card" content="summary_large_image" />

<!-- theme -->
<meta name="theme-color" content="#b84a32" />

<!-- topbar 로고 -->
<img src="assets/logo.svg" alt="travel·log" height="28" />
```

---

## 7. 새 여행 추가 SOP (브랜드 관점)

여행을 추가할 때 브랜드 무결성 유지를 위해:

1. **로고 자산 재사용** — 절대 수정·재생성하지 말고 `assets/`의 파일을 그대로 링크.
2. **localStorage 키** — `travel-log:{YYYY-MM-region}` 형식 유지.
3. **여행별 OG 이미지** (선택) — 같은 종이 배경 + 같은 스탬프 + 도시 이름 추가. 공통 SVG 템플릿 만들면 좋음.
4. **컬러 일관성** — 새 컬러 추가 금지. 본 가이드의 토큰만 사용.
5. **Eyebrow 텍스트** — `Family Trip · {지역명}` 패턴 유지.

---

## 8. 한 줄 요약

> **종이 위에 빨간 스탬프, 검은 잉크 손글씨.** 그 이상도 그 이하도 만들지 말 것.
