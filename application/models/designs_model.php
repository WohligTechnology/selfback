<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class designs_model extends CI_Model
{
public function create($designer,$image,$status,$timestamp,$name)
{
$data=array("designer" => $designer,"image" => $image,"status" => $status,"name" => $name);
$query=$this->db->insert( "fynx_designs", $data );
$id=$this->db->insert_id();
    
    $fromuser=$designer;
 $query1=$this->db->query("SELECT COUNT(*) as `count` FROM `fynx_designs` WHERE `designer`=$fromuser")->row();
        $designcount=$query1->count;
     
        $data  = array(
			'noofdesigns' => $designcount
		);
		$this->db->where( 'id', $fromuser );
		$this->db->update( 'fynx_designer', $data );
		return  1;    
if(!$query)
return  0;
else
return  $id;
}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("fynx_designs")->row();
return $query;
}
function getsingledesigns($id){
$this->db->where("id",$id);
$query=$this->db->get("fynx_designs")->row();
return $query;
}
public function edit($id,$designer,$image,$status,$timestamp,$name)
{
$data=array("designer" => $designer,"image" => $image,"status" => $status,"timestamp" => $timestamp,"name" => $name);
$this->db->where( "id", $id );
$query=$this->db->update( "fynx_designs", $data );
return 1;
}
public function delete($id)
{
$query=$this->db->query("DELETE FROM `fynx_designs` WHERE `id`='$id'");
return $query;
}
    public function getstatusdropdown()
	{
		$status= array(
			 "1" => "Approved",
			 "2" => "Waiting",
			 "3" => "Reject",
			 "4" => "Publish"
			);
		return $status;
	}
    public function getImageById($id)
    {
        $query = $this->db->query('SELECT `image` FROM `fynx_designs` WHERE `id`=('.$this->db->escape($id).')')->row();

        return $query;
    }
     public function getdesignsdropdown()
	{
		$query=$this->db->query("SELECT * FROM `fynx_designs`  ORDER BY `id` ASC")->result();
		$return=array(
		"" => "Choose Design"
		);
		foreach($query as $row)
		{
			$return[$row->id]=$row->name;
		}
		
		return $return;
	}
}
?>
