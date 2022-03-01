$DistroName = "fedora35"
$ThisScript = $MyInvocation.MyCommand.Path
$RepoRootPath = Split-Path $ThisScript -Parent

Set-Location -Path "${RepoRootPath}" -PassThru

Invoke-Expression -Command "crc console --credentials" | Out-File -FilePath "${RepoRootPath}\build\${DistroName}\root\home\wslu\crc-credentials.txt"

Write-Host " --- deleting old docker container -----"
Invoke-Expression -Command "docker rm -f ${DistroName}"

Write-Host " --- deleting old image -----"
Invoke-Expression -Command "docker rmi -f local/${DistroName}:latest"

Write-Host " --- pulling new fedora base image -----"
Invoke-Expression -Command "docker pull fedora:35"

Write-Host " --- building new docker image -----"
Invoke-Expression -Command "docker build build\${DistroName} -t local/${DistroName}:latest --progress=plain"

Write-Host " --- running container once -----"
Invoke-Expression -Command "docker run --name ${DistroName} local/${DistroName}:latest"

Write-Host " --- removing old container export -----"
Remove-Item -path "${RepoRootPath}\exports\${DistroName}.tar" -recurse
Write-Host " --- creating new container export -----"
Invoke-Expression -Command "docker export -o exports\${DistroName}.tar ${DistroName}"

Write-Host " --- wsl status before delete -----"
Invoke-Expression -Command "wsl -l"

Write-Host " --- removing old wsl distro -----"
Invoke-Expression -Command "wsl --terminate ${DistroName}"
Invoke-Expression -Command "wsl --unregister ${DistroName}"
Remove-Item -path "${RepoRootPath}\wslhome\${DistroName}" -recurse

Write-Host " --- wsl status after delete -----"
Invoke-Expression -Command "wsl -l"

Write-Host " --- importing new wsl distro from export -----"
Invoke-Expression -Command "wsl --import ${DistroName} ${RepoRootPath}\wslhome\${DistroName} ${RepoRootPath}\exports\${DistroName}.tar --version 2"


Write-Host " --- wsl status after create -----"
Invoke-Expression -Command "wsl -l"

