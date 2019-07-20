#Does a loop in each Dockerfile folder and build each image
Get-ChildItem -Recurse -Directory Dockerfile | ForEach-Object {
  Write-Output "--- BUILDING $($_.Name)"
  #Build image
  $cmd="docker build -t jairbj/rails-dev:$($_.Name) Dockerfile/$($_.Name)"
  Write-Output $cmd
  Invoke-Expression $cmd
}
