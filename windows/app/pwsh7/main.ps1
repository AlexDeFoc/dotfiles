# Rm moves files/folders into trash folder
function RemoveItemsToTrash {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string]$Path
    )

    $TrashFolder = "C:\orbit\trash"
    if (-not (Test-Path $TrashFolder)) {
        New-Item -Path $TrashFolder -ItemType Directory -Force | Out-Null
    }

    try {
        $NormalizedPath = $Path.TrimEnd('\')
        $BaseName = [System.IO.Path]::GetFileNameWithoutExtension($NormalizedPath)
        $Extension = [System.IO.Path]::GetExtension($NormalizedPath)
        
        # Generate a hash-based suffix
        $Hash = (Get-Random -Minimum 100000 -Maximum 999999).ToString()
        
        if (Test-Path $Path -PathType Container) {
            # If it's a folder, append the hash at the end
            $NewName = "${BaseName}_$Hash"
        } else {
            # If it's a file, insert the hash before the extension
            $NewName = "${BaseName}_$Hash$Extension"
        }

        $Destination = Join-Path -Path $TrashFolder -ChildPath $NewName

        # Ensure uniqueness
        while (Test-Path $Destination) {
            $Hash = (Get-Random -Minimum 100000 -Maximum 999999).ToString()
            if (Test-Path $Path -PathType Container) {
                $NewName = "${BaseName}_$Hash"
            } else {
                $NewName = "${BaseName}_$Hash$Extension"
            }
            $Destination = Join-Path -Path $TrashFolder -ChildPath $NewName
        }

        Move-Item -Path $Path -Destination $Destination -Force
        Write-Verbose "'$Path' moved to '$Destination'"
    }
    catch {
        Write-Error "Error moving '$Path' to trash! $_"
    }
}

Set-Alias -Name rm -Value RemoveItemsToTrash -Force

# touch creates file
function TouchCreateFile {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0, ValueFromRemainingArguments = $true)]
        [string[]]$fileNames
    )

    foreach ($file in $fileNames) {
        try {
            New-Item -Path . -Name $file -ItemType 'file' -Force | Out-Null
        }
        catch {
            Write-Error "Error creating file: $file - $_"
        }
    }
}

Set-Alias -Name touch -Value TouchCreateFile -Force
