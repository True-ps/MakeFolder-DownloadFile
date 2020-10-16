
$path = $args[0]
$source = $args[1]

function Download {
   Import-module BitsTransfer
   Start-BitsTransfer  $source $path
}
if ($source -eq $null -and $path -eq $null)
{ write-host "You haven't given me anything to do. Why don't you try again?!" }

else {
      if ((Test-Path $path) -eq $false) {
      New-Item -ItemType "directory" $path; Write-Output "$($path) directory has been created!"
         if ($source -ne $null) {
          try { Download; Write-Output "$($source) was downloaded in $($path)" }
            catch { "Download Failed! Try a static location. E.G.: `"https://i.imgur.com/jzPHehH.jpeg" }
      }
   }
   else {
      Write-Output "$path already exists." 
      if ($source -ne $null) {
         try { Download; Write-Output "$($source) was downloaded $($path)" }
         catch { "Download Failed! Try a static location. E.G.: `"https://i.imgur.com/jzPHehH.jpeg" }
      }
}

}
   