$regex = '(.*)\.(?>mp4|mkv)'
$regexSVP = '(.*\.SVP)\.(?>mp4|mkv)'
$fList = (Get-ChildItem -Recurse -File)
$newList = New-Object String[] $fList.Length

$path = $('..\'+'completed')
if($(Test-Path $path) -ne $true){New-Item -Path $path -ItemType Directory}
foreach($var in $fList)
{
    $svpFile = $var.BaseName + '.SVP'
    if($fList.BaseName.Contains($svpFile))
    {
        $svpFilePath = $var.DirectoryName + '\' + $svpFile + '.mkv'
        Move-Item $var.FullName.Replace("[", "``[").replace("]", "``]") $path
        Move-Item $svpFilePath.Replace("[", "``[").replace("]", "``]") $path
    }
}
#$fList.Extension