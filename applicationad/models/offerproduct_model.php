<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class offerproduct_model extends CI_Model
{
public function create($offer,$product,$quantity)
{
$data=array("offer" => $offer,"product" => $product,"quantity" => $quantity);
$query=$this->db->insert( "fynx_offerproduct", $data );
$id=$this->db->insert_id();
if(!$query)
return  0;
else
return  $id;
}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("fynx_offerproduct")->row();
return $query;
}
function getsingleofferproduct($id){
$this->db->where("id",$id);
$query=$this->db->get("fynx_offerproduct")->row();
return $query;
}
public function edit($id,$offer,$product,$quantity)
{
$data=array("offer" => $offer,"product" => $product,"quantity" => $quantity);
$this->db->where( "id", $id );
$query=$this->db->update( "fynx_offerproduct", $data );
return 1;
}
public function delete($id)
{
$query=$this->db->query("DELETE FROM `fynx_offerproduct` WHERE `id`='$id'");
return $query;
}
}
?>
