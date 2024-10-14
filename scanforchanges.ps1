$downloadsPath = [System.IO.Path]::Combine([Environment]::GetFolderPath("UserProfile"), "Downloads")
$ManagementFolders = @("Documents", "Images", "Sheets", "Compact", "Executable", "Others")
$Files = @(dir $downloadsPath)

$new = $Files | Where-Object {$ManagementFolders -notcontains $_.Name}

if($new){
    ./main.ps1
}