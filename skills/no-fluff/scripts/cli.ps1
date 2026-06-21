param (
    [Parameter(ValueFromPipeline=$true)]
    [string]$InputText
)

if (-not $InputText) {
    $InputText = $args -join " "
}

if (-not $InputText) {
    Write-Output "CLI: 0.00"
    exit
}

$words = ($InputText.Split(" `t`n`r", [System.StringSplitOptions]::RemoveEmptyEntries)).Length
$letters = ($InputText -replace '[^a-zA-Z0-9]', '').Length
$sentences = ($InputText.Split(".!?", [System.StringSplitOptions]::RemoveEmptyEntries)).Length

if ($sentences -eq 0) { $sentences = 1 }

if ($words -gt 0) {
    $L = ($letters / $words) * 100
    $S = ($sentences / $words) * 100
    $cli = 0.0588 * $L - 0.296 * $S - 15.8
    $cliStr = "{0:N2}" -f $cli
    Write-Output "CLI: $cliStr (W: $words, L: $letters, S: $sentences)"
} else {
    Write-Output "CLI: 0.00"
}
