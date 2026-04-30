[CmdletBinding(SupportsShouldProcess = $true)]
param(
  [ValidateSet("setup-shapeup", "shaping", "building")]
  [string[]]$Skill = @("setup-shapeup", "shaping", "building"),

  [string]$Target
)

$ErrorActionPreference = "Stop"

$repo = Split-Path -Parent $MyInvocation.MyCommand.Path
$skillsHome = if ($Target) {
  $Target
} elseif ($env:CODEX_HOME) {
  Join-Path $env:CODEX_HOME "skills"
} else {
  Join-Path $env:USERPROFILE ".codex\skills"
}

if ($PSCmdlet.ShouldProcess($skillsHome, "Create skills directory")) {
  New-Item -ItemType Directory -Force -Path $skillsHome | Out-Null
}

foreach ($skillName in $Skill) {
  $source = Join-Path $repo "skills\$skillName"
  $installPath = Join-Path $skillsHome $skillName

  if (-not (Test-Path $source)) {
    throw "Missing skill directory: $source"
  }

  if ($PSCmdlet.ShouldProcess($installPath, "Install $skillName")) {
    New-Item -ItemType Directory -Force -Path $installPath | Out-Null
    Copy-Item -Recurse -Force (Join-Path $source "*") $installPath
    Write-Host "Installed $skillName -> $installPath"
  }
}

if ($WhatIfPreference) {
  Write-Host "Shape Up Codex skills install preview complete."
} else {
  Write-Host "Shape Up Codex skills installed."
}
