$ErrorActionPreference = "Stop"

$repo = Split-Path -Parent $PSScriptRoot
$skillsDir = Join-Path $repo "skills"
$readmeFile = Join-Path $repo "README.md"
$examplesDir = Join-Path $repo "examples"
$errors = New-Object System.Collections.Generic.List[string]
$warnings = New-Object System.Collections.Generic.List[string]

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
  } else {
    $agentContent = Get-Content $agentFile -Raw
    foreach ($field in @("display_name", "short_description", "default_prompt")) {
      if ($agentContent -notmatch "(?m)^\s*$field\s*:") {
        $errors.Add("$skillName agents/openai.yaml is missing interface.$field")
      }
    }
  }

  $referenceMatches = [regex]::Matches($content, '`(references/[^`]+)`')
  foreach ($match in $referenceMatches) {
    $relativeReference = $match.Groups[1].Value -replace '/', [IO.Path]::DirectorySeparatorChar
    $referencePath = Join-Path $skillDir $relativeReference

    if (-not (Test-Path $referencePath)) {
      $errors.Add("$skillName references missing file: $($match.Groups[1].Value)")
    } else {
      $lineCount = (Get-Content $referencePath).Count
      if ($lineCount -gt 120) {
        $warnings.Add("$skillName reference is long ($lineCount lines): $($match.Groups[1].Value)")
      }
    }
  }

  if (Test-Path $readmeFile) {
    $readmeContent = Get-Content $readmeFile -Raw
    if ($readmeContent -notmatch "###\s+``?$skillName``?") {
      $errors.Add("README.md does not list skill: $skillName")
    }
  }
}

if (Test-Path $examplesDir) {
  Get-ChildItem $examplesDir -Directory | ForEach-Object {
    $packageFile = Join-Path $_.FullName "03-package.md"
    if (Test-Path $packageFile) {
      $packageContent = Get-Content $packageFile -Raw
      foreach ($section in @("Why", "Desired Outcome", "Appetite", "Breadboard", "Not Doing", "Risks")) {
        if ($packageContent -notmatch "(?m)^##\s+$([regex]::Escape($section))\s*$") {
          $errors.Add("$($_.Name)/03-package.md is missing section: $section")
        }
      }
    }
  }
}

if ($errors.Count -gt 0) {
  $errors | ForEach-Object { Write-Error $_ }
  exit 1
}

if ($warnings.Count -gt 0) {
  $warnings | ForEach-Object { Write-Warning $_ }
}

Write-Host "Skill validation passed."
