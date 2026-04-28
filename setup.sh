#!/usr/bin/env bash
# travel-log 초기 셋업 + GitHub Pages 배포
# 실행: bash setup.sh

set -e

echo "🌊 travel-log 셋업 시작..."

# 1. Git 초기화
if [ ! -d .git ]; then
  git init
  git branch -M main
  echo "✅ Git 초기화 완료"
else
  echo "⏭  Git 이미 초기화됨"
fi

# 2. 첫 커밋
git add .
if git diff --cached --quiet; then
  echo "⏭  커밋할 변경사항 없음"
else
  git commit -m "feat: 동해·삼척 가족여행 2026.05 일정 추가"
  echo "✅ 첫 커밋 완료"
fi

# 3. GitHub 레포 생성 + 푸시 (gh CLI 필요)
if command -v gh &> /dev/null; then
  if ! gh repo view lsy860224/travel-log &> /dev/null; then
    gh repo create lsy860224/travel-log \
      --public \
      --source=. \
      --remote=origin \
      --description="가족 여행 일정 정적 사이트" \
      --push
    echo "✅ GitHub 레포 생성 + 푸시 완료"
  else
    echo "⏭  레포 이미 존재. 푸시만 시도..."
    git remote add origin https://github.com/lsy860224/travel-log.git 2>/dev/null || true
    git push -u origin main
  fi

  # 4. GitHub Pages 활성화
  echo "🚀 GitHub Pages 활성화 중..."
  gh api -X POST repos/lsy860224/travel-log/pages \
    -f "source[branch]=main" \
    -f "source[path]=/" \
    2>/dev/null || echo "⏭  Pages 이미 활성화됨"

  echo ""
  echo "🎉 완료!"
  echo "📡 라이브 URL: https://lsy860224.github.io/travel-log/"
  echo "   (1~2분 후 접속 가능)"
else
  echo ""
  echo "⚠️  gh CLI가 설치되어 있지 않습니다."
  echo "   설치: brew install gh && gh auth login"
  echo ""
  echo "또는 수동으로:"
  echo "   1. https://github.com/new 에서 'travel-log' 레포 생성 (Public)"
  echo "   2. git remote add origin https://github.com/lsy860224/travel-log.git"
  echo "   3. git push -u origin main"
  echo "   4. Settings → Pages → Branch: main / root → Save"
fi
