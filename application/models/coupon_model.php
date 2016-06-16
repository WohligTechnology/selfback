<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class coupon_model extends CI_Model
{
public function create($type,$min,$max,$discount,$name,$status,$count,$currency)
{
$data=array("name" => $name,"status" => $status,"type" => $type,"max" => $max,"min" => $min,"discount" => $discount,"count" => $count,"currency" => $currency);
$query=$this->db->insert( "fynx_coupon", $data );
$id=$this->db->insert_id();
if(!$query)
return  0;
else
return  $id;
}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("fynx_coupon")->row();
return $query;
}
function getsinglecoupon($id){
$this->db->where("id",$id);
$query=$this->db->get("fynx_coupon")->row();
return $query;
}
public function edit($id,$type,$min,$max,$discount,$name,$status,$count,$currency)
{
$data=array("name" => $name,"status" => $status,"type" => $type,"max" => $max,"min" => $min,"discount" => $discount,"count" => $count,"currency" => $currency);
$this->db->where( "id", $id );
$query=$this->db->update( "fynx_coupon", $data );
return 1;
}
public function delete($id)
{
$query=$this->db->query("DELETE FROM `fynx_coupon` WHERE `id`='$id'");
return $query;
}
    public function getusertypedropdown()
	{
		$return=array(
            "" => "Choose user type",
            "1" => "Old User & New User",
            "2" => "New User"
		);
		
		return $return;
	}
    public function getcurrencydropdown()
	{
		$return=array(
            "" => "Choose Currency",
            "1" => "INR",
            "2" => "USD",
            "3" => "GBP",
            "4" => "EUR",
            "5" => "ZAF",
            "6" => "AUD",
            "7" => "NZD"
		);
		
		return $return;
	}
}
?>
