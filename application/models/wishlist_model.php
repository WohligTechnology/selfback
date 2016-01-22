<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class wishlist_model extends CI_Model
{
public function create($user,$product,$timestamp)
{
$data=array("user" => $user,"product" => $product,"timestamp" => $timestamp);
$query=$this->db->insert( "fynx_wishlist", $data );
$id=$this->db->insert_id();
if(!$query)
return  0;
else
return  $id;
}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("fynx_wishlist")->row();
return $query;
}
function getsinglewishlist($id){
$this->db->where("id",$id);
$query=$this->db->get("fynx_wishlist")->row();
return $query;
}
public function edit($id,$user,$product,$timestamp)
{
$data=array("user" => $user,"product" => $product,"timestamp" => $timestamp);
$this->db->where( "id", $id );
$query=$this->db->update( "fynx_wishlist", $data );
return 1;
}
public function delete($id)
{
$query=$this->db->query("DELETE FROM `fynx_wishlist` WHERE `id`='$id'");
return $query;
}
      public function showwishlist($user)
	{
	   
		$query['product']=$this->db->query("SELECT distinct `fynx_wishlist`.`user`,`fynx_wishlist`.`product`,`fynx_product`.`id`,`fynx_product`.`name`,`fynx_product`.`sku`,`fynx_product`.`description`,
`fynx_product`.`price` ,`fynx_product`.`image1`,`fynx_product`.`image2`,`fynx_product`.`image3` FROM `fynx_wishlist` 
INNER JOIN `fynx_product` ON `fynx_product`.`id`=`fynx_wishlist`.`product` WHERE `fynx_wishlist`.`user`='$user' GROUP BY `fynx_product`.`id`")->result();
          $query['size']=$this->db->query("SELECT distinct `fynx_wishlist`.`user`,`fynx_wishlist`.`product`,`fynx_product`.`id`,`fynx_product`.`name`,`fynx_product`.`sku`,`fynx_product`.`description`,
`fynx_product`.`price` ,`fynx_product`.`image1`,`fynx_product`.`image2`,`fynx_product`.`image3` FROM `fynx_wishlist` 
INNER JOIN `fynx_product` ON `fynx_product`.`id`=`fynx_wishlist`.`product` WHERE `fynx_wishlist`.`user`='$user' GROUP BY `fynx_product`.`id`")->result();
		
		return $query;
	}
}
?>
