<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class video_model extends CI_Model
{



public function create($name,$link,$status)
{
$data=array("name" => $name,"link" => $link,"status" => $status);
$query=$this->db->insert( "video", $data );
$id=$this->db->insert_id();
if(!$query)
return  0;
else
return  $id;
}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("video")->row();
return $query;
}



public function edit($id,$name,$link,$status)
{

$data=array("name" => $name,"link" => $link,"status" => $status);
$this->db->where( "id", $id );
$query=$this->db->update( "video", $data );
return 1;
}
public function delete($id)
{
$query=$this->db->query("DELETE FROM `video` WHERE `id`='$id'");
return $query;
}
public function getimagebyid($id)
{
$query=$this->db->query("SELECT `image` FROM `selftables_subtype` WHERE `id`='$id'")->row();
return $query;
}
public function getdropdown()
{
$query=$this->db->query("SELECT * FROM `selftables_subtype` ORDER BY `id`
                    ASC")->row();
$return=array(
"" => "Select Option"
);
foreach($query as $row)
{
$return[$row->id]=$row->name;
}
return $return;
}
}
?>
