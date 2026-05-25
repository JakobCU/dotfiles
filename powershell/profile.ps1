oh-my-posh init pwsh --config "$HOME\.posh\jakob.omp.json" | Invoke-Expression
Import-Module Terminal-Icons

# Machine-specific settings (start directory, etc.) live in profile.local.ps1,
# a sibling of this file that is gitignored so it can differ per machine.
$target = (Get-Item $PROFILE).ResolveLinkTarget($true)
$profileDir = if ($target) { Split-Path $target.FullName } else { Split-Path $PROFILE }
$localProfile = Join-Path $profileDir 'profile.local.ps1'
if (Test-Path $localProfile) { . $localProfile }