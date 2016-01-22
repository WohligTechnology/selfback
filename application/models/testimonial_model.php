<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class testimonial_model extends CI_Model
{
public function create($name,$location,$description,$weight)
{
$data=array("name" => $name,"location" => $location,"description" => $description,"weight" => $weight);
$query=$this->db->insert( "testimonial", $data );
$id=$this->db->insert_id();
if(!$query)
return  0;
else
return  $id;
}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("testimonial")->row();
return $query;
}
function getsingletestimonial($id){
$this->db->where("id",$id);
$query=$this->db->get("testimonial")->row();
return $query;
}
public function edit($id,$name,$location,$description,$weight)
{
$data=array("name" => $name,"location" => $location,"description" => $description,"weight" => $weight);
$this->db->where( "id", $id );
$query=$this->db->update( "testimonial", $data );
return 1;
}
public function delete($id)
{
$query=$this->db->query("DELETE FROM `testimonial` WHERE `id`='$id'");
return $query;
}
    public function getimagebyid($id)
{
$query=$this->db->query("SELECT `image` FROM `testimonial` WHERE `id`='$id'")->row();
return $query;
}
}
?>
