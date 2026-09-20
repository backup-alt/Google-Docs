$ErrorActionPreference = 'Stop'
$assetDirectory = 'E:\google docs\dist\assets'
New-Item -ItemType Directory -Path $assetDirectory -Force | Out-Null
$symbolNames = 'add,arrow_back,arrow_drop_down,arrow_drop_up,arrow_forward,calendar_month,check,check_box,checklist,chevron_left,chevron_right,close,comment,content_copy,content_cut,content_paste,description,download,edit,format_align_center,format_align_justify,format_align_left,format_align_right,format_bold,format_clear,format_color_text,format_indent_decrease,format_indent_increase,format_italic,format_line_spacing,format_list_bulleted,format_list_numbered,format_paint,format_underlined,history,image,insert_link,lightbulb,lock,mail,map,more_vert,note_add,person,print,redo,search,spellcheck,star,table_chart,tab,undo,video_call,view_sidebar,view_quilt,visibility'
$fontCss = (Invoke-WebRequest -Uri ('https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20,400,0,0&icon_names=' + $symbolNames + '&display=block')).Content
$fontUrl = [regex]::Match($fontCss, 'url\((https://[^)]+)\)').Groups[1].Value
Invoke-WebRequest -Uri $fontUrl -OutFile "$assetDirectory\material-symbols.ttf"
$fontCss = (Invoke-WebRequest -Uri 'https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap').Content
$fontUrl = [regex]::Match($fontCss, 'url\((https://[^)]+)\)').Groups[1].Value
Invoke-WebRequest -Uri $fontUrl -OutFile "$assetDirectory\roboto.ttf"
$brandAssets = @{
  'docs.png'='https://www.gstatic.com/images/branding/product/1x/docs_2020q4_48dp.png'
  'calendar.png'='https://www.gstatic.com/images/branding/product/1x/calendar_2020q4_48dp.png'
  'keep.png'='https://www.gstatic.com/images/branding/product/1x/keep_2020q4_48dp.png'
  'tasks.png'='https://www.gstatic.com/images/branding/product/1x/tasks_2021_48dp.png'
  'contacts.png'='https://www.gstatic.com/images/branding/product/1x/contacts_2022_48dp.png'
  'maps.png'='https://www.gstatic.com/images/branding/product/1x/maps_2020q4_48dp.png'
  'gemini.svg'='https://www.gstatic.com/lamda/images/gemini_sparkle_v002.svg'
}
foreach ($entry in $brandAssets.GetEnumerator()) {
  try { Invoke-WebRequest -Uri $entry.Value -OutFile (Join-Path $assetDirectory $entry.Key); Write-Output ($entry.Key + ' downloaded') }
  catch { Write-Output ($entry.Key + ': ' + $_.Exception.Message) }
}
Get-ChildItem $assetDirectory | Select-Object Name,Length
$fallbackAssets = @{
  'maps.png' = @('https://www.gstatic.com/images/branding/product/1x/maps_48dp.png','https://www.gstatic.com/images/branding/product/2x/maps_96in128dp.png')
  'tasks.png' = @('https://www.gstatic.com/images/branding/product/1x/tasks_48dp.png','https://www.gstatic.com/images/branding/product/1x/tasks_2023_48dp.png','https://www.gstatic.com/images/branding/product/2x/tasks_96in128dp.png')
  'gemini.png' = @('https://www.gstatic.com/images/branding/product/1x/gemini_48dp.png','https://www.gstatic.com/images/branding/product/2x/gemini_96in128dp.png')
}
foreach ($entry in $fallbackAssets.GetEnumerator()) {
  foreach ($address in $entry.Value) {
    try { Invoke-WebRequest -Uri $address -OutFile (Join-Path $assetDirectory $entry.Key); Write-Output ($entry.Key + ' downloaded: ' + $address); break }
    catch { continue }
  }
}
