<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class designer_model extends CI_Model
{
public function create($email,$noofdesigns,$designerid,$name,$contact,$commission)
{
$data=array("email" => $email,"noofdesigns" => $noofdesigns,"designerid" => $designerid,"name" => $name,"contact" => $contact,"commission" => $commission);
$query=$this->db->insert( "fynx_designer", $data );
$id=$this->db->insert_id();
if(!$query)
return  0;
else
return  $id;
}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("fynx_designer")->row();
return $query;
}
function getsingledesigner($id){
$this->db->where("id",$id);
$query=$this->db->get("fynx_designer")->row();
return $query;
}
public function edit($id,$email,$noofdesigns,$designerid,$name,$contact,$commission)
{
$data=array("email" => $email,"noofdesigns" => $noofdesigns,"designerid" => $designerid,"name" => $name,"contact" => $contact,"commission" => $commission);
$this->db->where( "id", $id );
$query=$this->db->update( "fynx_designer", $data );
return 1;
}
    public function getdesignerdropdown()
    {
        $query = $this->db->query('SELECT * FROM `fynx_designer`  ORDER BY `id` ASC')->result();
        foreach ($query as $row) {
            $designer[$row->id] = $row->name;
        }

        return $designer;
    } 
    public function getdesigndropdown()
    {
        $query = $this->db->query('SELECT * FROM `fynx_design`  ORDER BY `id` ASC')->result();
        foreach ($query as $row) {
            $designer[$row->id] = $row->name;
        }

        return $designer;
    }
public function delete($id)
{
$query=$this->db->query("DELETE FROM `fynx_designer` WHERE `id`='$id'");
return $query;
}
}
?>
