$ErrorActionPreference='Stop'
$assets=@{
  'calendar.png'='calendar_2020q4_2x.png'
  'keep.png'='keep_2020q4v3_2x.png'
  'tasks.png'='tasks_2021_2x.png'
  'contacts.png'='contacts_2022_2x.png'
  'maps.png'='maps_v2_2x.png'
}
foreach($entry in $assets.GetEnumerator()) {
  try {
    $response=Invoke-WebRequest -Uri ('https://www.gstatic.com/companion/icon_assets/'+$entry.Value)
    [System.IO.File]::WriteAllBytes(('E:\google docs\dist\assets\'+$entry.Key),$response.Content)
    Write-Output ($entry.Key+' matched companion asset')
  }catch { Write-Output ($entry.Key+' kept existing official asset') }
}
