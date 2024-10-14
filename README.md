README.md

# File Organization Script for Downloads Folder

This PowerShell script automates the organization of files in the user's Downloads folder by moving them into specific subfolders based on file extensions. It also automatically reruns itself if any new unrecognized files are detected.

# Features
1. Directory Creation: 
    Automatically creates specific folders within the Downloads directory for different file types:

    ```bash
    Documents
    Images
    Spreadsheets
    Compressed Files
    Executables
    Others
    ```

2. File Moving: Moves files from the Downloads folder to their respective directories based on file extensions.

3. File Type Classification:

    Documents: .pdf, .docx, .doc, .txt, .ofx, .rtf, .odt, .ppt, .pptx, .epub, .mobi, .html, .htm
    Images: .jpg, .jpeg, .png, .webp, .gif, .tiff, .tif, .bmp, .svg, .heic
    Spreadsheets: .xlsx, .xls, .ods, .csv, .tsv, .dbf
    Compressed Files: .zip, .gz, .rar, .7z, .tar, .bz2, .xz
    Executables: .exe, .msi, .bat, .sh, .apk, .dll
    Other Files: Any file that doesn’t belong to the above categories will be moved to the "Others" folder.

4. Automatic Rerun Trigger:

    The script now checks for any unrecognized folders or files in the Downloads directory that don't belong to the pre-defined management folders (Documents, Images, Sheets, Compact, Executable, Others).
    If new, unrecognized files or folders are detected, the script reruns automatically to process them.

# How to Use

    Save the script as a .ps1 file.

    Open PowerShell as Administrator.

    Navigate to the directory where the script is saved.

    Run the script using the following command:
    ```bash
    .\scriptname.ps1
    ```

    The script will create the necessary folders and move the files based on their extensions to the appropriate folders within the Downloads directory.

    Automatic Trigger: If new files or folders are added to the Downloads directory that don’t match the recognized folder names, the script will automatically rerun to ensure they are organized properly.

# Requirements
    PowerShell installed.
    Windows Operating System.

# Customization
    You can customize the script by editing the file extensions associated with each type, or by adding new file categories.

# Example
    If you have PDF files, images, and compressed files in your Downloads folder, after running the script, they will be moved to the following folders:

    Downloads\Documents
    Downloads\Images
    Downloads\Compact
    Files that don’t match any of the specified extensions will be moved to the Downloads\Others folder.

    Automatic Trigger Example
    If after the initial run, a new folder or file (e.g., a folder named "Music") is placed in the Downloads directory, the script will detect this and automatically run again to manage the new content.

# Notes
    The script overwrites files with the same name, if they exist.
    The folders "Documents", "Images", "Sheets", "Compact", "Executable", and "Others" will be automatically created if they don’t already exist.