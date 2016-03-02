<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class useraddress_model extends CI_Model
{
public function create($user,$name,$billingcity,$billingstate,$billingcountry,$shippingcity,$shippingstate,$shippingcountry,$shippingpincode,$billingaddress,$shippingaddress)
{
$data=array("user" => $user,"name" => $name,"billingcity" => $billingcity,"billingstate" => $billingstate,"billingcountry" => $billingcountry,"shippingcity" => $shippingcity,"shippingstate" => $shippingstate,"shippingcountry" => $shippingcountry,"shippingpincode" => $shippingpincode,"billingaddress" => $billingaddress,"shippingaddress" => $shippingaddress);
$query=$this->db->insert( "fynx_useraddress", $data );
$id=$this->db->insert_id();
if(!$query)
return  0;
else
return  $id;
}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("fynx_useraddress")->row();
return $query;
}
function getsingleuseraddress($id){
$this->db->where("id",$id);
$query=$this->db->get("fynx_useraddress")->row();
return $query;
}
public function edit($id,$user,$name,$billingcity,$billingstate,$billingcountry,$shippingcity,$shippingstate,$shippingcountry,$shippingpincode,$billingaddress,$shippingaddress)
{
$data=array("user" => $user,"name" => $name,"billingcity" => $billingcity,"billingstate" => $billingstate,"billingcountry" => $billingcountry,"shippingcity" => $shippingcity,"shippingstate" => $shippingstate,"shippingcountry" => $shippingcountry,"shippingpincode" => $shippingpincode,"billingaddress" => $billingaddress,"shippingaddress" => $shippingaddress);
$this->db->where( "id", $id );
$query=$this->db->update( "fynx_useraddress", $data );
return 1;
}
public function delete($id)
{
$query=$this->db->query("DELETE FROM `fynx_useraddress` WHERE `id`='$id'");
return $query;
}
}
?>
