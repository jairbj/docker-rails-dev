#Import versions
. .\rails-dev.versions.ps1

#Load Dockerfile template
$template = Get-Content ".\Dockerfile.template"

#Remove older dockerfiles
Remove-Item -Force -Recurse .\Dockerfile

#Generate each version
foreach ($version in $versions) {    
    Write-Output "Generating Dockerfile for tag $($version['tag'])"

    #Create the tag directory
    $dir = ".\Dockerfile\$($version['tag'])"
    mkdir $dir    
    
    #Render template into a Dockerfile
    $template | ForEach-Object {
        $_  -replace '%%TAG%%', $version['tag'] `
            -replace '%%RAILS_VERSION%%', $version['rails_version'] `
            -replace '%%RUBY_VERSION%%', $version['ruby_version'] `
            -replace '%%UBUNTU_IMAGE%%', $version['ubuntu_image']
    } | Set-Content "$dir\Dockerfile"
}