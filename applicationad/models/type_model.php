<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class type_model extends CI_Model
{
public function create($name,$status,$timestamp,$subcategory)
{
$data=array("name" => $name,"status" => $status,"subcategory" => $subcategory);
$query=$this->db->insert( "fynx_type", $data );
$id=$this->db->insert_id();
if(!$query)
return  0;
else
return  $id;
}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("fynx_type")->row();
return $query;
}
function getsingletype($id){
$this->db->where("id",$id);
$query=$this->db->get("fynx_type")->row();
return $query;
}
public function edit($id,$name,$status,$timestamp,$subcategory)
{
$data=array("name" => $name,"status" => $status,"timestamp" => $timestamp,"subcategory" => $subcategory);
$this->db->where( "id", $id );
$query=$this->db->update( "fynx_type", $data );
return 1;
}
public function delete($id)
{
$query=$this->db->query("DELETE FROM `fynx_type` WHERE `id`='$id'");
return $query;
}
    public function gettypedropdown()
	{
		$query=$this->db->query("SELECT * FROM `fynx_type` WHERE `status`=2  ORDER BY `id` ASC")->result();
		$return=array(
            "" => "Choose an option"
		);
		foreach($query as $row)
		{
			$return[$row->id]=$row->name;
		}
		
		return $return;
	}
}
?>
