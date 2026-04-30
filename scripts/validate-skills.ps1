$ErrorActionPreference = "Stop"

$repo = Split-Path -Parent $PSScriptRoot
$skillsDir = Join-Path $repo "skills"
$errors = New-Object System.Collections.Generic.List[string]

if (-not (Test-Path $skillsDir)) {
  $errors.Add("Missing skills directory: $skillsDir")
}

Get-ChildItem $skillsDir -Directory | ForEach-Object {
  $skillDir = $_.FullName
  $skillName = $_.Name
  $skillFile = Join-Path $skillDir "SKILL.md"
  $agentFile = Join-Path $skillDir "agents/openai.yaml"

  if (-not (Test-Path $skillFile)) {
    $errors.Add("$skillName is missing SKILL.md")
    return
  }

  $content = Get-Content $skillFile -Raw
  if ($content -notmatch "(?s)^---\s*.*?name:\s*$skillName\s*.*?description:\s*.+?---") {
    $errors.Add("$skillName has invalid or incomplete frontmatter")
  }

  if (-not (Test-Path $agentFile)) {
    $errors.Add("$skillName is missing agents/openai.yaml")
  }

  $referenceMatches = [regex]::Matches($content, '`(references/[^`]+)`')
  foreach ($match in $referenceMatches) {
    $relativeReference = $match.Groups[1].Value -replace '/', [IO.Path]::DirectorySeparatorChar
    $referencePath = Join-Path $skillDir $relativeReference

    if (-not (Test-Path $referencePath)) {
      $errors.Add("$skillName references missing file: $($match.Groups[1].Value)")
    }
  }
}

if ($errors.Count -gt 0) {
  $errors | ForEach-Object { Write-Error $_ }
  exit 1
}

Write-Host "Skill validation passed."
