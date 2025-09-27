#!/usr/bin/env bash
# Usage: ./create_and_push_every_commit.sh <git-remote-url>
# This script will push after every single commit (creates 31 pushes).
set -e

REMOTE_URL="$1"
if [ -z "$REMOTE_URL" ]; then
  echo "Usage: $0 <git-remote-url>"
  exit 1
fi

if [ ! -d ".git" ]; then
  git init
  git add .
  git commit -m "Initial commit"
fi

# Add remote
git branch -M main
git remote remove origin 2>/dev/null || true
git remote add origin "$REMOTE_URL"

for i in $(seq -w 1 31); do
  echo "Part commit $i - $(date --utc +"%Y-%m-%dT%H:%M:%SZ")" >> commits_log.txt
  git add commits_log.txt
  git commit -m "part-$i"
  # push each commit (may be slower and create many push events)
  git push origin main
  sleep 1
done

echo "Done: created 31 commits and pushed them individually to $REMOTE_URL"
```