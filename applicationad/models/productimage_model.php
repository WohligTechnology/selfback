<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class productimage_model extends CI_Model
{
public function create($relatedproduct,$design,$product)
{
$data=array("product" => $product,"relatedproduct" => $relatedproduct,"design" => $design,"product" => $product);
$query=$this->db->insert( "relatedproduct", $data );
$id=$this->db->insert_id();
if(!$query)
return  0;
else
return  $id;
}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("relatedproduct")->row();
return $query;
}
function getsingleproductimage($id){
$this->db->where("id",$id);
$query=$this->db->get("relatedproduct")->row();
return $query;
}
public function edit($id,$relatedproduct,$design,$product)
{
$data=array("product" => $product,"relatedproduct" => $relatedproduct,"design" => $design,"product" => $product);
$this->db->where( "id", $id );
$query=$this->db->update( "relatedproduct", $data );
return 1;
}
public function delete($id)
{
$query=$this->db->query("DELETE FROM `relatedproduct` WHERE `id`='$id'");
return $query;
}
     public function getImageById($id)
    {
        $query = $this->db->query('SELECT `image` FROM `relatedproduct` WHERE `id`=('.$this->db->escape($id).')')->row();

        return $query;
    }
}
?>
