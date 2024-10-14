function FindFolder {
    param (
        $path,
        $name
    )
    
    if(!($path)){
        $folder_path = $downloadsPath + $name
        mkdir $folder_path
        Write-Host $folder_path "Directory created..."
    }
}
function MoveFiles {
    param (
        $type,
        $dir
    )
    $destination = $downloadsPath + $dir
    
    for($i = 0; $i -lt $type.Length; $i++){
        $section = $Files | Where-Object {$_.Extension -eq $type[$i]}
        $section.Name

        $section | ForEach-Object { Move-Item -Path ($downloadsPath+'\'+$_.Name) -Destination $destination -Force}
    }
}
$downloadsPath = [System.IO.Path]::Combine([Environment]::GetFolderPath("UserProfile"), "Downloads")

$Files = @(dir $downloadsPath)

FindFolder -path ($Files | Where-Object {$_.Name -eq "Documents"}) -name '\Documents'
FindFolder -path ($Files | Where-Object {$_.Name -eq "Images"}) -name '\Images'
FindFolder -path ($Files | Where-Object {$_.Name -eq "Sheets"}) -name '\Sheets'
FindFolder -path ($Files | Where-Object {$_.Name -eq "Compact"}) -name '\Compact'
FindFolder -path ($Files | Where-Object {$_.Name -eq "Executable"}) -name '\Executable'
FindFolder -path ($Files | Where-Object {$_.Name -eq "Others"}) -name '\Others'

$documents_ = @(".pdf", ".docx", ".doc" ,".txt", ".ofx", ".rtf", ".odt", ".ppt", ".pptx", ".epub", ".mobi", ".html",".htm")
$images_ =@(".jpg",".jpeg",".png",".webp",".gif",".tiff",".tif",".bmp",".svg",".heic")
$sheets_ = @(".xlsx",".xls",".ods",".csv",".tsv",".dbf")
$compacted_ = @(".zip",".gz",".rar",".7z",".tar",".bz2",".xz")
$executable_ = @(".exe",".msi",".bat",".sh",".apk",".dll")

MoveFiles -type $documents_ -dir "\Documents"
MoveFiles -type $images_ -dir "\Images"
MoveFiles -type $sheets_ -dir "\Sheets"
MoveFiles -type $compacted_ -dir "\Compact"
MoveFiles -type $executable_ -dir "\Executable"

$ManagementFolders = @("Documents", "Images", "Sheets", "Compact", "Executable", "Others")
$Files = @(dir $downloadsPath)

$other_files = $Files | Where-Object {$ManagementFolders -notcontains $_.Name}

$other_files | ForEach-Object { Move-Item -Path ($downloadsPath+'\'+$_.Name) -Destination ($downloadsPath + '\Others') -Force}