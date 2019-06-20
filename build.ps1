#Does a loop in each Dockerfile folder and build/push each image
Get-ChildItem -Recurse -Directory Dockerfile | ForEach-Object {
  echo "--- BUILDING $($_.Name)"
  #Build image
  $cmd="docker build -t jairbj/rails-dev:$($_.Name) Dockerfile/$($_.Name)"
  echo $cmd
  Invoke-Expression $cmd

  #Push image
  $cmd="docker push jairbj/rails-dev:$($_.Name)"
  echo $cmd
  Invoke-Expression $cmd
}
