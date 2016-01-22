<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class config_model extends CI_Model
{
public function create($text,$content)
{
$data=array("text" => $text,"content" => $content);
$query=$this->db->insert( "fynx_config", $data );
$id=$this->db->insert_id();
if(!$query)
return  0;
else
return  $id;
}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("fynx_config")->row();
return $query;
}
function getsingleconfig($id){
$this->db->where("id",$id);
$query=$this->db->get("fynx_config")->row();
return $query;
}
public function edit($id,$text,$content)
{
$data=array("text" => $text,"content" => $content);
$this->db->where( "id", $id );
$query=$this->db->update( "fynx_config", $data );
return 1;
}
public function delete($id)
{
$query=$this->db->query("DELETE FROM `fynx_config` WHERE `id`='$id'");
return $query;
}
}
?>
