#include <Array.au3>

$file = Fileread("!helper.txt")
$split = StringSplit($file,@CRLF,3)


$template = FileRead("!temp.txt")
For $rawString in $split
	$string = StringStripWS($rawString,8)
	If $string == "" or StringInStr($string,"<ahref") Then ContinueLoop

	$newHTML = StringReplace($template,"%%TITLE%%", $rawString, 0, 1)
	FileWrite($rawString&".htm",$newHTML)


Next
