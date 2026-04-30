$ErrorActionPreference = "Stop"

$repo = Split-Path -Parent $MyInvocation.MyCommand.Path
$skillsHome = if ($env:CODEX_HOME) {
  Join-Path $env:CODEX_HOME "skills"
} else {
  Join-Path $env:USERPROFILE ".codex\skills"
}

$skills = @(
  "setup-shapeup",
  "shaping",
  "building"
)

New-Item -ItemType Directory -Force -Path $skillsHome | Out-Null

foreach ($skill in $skills) {
  $source = Join-Path $repo "skills\$skill"
  $target = Join-Path $skillsHome $skill

  if (-not (Test-Path $source)) {
    throw "Missing skill directory: $source"
  }

  Copy-Item -Recurse -Force $source $target
  Write-Host "Installed $skill -> $target"
}

Write-Host "Shape Up Codex skills installed."
