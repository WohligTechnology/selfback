<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class recipes_model extends CI_Model
{




  function getRecipeDetail($id){
      $query['recipe']=$this->db->query("SELECT `id`, `name`, `image`, `description`, `ingredients`, `method`, `valueperserve` FROM `recipes` WHERE `id` = $id")->row();
//       $query['relatedproduct']=$this->db->query("SELECT  `fynx_product`.`id` ,  `fynx_product`.`image1` AS  `image` ,  `fynx_product`.`price` ,  `fynx_product`.`name`
// FROM  `fynx_product`
// INNER JOIN  `relatedproduct` ON  `relatedproduct`.`relatedproduct` =  `fynx_product`.`id`
// WHERE  `relatedproduct`.`product` ='$id'")->result();
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

public function edit($id,$name,$description,$ingredients,$method,$valueperserve,$status,$image1)
{

$data=array("name" => $name,"description" => $description,"ingredients" => $ingredients,"method" => $method,"valueperserve" => $valueperserve,"status" => $status);
if($image1 != "")
  $data['image']=$image1;

$this->db->where( "id", $id );
$query=$this->db->update( "recipes", $data );

// $query=$this->db->update( "recipes", $data );

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
