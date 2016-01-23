<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class subcategory_model extends CI_Model
{
public function create($category,$name,$order,$status,$image1,$image2)
{
$data=array("category" => $category,"name" => $name,"order" => $order,"status" => $status,"image1" => $image1,"image2" => $image2);
$query=$this->db->insert( "fynx_subcategory", $data );
$id=$this->db->insert_id();
if(!$query)
return  0;
else
return  $id;
}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("fynx_subcategory")->row();
return $query;
}
function getsinglesubcategory($id){
$this->db->where("id",$id);
$query=$this->db->get("fynx_subcategory")->row();
return $query;
}
public function edit($id,$category,$name,$order,$status,$image1,$image2)
{
$data=array("category" => $category,"name" => $name,"order" => $order,"status" => $status);
if($image1 != "")
  $data['image1']=$image1;
if($image2 != "")
  $data['image2']=$image2;
$this->db->where( "id", $id );
$this->db->where( "id", $id );
$query=$this->db->update( "fynx_subcategory", $data );
return 1;
}
public function delete($id)
{
$query=$this->db->query("DELETE FROM `fynx_subcategory` WHERE `id`='$id'");
return $query;
}
     public function getsubcategorydropdown()
	{
		$query=$this->db->query("SELECT * FROM `fynx_subcategory` WHERE `status`=2  ORDER BY `id` ASC")->result();
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
