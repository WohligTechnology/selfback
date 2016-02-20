<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class category_model extends CI_Model
{




  public function getCategory()
  {
    $query = $this->db->query("SELECT  `id`,`name` , `image1` AS 'categoryimg',`description`,`order` FROM `fynx_category` WHERE `status`=2 ORDER BY `order`")->result();
    return $query;
  }


  function getCategoryById($id){
  $query=$this->db->query("SELECT `id`,`name`,`image2` as 'bannerimg',`description` from `fynx_category` WHERE `id` = $id AND `status`=2")->row();
  return $query;
  }



    function getSubCategory($id){
    $query=$this->db->query("SELECT `id`,`name`,`image1` AS 'bannerimg',`order` from `fynx_subcategory` WHERE `category` = $id AND `status`=2")->result();
    return $query;
    }




public function create($order,$name,$description,$parent,$status,$image1,$image2)
{
$data=array("order" => $order,"name" => $name,"description" => $description,"parent" => $parent,"status" => $status,"image1" => $image1,"image2" => $image2);
$query=$this->db->insert( "fynx_category", $data );
$id=$this->db->insert_id();
if(!$query)
return  0;
else
return  $id;
}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("fynx_category")->row();
return $query;
}
function getsinglecategory($id){
$this->db->where("id",$id);
$query=$this->db->get("fynx_category")->row();
return $query;
}

public function getimage1byid($id)
{
$query=$this->db->query("SELECT `image1` FROM `fynx_category` WHERE `id`='$id'")->row();
return $query;
}
public function getimage2byid($id)
{
$query=$this->db->query("SELECT `image2` FROM `fynx_category` WHERE `id`='$id'")->row();
return $query;
}


public function edit($id,$order,$name,$description,$parent,$status,$image1,$image2)
{
$data=array("order" => $order,"name" => $name,"description" => $description,"parent" => $parent,"status" => $status);
if($image1 != "")
  $data['image1']=$image1;
if($image2 != "")
  $data['image2']=$image2;
$this->db->where( "id", $id );
$query=$this->db->update( "fynx_category", $data );

return 1;
}
public function delete($id)
{
$query=$this->db->query("DELETE FROM `fynx_category` WHERE `id`='$id'");
return $query;
}
    public function getcategorydropdown()
	{
		$query=$this->db->query("SELECT * FROM `fynx_category` WHERE `status`=2  ORDER BY `id` ASC")->result();
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
