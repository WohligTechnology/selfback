<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class orderitem_model extends CI_Model
{
public function create($discount,$order,$product,$quantity,$price,$finalprice)
{
$data=array("discount" => $discount,"order" => $order,"product" => $product,"quantity" => $quantity,"price" => $price,"finalprice" => $finalprice);
$query=$this->db->insert( "fynx_orderitem", $data );
$id=$this->db->insert_id();
if(!$query)
return  0;
else
return  $id;
}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("fynx_orderitem")->row();
return $query;
}
function getsingleorderitem($id){
$this->db->where("id",$id);
$query=$this->db->get("fynx_orderitem")->row();
return $query;
}
public function edit($id,$discount,$order,$product,$quantity,$price,$finalprice)
{
$data=array("discount" => $discount,"order" => $order,"product" => $product,"quantity" => $quantity,"price" => $price,"finalprice" => $finalprice);
$this->db->where( "id", $id );
$query=$this->db->update( "fynx_orderitem", $data );
return 1;
}
public function delete($id)
{
$query=$this->db->query("DELETE FROM `fynx_orderitem` WHERE `id`='$id'");
return $query;
}
}
?>
