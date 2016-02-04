<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class plans_model extends CI_Model
{
public function create($plan,$price_in_INR,$price_in_dollars,$description,$title,$id)
{
$data=array("plan" => $plan,"title" => $title,"description" => $description,"price_in_INR" => $price_in_INR,"price_in_dollars" => $price_in_dollars,"packageid" => $id);
$query=$this->db->insert( "plans", $data );
$id=$this->db->insert_id();
if(!$query)
return  0;
else
return  $id;
}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("plans")->row();
return $query;
}
function getsinglerealtedblog($id){
$this->db->where("id",$id);
$query=$this->db->get("selftables_realtedblog")->row();
return $query;
}
public function edit($plan,$price_in_INR,$price_in_dollars,$description,$title,$id,$pid)
{
$data=array("plan" => $plan,"title" => $title,"description" => $description,"price_in_INR" => $price_in_INR,"price_in_dollars" => $price_in_dollars);
$this->db->where( "id", $id );
$query=$this->db->update( "plans", $data );

return 1;
}
public function delete($id)
{
$query=$this->db->query("DELETE FROM `plans` WHERE `id`='$id'");
return $query;
}
public function getimagebyid($id)
{
$query=$this->db->query("SELECT `image` FROM `selftables_realtedblog` WHERE `id`='$id'")->row();
return $query;
}
public function getdropdown()
{
$query=$this->db->query("SELECT * FROM `selftables_realtedblog` ORDER BY `id`
                    ASC")->row();
$return=array(
"" => "Select Option"
);
foreach($query as $row)
{
$return[$row->id]=$row->name;
}
return $return;
}

public function getblogdropdown()
{
$query=$this->db->query("SELECT * FROM `selftables_blog`  ORDER BY `id` ASC")->result();
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
