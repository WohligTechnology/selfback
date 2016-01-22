<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class productdesignimage_model extends CI_Model
{
public function create($product,$design,$image)
{
$data=array("product" => $product,"design" => $design,"image" => $image);
$query=$this->db->insert( "productdesignimage", $data );
$id=$this->db->insert_id();
if(!$query)
return  0;
else
return  $id;
}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("productdesignimage")->row();
return $query;
}
function getsingleproductdesignimage($id){
$this->db->where("id",$id);
$query=$this->db->get("productdesignimage")->row();
return $query;
}
public function edit($id,$product,$design,$image)
{
$data=array("product" => $product,"design" => $design,"image" => $image);
$this->db->where( "id", $id );
$query=$this->db->update( "productdesignimage", $data );
return 1;
}
public function delete($id)
{
$query=$this->db->query("DELETE FROM `productdesignimage` WHERE `id`='$id'");
return $query;
}
     public function getproductdesignimagedropdown()
	{
		$query=$this->db->query("SELECT * FROM `productdesignimage` WHERE `status`=2  ORDER BY `id` ASC")->result();
		$return=array(
		"" => "Choose an option"
		);
		foreach($query as $row)
		{
			$return[$row->id]=$row->name;
		}
		
		return $return;
	}
    public function getImageById($id)
    {
        $query = $this->db->query('SELECT `image` FROM `productdesignimage` WHERE `id`=('.$this->db->escape($id).')')->row();

        return $query;
    }
}
?>