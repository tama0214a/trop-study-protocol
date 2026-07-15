#!/usr/bin/env bash
set -euo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source_file="$here/Protocol/研究計画書.md"
output_file="$here/Protocol/研究計画書.html"
style_file="$here/Protocol/protocol-style.html"

command -v pandoc >/dev/null || {
  echo "ERROR: pandoc が必要です" >&2
  exit 1
}

pandoc "$source_file" \
  --from=gfm \
  --to=html5 \
  --standalone \
  --embed-resources \
  --toc \
  --toc-depth=3 \
  --metadata="lang:ja" \
  --metadata="title:研究計画書 | 日本の救急外来における心筋トロポニン採取実態" \
  --include-in-header="$style_file" \
  --output="$output_file"

echo "生成しました: $output_file"
