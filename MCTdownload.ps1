$url = "https://github.com/AveYo/MediaCreationTool.bat/archive/refs/heads/main.zip"
$output = "C:\temp\professional mediacreationtool.zip"

Invoke-WebRequest $url -OutPath $output

