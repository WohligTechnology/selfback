<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class recipes_model extends CI_Model
{




  public function getCategory()
  {
    $query = $this->db->query("select  `id`,`name` , `image1` as 'categoryimg',`description`,`order` from `fynx_category`")->result();
    return $query;
  }


  function getCategoryById($id){
  $query=$this->db->query("SELECT `id`,`name`,`image2` as 'bannerimg',`description` from `fynx_category` WHERE `id` = $id")->row();
  return $query;
  }



    function getSubCategory($id){
    $query=$this->db->query("SELECT `id`,`name`,`order` from `fynx_subcategory` WHERE `category` = $id")->result();
    return $query;
    }




public function create($name,$description,$ingredients,$method,$valueperserve,$status,$image1)
{
$data=array("name" => $name,"description" => $description,"ingredients" => $ingredients,"method" => $method,"valueperserve" => $valueperserve,"status" => $status,"image" => $image1);
$query=$this->db->insert( "recipes", $data );
$id=$this->db->insert_id();
if(!$query)
return  0;
else
return  $id;
}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("recipes")->row();
return $query;
}

public function edit($name,$description,$ingredients,$method,$valueperserve,$status,$image1)
{
  echo "in update";
$data=array("name" => $name,"description" => $description,"ingredients" => $ingredients,"method" => $method,"valueperserve" => $valueperserve,"status" => $status);
if($image1 != "")
  $data['image']=$image1;
  print_r($data);
$this->db->where( "id", $id );

$query=$this->db->update( "recipes", $data );

return 1;
}
public function delete($id)
{
$query=$this->db->query("DELETE FROM `recipes` WHERE `id`='$id'");
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
