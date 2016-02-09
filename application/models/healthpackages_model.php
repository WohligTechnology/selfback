<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class healthpackages_model extends CI_Model
{

public function getPlans($sid)
{

if($sid !="")
{


  //$pid= $data['message'][0]['id'];
  $return->plans = $this->db->query("SELECT `id`,`consults`,`months`,`type` FROM `selftables_healthpackages` WHERE `subtype`=$sid" )->result();
  }
else {

    $return->plans = $this->db->query("SELECT `id`,`consults`,`months`,`type` FROM `selftables_healthpackages` WHERE `type`='Weight Loss' ")->result();
}
  foreach($return->plans  as $plan)
    {

        $plan->subplans = $this->db->query("SELECT `id`,`plan`,`title`,`description`,`price_in_INR`,`price_in_dollars` from `plans` where `packageid`= '$plan->id' ")->result();
      $userid=$this->session->userdata('id');
      if($userid=="")
             {
               $cart = $this->cart->contents();
               $newcart = array();
               foreach ($cart as $item) {

                   array_push($newcart, $item);
               }
               $data['message'] = $newcart;

                 foreach($data['message'] as $key=>$element)
                 {
                     $proid=$element["id"];

//                     echo $proid;
 //                     if($proid==$subplan->id)
 //                     {
 // $return->status="true";
 //                     }
 //                     else {
 //  $return->status="false";
 //                     }
 //                       $subplan->status=$return->status;
                 }
             }
             else {

               foreach($plan->subplans  as $subplan)
                 {
   $chkplan=$this->db->query("select * from `fynx_cart` where `user`= '$userid' and `product`='$subplan->id'")->row();

             if (!empty($chkplan))
             {

               $return->status=true;
             }
             else {
                $return->status=false;
             }
              $subplan->status=$return->status;
             }
              }

  }
  return $return;


}

public function getSubPackages()
{


$query= $this->db->query("select `id`,`name`,`description`,`image`,`order` from selftables_subtype where `status`=0")->result();
return $query;
}

public function create($type,$months,$visits,$plan,$price_in_INR,$price_in_dollars,$description,$title,$subtype)
{
$data=array("type" => $type,"months" => $months,"consults" => $visits,"plan" => $plan,"price_in_INR" => $price_in_INR,"price_in_dollars" => $price_in_dollars,"description" => $description,"title" => $title,"subtype" => $subtype);
$query=$this->db->insert( "selftables_healthpackages", $data );
$id=$this->db->insert_id();
if(!$query)
return  0;
else
return  $id;
}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("selftables_healthpackages")->row();
return $query;
}
function getsinglehealthpackages($id){
$this->db->where("id",$id);
$query=$this->db->get("selftables_healthpackages")->row();
return $query;
}
public function edit($id,$type,$months,$visits,$plan,$price_in_INR,$price_in_dollars,$description,$title,$subtype)
{
if($image=="")
{
$image=$this->healthpackages_model->getimagebyid($id);
$image=$image->image;
}
$data=array("type" => $type,"months" => $months,"consults" => $visits,"plan" => $plan,"price_in_INR" => $price_in_INR,"price_in_dollars" => $price_in_dollars,"description" => $description,"title" => $title,"subtype" => $subtype);
$this->db->where( "id", $id );
$query=$this->db->update( "selftables_healthpackages", $data );
return 1;
}
public function delete($id)
{
$query=$this->db->query("DELETE FROM `selftables_healthpackages` WHERE `id`='$id'");
return $query;
}
public function getimagebyid($id)
{
// $query=$this->db->query("SELECT `image` FROM `selftables_healthpackages` WHERE `id`='$id'")->row();
// return $query;
}
public function getdropdown()
{
$query=$this->db->query("SELECT * FROM `selftables_healthpackages` ORDER BY `id`
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

public function getplanrdropdown()
{
$status= array(
   "" => "Choose Plan",
   "1" => "Silver",
   "2" => "Gold",
   "3" => "Platinum",
   "4" => "Diamond"
  );
return $status;
}

public function getsubtypedropdown()
{
$query=$this->db->query("SELECT * FROM `selftables_subtype`  ORDER BY `id` ASC")->result();
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
