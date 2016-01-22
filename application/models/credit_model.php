<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class credit_model extends CI_Model
{
public function create($user,$credit,$addcredit)
{
$data=array("user" => $user,"credit" => $credit,"addcredit" => $addcredit);
$query=$this->db->insert( "fynx_credit", $data );
$id=$this->db->insert_id();
if(!$query)
return  0;
else
return  $id;
}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("fynx_credit")->row();
return $query;
}
function getsinglecredit($id){
$this->db->where("id",$id);
$query=$this->db->get("fynx_credit")->row();
return $query;
}
public function edit($id,$user,$credit,$addcredit)
{
$data=array("user" => $user,"credit" => $credit,"addcredit" => $addcredit);
$this->db->where( "id", $id );
$query=$this->db->update( "fynx_credit", $data );
return 1;
}
public function delete($id)
{
$query=$this->db->query("DELETE FROM `fynx_credit` WHERE `id`='$id'");
return $query;
}
}
?>
