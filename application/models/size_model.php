<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class size_model extends CI_Model
{
public function create($status,$name)
{
$data=array("status" => $status,"name" => $name);
$query=$this->db->insert( "fynx_size", $data );
$id=$this->db->insert_id();
if(!$query)
return  0;
else
return  $id;
}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("fynx_size")->row();
return $query;
}
function getsinglesize($id){
$this->db->where("id",$id);
$query=$this->db->get("fynx_size")->row();
return $query;
}
public function edit($id,$status,$name)
{
$data=array("status" => $status,"name" => $name);
$this->db->where( "id", $id );
$query=$this->db->update( "fynx_size", $data );
return 1;
}
public function delete($id)
{
$query=$this->db->query("DELETE FROM `fynx_size` WHERE `id`='$id'");
return $query;
}
    public function getsizedropdown()
    {
        $query = $this->db->query('SELECT * FROM `fynx_size`  ORDER BY `id` ASC')->result();
        $return=array(
		"" => "Choose Size"
		);
        foreach ($query as $row) {
            $return[$row->id] = $row->name;
        }

        return $return;
    }
}
?>
