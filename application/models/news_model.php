<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class news_model extends CI_Model
{


  public function getNews($year)
  {
    if($year !="")
    {
      $query = $this->db->query("select title , image,year from `news` where `status`=0 and `year`=$year")->result();
      return $query;
    }
    else {
      $query = $this->db->query("select title , image,year from `news` where `status`=0")->result();
      return $query;
    }

  }

  public function getNewsYear()
  {
    $query = $this->db->query("select distinct `year` from `news` order by year desc")->result();
    return $query;
  }

public function create($name,$image,$year,$status)
{
$data=array("title" => $name,"image" => $image,"year" => $year,"status" => $status);
$query=$this->db->insert( "news", $data );
$id=$this->db->insert_id();
if(!$query)
return  0;
else
return  $id;
}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("news")->row();
return $query;
}
function getsinglesubtype($id){
$this->db->where("id",$id);
$query=$this->db->get("selftables_subtype")->row();
return $query;
}
public function edit($id,$name,$image,$year,$status)
{

$data=array("title" => $name,"year" => $year,"status" => $status);
if($image != "")
  $data['image']=$image;
$this->db->where( "id", $id );
$query=$this->db->update( "news", $data );
return 1;
}
public function delete($id)
{
$query=$this->db->query("DELETE FROM `news` WHERE `id`='$id'");
return $query;
}
public function getimagebyid($id)
{
$query=$this->db->query("SELECT `image` FROM `selftables_subtype` WHERE `id`='$id'")->row();
return $query;
}
public function getdropdown()
{
$query=$this->db->query("SELECT * FROM `selftables_subtype` ORDER BY `id`
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
}
?>
