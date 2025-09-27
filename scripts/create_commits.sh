#!/usr/bin/env bash
# Usage: ./create_commits.sh <git-remote-url>
# Example: ./create_commits.sh git@github.com:USERNAME/REPO.git
set -e

REMOTE_URL="$1"
if [ -z "$REMOTE_URL" ]; then
  echo "Usage: $0 <git-remote-url>"
  exit 1
fi

# Initialize git if not already
if [ ! -d ".git" ]; then
  git init
  git add .
  git commit -m "Initial commit"
fi

# Create 31 incremental commits by appending to commits_log.txt
for i in $(seq -w 1 31); do
  echo "Part commit $i - $(date --utc +"%Y-%m-%dT%H:%M:%SZ")" >> commits_log.txt
  git add commits_log.txt
  git commit -m "part-$i"
done

# Ensure branch name main and push
git branch -M main
git remote remove origin 2>/dev/null || true
git remote add origin "$REMOTE_URL"
# Push all commits in one go
git push -u origin main --force

echo "Done: created 31 commits and pushed to $REMOTE_URL"