<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class tags_model extends CI_Model
{

  function getAllTags(){
      $query=$this->db->query("SELECT `id`,`name` from `tags`")->result();

   return $query;

  }


public function create($name)
{
$data=array("name" => $name);
$query=$this->db->insert( "tags", $data );
$id=$this->db->insert_id();
if(!$query)
return  0;
else
return  $id;
}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("tags")->row();
return $query;
}
// function getarticlebytagname($name){
//
//           $query="SELECT `mytest_article`.id,`mytest_article`.title, `mytest_article`.image,`mytest_article`.content,`mytest_article`.views, `mytest_tags`.name as 'Tag name' FROM `mytest_tagarticle`
//               LEFT JOIN `mytest_article` ON `mytest_article`.id = `mytest_tagarticle`.article
//                 LEFT JOIN `mytest_tags`
//                   ON `mytest_tags`.id =`mytest_tagarticle`.tag where `mytest_tags`.name='$name'";
//          $query=$this->db->query($query)->result();
//
//              $return=new stdClass();
//              $return->query=$query;
//              return $return;
//
//
// return $query;
// }




public function edit($id,$name)
{
// if($image=="")
// {
// $image=$this->tags_model->getimagebyid($id);
// $image=$image->image;
// }
$data=array("name" => $name);
$this->db->where( "id", $id );
$query=$this->db->update( "tags", $data );
return 1;
}
public function delete($id)
{
$query=$this->db->query("DELETE FROM `tags` WHERE `id`='$id'");
return $query;
}
public function getimagebyid($id)
{
$query=$this->db->query("SELECT `image` FROM tags` WHERE `id`='$id'")->row();
return $query;
}
public function getdropdown()
{
$query=$this->db->query("SELECT * FROM `tags` ORDER BY `id`
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


public function gettagdropdown()
{
$query=$this->db->query("SELECT * FROM `tags`  ORDER BY `id` ASC")->result();
$return=array(
);
foreach($query as $row)
{
  $return[$row->id]=$row->name;
}

return $return;
}


}
?>
