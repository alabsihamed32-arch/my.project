param(
  [Parameter(Mandatory=$true)]
  [string]$RemoteUrl
)

if (-not (Test-Path .git)) {
  git init
  git add .
  git commit -m "Initial commit"
}

for ($i=1; $i -le 31; $i++) {
  $n = $i.ToString("D2")
  Add-Content -Path commits_log.txt -Value "Part commit $n - $(Get-Date -Format o)"
  git add commits_log.txt
  git commit -m "part-$n"
}

git branch -M main
git remote remove origin 2>$null
git remote add origin $RemoteUrl
git push -u origin main -f

Write-Host "Done: created 31 commits and pushed to $RemoteUrl"
```

--- End of project files