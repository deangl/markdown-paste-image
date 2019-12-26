if($args.Count -eq 0)
{
   -1
   exit
}else{
$file_name = $args[0]
$img = get-clipboard -format image
if ($img){
    $img.save($file_name)
    $file_name}
else{
    0
}
}