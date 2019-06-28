#Does a loop in each Dockerfile folder and build each image
Write-Output "--- BUILDING $($_.Name)"
Get-ChildItem -Recurse -Directory Dockerfile | ForEach-Object {
  #Build image
  $cmd="docker build -t jairbj/rails-dev:$($_.Name) Dockerfile/$($_.Name)"
  Write-Output $cmd
  Invoke-Expression $cmd
}
