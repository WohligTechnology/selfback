<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class offer_model extends CI_Model
{
public function create($title,$description,$price,$status,$image,$fromdate,$todate)
{
$data=array("title" => $title,"description" => $description,"price" => $price,"status" => $status,"image" => $image,"fromdate" => $fromdate,"todate" => $todate);
$query=$this->db->insert( "fynx_offer", $data );
$id=$this->db->insert_id();
if(!$query)
return  0;
else
return  $id;
}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("fynx_offer")->row();
return $query;
}
function getsingleoffer($id){
$this->db->where("id",$id);
$query=$this->db->get("fynx_offer")->row();
return $query;
}
public function edit($id,$title,$description,$price,$status,$image,$fromdate,$todate)
{
$data=array("title" => $title,"description" => $description,"price" => $price,"status" => $status,"image" => $image,"fromdate" => $fromdate,"todate" => $todate);
$this->db->where( "id", $id );
$query=$this->db->update( "fynx_offer", $data );
return 1;
}
public function delete($id)
{
$query=$this->db->query("DELETE FROM `fynx_offer` WHERE `id`='$id'");
return $query;
}
}
?>
