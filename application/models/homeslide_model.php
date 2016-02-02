<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class homeslide_model extends CI_Model
{

  public function getSlide()
  {
    $query = $this->db->query("select image as 'img', name as 'title',link, description from `fynx_homeslide` where `status`=2")->result();
    return $query;
  }

  public function subscribe($email)
  {
  $data=array("email" => $email);
  $query=$this->db->insert( "subscribe", $data );
  $id=$this->db->insert_id();
  if(!$query)
  return  0;
  else
  return  $id;
  }



public function create($name,$description,$link,$sorder,$target,$status,$image,$template,$class,$text,$centeralign)
{
$data=array("name" => $name,"description" => $description,"link" => $link,"sorder" => $sorder,"target" => $target,"status" => $status,"image" => $image,"template" => $template,"class" => $class,"text" => $text,"centeralign" => $centeralign);
$query=$this->db->insert( "fynx_homeslide", $data );
$id=$this->db->insert_id();
if(!$query)
return  0;
else
return  $id;
}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("fynx_homeslide")->row();
return $query;
}
function getsinglehomeslide($id){
$this->db->where("id",$id);
$query=$this->db->get("fynx_homeslide")->row();
return $query;
}
public function edit($id,$name,$description,$link,$sorder,$target,$status,$image,$template,$class,$text,$centeralign)
{
                    if($image=="")
						{
						$image=$this->homeslide_model->getimagebyid($id);
						   // print_r($image);
							$image=$image->image;
						}
$data=array("name" => $name,"description" => $description,"link" => $link,"sorder" => $sorder,"target" => $target,"status" => $status,"image" => $image,"template" => $template,"class" => $class,"text" => $text,"centeralign" => $centeralign);
$this->db->where( "id", $id );
$query=$this->db->update( "fynx_homeslide", $data );
return 1;
}
public function delete($id)
{
$query=$this->db->query("DELETE FROM `fynx_homeslide` WHERE `id`='$id'");
return $query;
}
    public function getImageById($id)
    {
        $query = $this->db->query('SELECT `image` FROM `fynx_homeslide` WHERE `id`=('.$this->db->escape($id).')')->row();

        return $query;
    }
}
?>
