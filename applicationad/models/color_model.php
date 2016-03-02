<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class color_model extends CI_Model
{
public function create($name,$status,$timestamp)
{
$data=array("name" => $name,"status" => $status);
$query=$this->db->insert( "fynx_color", $data );
$id=$this->db->insert_id();
if(!$query)
return  0;
else
return  $id;
}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("fynx_color")->row();
return $query;
}
function getsinglecolor($id){
$this->db->where("id",$id);
$query=$this->db->get("fynx_color")->row();
return $query;
}
public function edit($id,$name,$status,$timestamp)
{
$data=array("name" => $name,"status" => $status,"timestamp" => $timestamp);
$this->db->where( "id", $id );
$query=$this->db->update( "fynx_color", $data );
return 1;
}
public function delete($id)
{
$query=$this->db->query("DELETE FROM `fynx_color` WHERE `id`='$id'");
return $query;
}
     public function getcolordropdown()
    {
        $query = $this->db->query('SELECT * FROM `fynx_color` WHERE `status`=2 ORDER BY `id` ASC')->result();
        $return=array(
		"" => "Choose color"
		);
        foreach ($query as $row) {
            $return[$row->id] = $row->name;
        }

        return $return;
    }
}
?>
