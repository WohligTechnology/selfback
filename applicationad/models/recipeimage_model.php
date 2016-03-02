<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class recipeimage_model extends CI_Model
{
public function create($recipe,$order,$status,$image)
{
$data=array("recipe" => $recipe,"image" => $image,"sorder" => $order,"status" => $status);
$query=$this->db->insert( "recipes_image", $data );
$id=$this->db->insert_id();
if(!$query)
return  0;
else
return  $id;
}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("recipes_image")->row();
return $query;
}

public function edit($id,$order,$status,$image)
{

$data=array("sorder" => $order,"status" => $status);
if($image != "")
  $data['image']=$image;

$this->db->where( "id", $id );
$query=$this->db->update( "recipes_image", $data );
return 1;
}
public function delete($id)
{
$query=$this->db->query("DELETE FROM `recipes_image` WHERE `id`='$id'");
return $query;
}
public function getimagebyid($id)
{
$query=$this->db->query("SELECT `image` FROM `recipes_image` WHERE `id`='$id'")->row();
return $query;
}

}
?>
