#!/usr/bin/env bash
# 把一个技能目录打成可上传的 zip 包，输出到 dist/（dist/ 不提交）。
# 用法：tools/package-skill.sh mining-news/liex-news-push
# 设计记录 LOCALIZATION.md 不打进包。
set -euo pipefail
skill_dir="${1:?用法：tools/package-skill.sh <技能目录>}"
repo_root="$(cd "$(dirname "$0")/.." && pwd)"
name="$(basename "$skill_dir")"
out="$repo_root/dist/$name.zip"
mkdir -p "$repo_root/dist"
rm -f "$out"
cd "$repo_root/$(dirname "$skill_dir")"
zip -qr -X "$out" "$name" -x "$name/LOCALIZATION.md" "*/.DS_Store"
echo "$out"
unzip -l "$out"
