
function Test-FileHasKeyword {
    param(
        [string]$path
    )

    begin {}
    process {
        $lines = Get-Content -Path $path | Select-String 'Keyword'
        if ($lines) {
            Write-Output $true
        }
        else {
            Write-Output $false
        }
    }
    end {}
}
function Move-ContentFile {
    param(
        [parameter(ValueFromPipeline = $true)]
        [string]$path
    )
    
    begin {}
    process {
        if (Test-FileHasKeyword -path $path) {
            Copy-Item -Path $path -Destination 'c:\windows\temp'
        }
    }
    end {}

}