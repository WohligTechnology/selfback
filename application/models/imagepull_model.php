<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class imagepull_model extends CI_Model
{
public function create($image)
{
$data=array("image" => $image);
print_r($data);
$query=$this->db->insert( "imagepull", $data );
$id=$this->db->insert_id();
if(!$query)
return  0;
else
return  $id;
}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("selftables_subtype")->row();
return $query;
}
function getsinglesubtype($id){
$this->db->where("id",$id);
$query=$this->db->get("selftables_subtype")->row();
return $query;
}
public function edit($id,$name,$description,$image,$order,$status)
{

$data=array("name" => $name,"description" => $description,"order" => $order,"status" => $status);
if($image != "")
  $data['image']=$image;
$this->db->where( "id", $id );
$query=$this->db->update( "selftables_subtype", $data );
return 1;
}
public function delete($id)
{
$query=$this->db->query("DELETE FROM `selftables_subtype` WHERE `id`='$id'");
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
