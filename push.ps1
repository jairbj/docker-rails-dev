#Does a loop in each Dockerfile folder and build each image
Get-ChildItem -Recurse -Directory Dockerfile | ForEach-Object {
  Write-Output "--- PUSHING $($_.Name)"
  
  #Push image
  $cmd="docker push jairbj/rails-dev:$($_.Name)"
  Write-Output $cmd
  Invoke-Expression $cmd
}
