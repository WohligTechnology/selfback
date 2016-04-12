<?php
if ( !defined( 'BASEPATH' ) )
	exit( 'No direct script access allowed' );
class User_model extends CI_Model
{
	protected $id,$username ,$password;
	public function validate($username,$password )
	{

		$password=md5($password);
		$query ="SELECT `user`.`id`,`user`.`name` as `name`,`email`,`user`.`accesslevel`,`accesslevel`.`name` as `access` FROM `user`
		INNER JOIN `accesslevel` ON `user`.`accesslevel` = `accesslevel`.`id`
		WHERE `email` LIKE '$username' AND `password` LIKE '$password' AND `accesslevel` IN (1,2) ";
		$row =$this->db->query( $query );

		if ( $row->num_rows() > 0 ) {
			$row=$row->row();
			$this->id       = $row->id;
			$this->name = $row->name;
			$this->email = $row->email;
			$newdata        = array(
				'id' => $this->id,
				'email' => $this->email,
				'name' => $this->name ,
				'accesslevel' => $row->accesslevel ,
				'logged_in' => 'true',
			);
			$this->session->set_userdata( $newdata );
			return true;
		} //count( $row_array ) == 1
		else
			return false;
	}


public function totalitemcart()
{
	  $userid = $this->session->userdata('id');
		if($userid=="")
		{
			  $qty= $this->cart->total_items();
				return $qty;
		}
		else {
$total = $this->db->query("SELECT SUM(`quantity`) as `qty` FROM `fynx_cart` WHERE `user` = '$userid'")->row();
return intval($total->qty);
		}
}


public function totalcart()
{
// 	  $userid = $this->session->userdata('id');
// 		if($userid=="")
// 		{
// 			  $total= $this->cart->total();
// 				return $total;
// 		}
// 		else {
// $total = $this->db->query("SELECT SUM(`fynx_product`.`price`*`fynx_cart`.`quantity`) as 'sum' FROM `fynx_product` LEFT OUTER JOIN `fynx_cart` ON `fynx_product`.`id`=`fynx_cart`.`product` WHERE `fynx_cart`.`user`='$userid' AND `fynx_cart`.`status`=0")->row();
// return intval($total->sum);
		// }
}

	public function create($name,$email,$password,$accesslevel,$status,$socialid,$logintype,$image,$json,$firstname,$lastname,$phone,$billingaddress,$billingcity,$billingstate,$billingcountry,$billingpincode,$billingcontact,$shippingaddress,$shippingcity,$shippingstate,$shippingcountry,$shippingpincode,$shippingcontact,$shippingname,$currency,$credit,$companyname,$registrationno,$vatnumber,$country,$fax,$gender,$billingline1,$billingline2,$billingline3,$shippingline1,$shippingline2,$shippingline3)
	{
		$data  = array(
			'name' => $name,
			'email' => $email,
			'password' =>md5($password),
			'accesslevel' => $accesslevel,
			'status' => $status,
            'socialid'=> $socialid,
            'image'=> $image,
            'json'=> $json,
			'firstname' => $firstname,
			'lastname' => $lastname,
			'phone' => $phone,
			'billingaddress' => $billingaddress,
			'billingcity' => $billingcity,
			'billingstate' => $billingstate,
			'billingcountry' => $billingcountry,
			'billingpincode' => $billingpincode,
			'billingcontact' => $billingcontact,
			'shippingaddress' => $shippingaddress,
			'shippingcity' => $shippingcity,
			'shippingstate' => $shippingstate,
			'shippingcountry' => $shippingcountry,
			'shippingpincode' => $shippingpincode,
			'shippingcontact' => $shippingcontact,
			'shippingname' => $shippingname,
			'currency' => $currency,
			'credit' => $credit,
			'companyname' => $companyname,
			'registrationno' => $registrationno,
			'vatnumber' => $vatnumber,
			'country' => $country,
			'fax' => $fax,
			'gender' => $gender,
            'billingline1' => $billingline1,
            'billingline2' => $billingline2,
            'billingline3' => $billingline3,
            'shippingline1' => $shippingline1,
            'shippingline2' => $shippingline2,
            'shippingline3' => $shippingline3
		);
		$query=$this->db->insert( 'user', $data );
		$id=$this->db->insert_id();

		if(!$query)
			return  0;
		else
			return  1;
	}

	function viewusers($startfrom,$totallength)
	{
		$user = $this->session->userdata('accesslevel');
		$query="SELECT DISTINCT `user`.`id` as `id`,`user`.`firstname` as `firstname`,`user`.`lastname` as `lastname`,`accesslevel`.`name` as `accesslevel`	,`user`.`email` as `email`,`user`.`contact` as `contact`,`user`.`status` as `status`,`user`.`accesslevel` as `access`
		FROM `user`
	   INNER JOIN `accesslevel` ON `user`.`accesslevel`=`accesslevel`.`id`  ";
	   $accesslevel=$this->session->userdata('accesslevel');
	   if($accesslevel==1)
		{
			$query .= " ";
		}
		else if($accesslevel==2)
		{
			$query .= " WHERE `user`.`accesslevel`> '$accesslevel' ";
		}

	   $query.=" ORDER BY `user`.`id` ASC LIMIT $startfrom,$totallength";
		$query=$this->db->query($query)->result();

        $return=new stdClass();
        $return->query=$query;
        $return->totalcount=$this->db->query("SELECT count(*) as `totalcount` FROM `user`
	   INNER JOIN `accesslevel` ON `user`.`accesslevel`=`accesslevel`.`id`  ")->row();
        $return->totalcount=$return->totalcount->totalcount;
		return $return;
	}
	public function beforeedit( $id )
	{
		$this->db->where( 'id', $id );
		$query=$this->db->get( 'user' )->row();
		return $query;
	}

	public function edit($id,$name,$email,$password,$accesslevel,$status,$socialid,$logintype,$image,$json,$firstname,$lastname,$phone,$billingaddress,$billingcity,$billingstate,$billingcountry,$billingpincode,$billingcontact,$shippingaddress,$shippingcity,$shippingstate,$shippingcountry,$shippingpincode,$shippingcontact,$shippingname,$currency,$credit,$companyname,$registrationno,$vatnumber,$country,$fax,$gender,$billingline1,$billingline2,$billingline3,$shippingline1,$shippingline2,$shippingline3)
	{
		$data  = array(
			'name' => $name,
			'email' => $email,
			'accesslevel' => $accesslevel,
			'status' => $status,
            'socialid'=> $socialid,
            'image'=> $image,
            'json'=> $json,
			'logintype' => $logintype,
            'firstname' => $firstname,
			'lastname' => $lastname,
			'phone' => $phone,
			'billingaddress' => $billingaddress,
			'billingcity' => $billingcity,
			'billingstate' => $billingstate,
			'billingcountry' => $billingcountry,
			'billingpincode' => $billingpincode,
			'billingcontact' => $billingcontact,
			'shippingaddress' => $shippingaddress,
			'shippingcity' => $shippingcity,
			'shippingstate' => $shippingstate,
			'shippingcountry' => $shippingcountry,
			'shippingpincode' => $shippingpincode,
			'shippingcontact' => $shippingcontact,
			'shippingname' => $shippingname,
			'currency' => $currency,
			'credit' => $credit,
			'companyname' => $companyname,
			'registrationno' => $registrationno,
			'vatnumber' => $vatnumber,
			'country' => $country,
			'fax' => $fax,
			'gender' => $gender,
            'billingline1' => $billingline1,
            'billingline2' => $billingline2,
            'billingline3' => $billingline3,
            'shippingline1' => $shippingline1,
            'shippingline2' => $shippingline2,
            'shippingline3' => $shippingline3
		);
		if($password != "")
			$data['password'] =md5($password);
		$this->db->where( 'id', $id );
		$query=$this->db->update( 'user', $data );

		return 1;
	}

	public function getuserimagebyid($id)
	{
		$query=$this->db->query("SELECT `image` FROM `user` WHERE `id`='$id'")->row();
		return $query;
	}
	function deleteuser($id)
	{
		$query=$this->db->query("DELETE FROM `user` WHERE `id`='$id'");
	}
	function changepassword($id,$password)
	{
		$data  = array(
			'password' =>md5($password),
		);
		$this->db->where('id',$id);
		$query=$this->db->update( 'user', $data );
		if(!$query)
			return  0;
		else
			return  1;
	}

    public function getuserdropdown()
	{
		$query=$this->db->query("SELECT * FROM `user`  ORDER BY `id` ASC")->result();
		$return=array(
		"" => ""
		);
		foreach($query as $row)
		{
			$return[$row->id]=$row->name;
		}

		return $return;
	}

	public function getaccesslevels()
	{
		$return=array();
		$query=$this->db->query("SELECT * FROM `accesslevel` ORDER BY `id` ASC")->result();
		$accesslevel=$this->session->userdata('accesslevel');
			foreach($query as $row)
			{
				if($accesslevel==1)
				{
					$return[$row->id]=$row->name;
				}
				else if($accesslevel==2)
				{
					if($row->id > $accesslevel)
					{
						$return[$row->id]=$row->name;
					}
				}
				else if($accesslevel==3)
				{
					if($row->id > $accesslevel)
					{
						$return[$row->id]=$row->name;
					}
				}
				else if($accesslevel==4)
				{
					if($row->id == $accesslevel)
					{
						$return[$row->id]=$row->name;
					}
				}
			}

		return $return;
	}
    public function getstatusdropdown()
	{
		$query=$this->db->query("SELECT * FROM `statuses`  ORDER BY `id` ASC")->result();
		$return=array(
		);
		foreach($query as $row)
		{
			$return[$row->id]=$row->name;
		}

		return $return;
	}

	public function getcategorydropdown()
{
	$query=$this->db->query("SELECT * FROM `fynx_category`  ORDER BY `id` ASC")->result();
	$return=array(
	);
	foreach($query as $row)
	{
		$return[$row->id]= $row->name;
	}

	return $return;
}

	function changestatus($id)
	{
		$query=$this->db->query("SELECT `status` FROM `user` WHERE `id`='$id'")->row();
		$status=$query->status;
		if($status==1)
		{
			$status=0;
		}
		else if($status==0)
		{
			$status=1;
		}
		$data  = array(
			'status' =>$status,
		);
		$this->db->where('id',$id);
		$query=$this->db->update( 'user', $data );
		if(!$query)
			return  0;
		else
			return  1;
	}
	function editaddress($id,$address,$city,$pincode)
	{
		$data  = array(
			'address' => $address,
			'city' => $city,
			'pincode' => $pincode,
		);

		$this->db->where( 'id', $id );
		$query=$this->db->update( 'user', $data );
		if($query)
		{
			$this->saveuserlog($id,'User Address Edited');
		}
		return 1;
	}

	function saveuserlog($id,$status)
	{
//		$fromuser = $this->session->userdata('id');
		$data2  = array(
			'onuser' => $id,
			'status' => $status
		);
		$query2=$this->db->insert( 'userlog', $data2 );
        $query=$this->db->query("UPDATE `user` SET `status`='$status' WHERE `id`='$user'");
	}
    function signup($email,$password)
    {
         $password=md5($password);
        $query=$this->db->query("SELECT `id` FROM `user` WHERE `email`='$email' ");
        if($query->num_rows == 0)
        {
            $this->db->query("INSERT INTO `user` (`id`, `firstname`, `lastname`, `password`, `email`, `website`, `description`, `eventinfo`, `contact`, `address`, `city`, `pincode`, `dob`, `accesslevel`, `timestamp`, `facebookuserid`, `newsletterstatus`, `status`,`logo`,`showwebsite`,`eventsheld`,`topeventlocation`) VALUES (NULL, NULL, NULL, '$password', '$email', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CURRENT_TIMESTAMP, NULL, NULL, NULL,NULL, NULL, NULL,NULL);");
            $user=$this->db->insert_id();
            $newdata = array(
                'email'     => $email,
                'password' => $password,
                'logged_in' => true,
                'id'=> $user
            );

            $this->session->set_userdata($newdata);

          //  $queryorganizer=$this->db->query("INSERT INTO `organizer`(`name`, `description`, `email`, `info`, `website`, `contact`, `user`) VALUES(NULL,NULL,NULL,NULL,NULL,NULL,'$user')");


           return $user;
        }
        else
         return false;


    }
    function login($email,$password)
    {
        $password=md5($password);
        $query=$this->db->query("SELECT `id` FROM `user` WHERE `email`='$email' AND `password`= '$password'");
        if($query->num_rows > 0)
        {
            $user=$query->row();
            $user=$user->id;


            $newdata = array(
                'email'     => $email,
                'password' => $password,
                'logged_in' => true,
                'id'=> $user
            );

            $this->session->set_userdata($newdata);
            //print_r($newdata);
            return $user;
        }
        else
        return false;


    }
    function authenticate() {
         $is_logged_in = $this->session->userdata( 'logged_in' );
//        return $is_logged_in;
        //print_r($this->session->userdata( 'logged_in' ));
        if ( $is_logged_in != true) {
            return false;
        } //$is_logged_in !== 'true' || !isset( $is_logged_in )
        else {
		$userid=$this->session->userdata('id');
		$query=$this->db->query("SELECT * FROM `user` WHERE `id`='$userid'")->row();
           // $userid = $this->session->userdata( );
         return $query;
        }
    }

    function frontendauthenticate($email,$password)
    {
        $query=$this->db->query("SELECT `id`, `name`, `email`, `accesslevel`, `timestamp`, `status`, `image`, `username`, `socialid`, `logintype`, `json` FROM `user` WHERE `email` LIKE '$email' AND `password`='$password' LIMIT 0,1");
        if ($query->num_rows() > 0)
        {
        	$query=$query->row();
            $data['user']=$query;
            $id=$query->id;
            $status=$query->status;
            if($status==3)
            {
//                $updatequery=$this->db->query("UPDATE `user` SET `status`=4 WHERE `id`='$id'");
                $status=4;
//                if($updatequery)
//                {
                    $this->saveuserlog($id,$status);
//                }
            }
            else if($status==1)
            {
                $status=2;
//                $updatequery=$this->db->query("UPDATE `user` SET `status`=2 WHERE `id`='$id'");
//                if($updatequery)
//                {
                    $this->saveuserlog($id,$status);
//                }
            }

        $query2=$this->db->query("SELECT `id`, `name`, `email`, `accesslevel`, `timestamp`, `status`, `image`, `username`, `socialid`, `logintype`, `json` FROM `user` WHERE `id`='$id' LIMIT 0,1")->row();

        $newdata        = array(
				'id' => $query2->id,
				'email' => $query2->email,
				'name' => $query2->name ,
				'accesslevel' => $query2->accesslevel ,
				'status' => $query2->status ,
				'logged_in' => 'true',
			);
			$this->session->set_userdata( $newdata );


            $accesslevel=$query->accesslevel;
            if($accesslevel==2)
            {
            $data['category']=$this->db->query("SELECT `id`,`categoryid`,`operatorid` FROM `operatorcategory` WHERE `operatorid`='$id'")->result();
            }
        	return $data;
        }
        else
        {
        	return false;
        }
    }

    function frontendregister($name,$email,$password,$socialid,$logintype,$json)
    {
        $data  = array(
			'name' => $name,
			'email' => $email,
			'password' =>md5($password),
			'accesslevel' => 3,
			'status' => 2,
            'socialid'=> $socialid,
            'json'=> $json,
			'logintype' => $logintype
		);
		$query=$this->db->insert( 'user', $data );
		$id=$this->db->insert_id();
        $queryselect=$this->db->query("SELECT * FROM `user` WHERE `id` LIKE '$id' LIMIT 0,1")->row();

        $accesslevel=$queryselect->accesslevel;
//        $queryselect=$query;
        $data1['user']=$queryselect;
        if($accesslevel==2)
        {
            $data1['category']=$this->db->query("SELECT `id`,`categoryid`,`operatorid` FROM `operatorcategory` WHERE `operatorid`='$id'")->result();
        }
        return $data1;
    }

	function getallinfoofuser($id)
	{
		$user = $this->session->userdata('accesslevel');
		$query="SELECT DISTINCT `user`.`id` as `id`,`user`.`firstname` as `firstname`,`user`.`lastname` as `lastname`,`accesslevel`.`name` as `accesslevel`	,`user`.`email` as `email`,`user`.`contact` as `contact`,`user`.`status` as `status`,`user`.`accesslevel` as `access`
		FROM `user`
	   INNER JOIN `accesslevel` ON `user`.`accesslevel`=`accesslevel`.`id`
       WHERE `user`.`id`='$id'";
		$query=$this->db->query($query)->row();
		return $query;
	}

	public function getlogintypedropdown()
	{
		$query=$this->db->query("SELECT * FROM `logintype`  ORDER BY `id` ASC")->result();
		$return=array(
		);
		foreach($query as $row)
		{
			$return[$row->id]=$row->name;
		}

		return $return;
	}
    public function getgenderdropdown()
	{
		$status= array(
			 "" => "Choose Gender",
			 "1" => "Male",
			 "2" => "Female"
			);
		return $status;
	}
	public function frontendlogout($user)
	{
        $query=$this->db->query("SELECT `id`, `name`, `email`, `accesslevel`, `timestamp`, `status`, `image`, `username`, `socialid`, `logintype`, `json` FROM `user` WHERE `id`='$user' LIMIT 0,1")->row();
        $status=$query->status;
        if($status==4)
        {
            $status=3;
//            $updatequery=$this->db->query("UPDATE `user` SET `status`=3 WHERE `id`='$user'");
//            if($updatequery)
//            {
                $this->saveuserlog($id,$status);
//            }
        }
        else if($status==2)
        {
            $status=1;
//            $updatequery=$this->db->query("UPDATE `user` SET `status`=1 WHERE `id`='$user'");
//            if($updatequery)
//            {
                $this->saveuserlog($id,$status);
//            }
        }
//        $updatequery=$this->db->query("UPDATE `user` SET `status`=5 WHERE `id`='$user'");

//        if(!$updatequery)
//            return 0;
//        else
//        {

		$this->session->sess_destroy();
            return 1;
//        }
	}

    function sociallogin($user_profile,$provider)
    {
        $query=$this->db->query("SELECT * FROM `user` WHERE `user`.`socialid`='$user_profile->identifier'");
        if($query->num_rows == 0)
        {

					$googleid="";
					$facebookid="";
					$twitterid="";
					switch($provider)
					{
						case "Google":
						$googleid=$user_profile->identifier;
						break;
						case "Facebook":
						$facebookid=$user_profile->identifier;
						break;
						case "Twitter":
						$twitterid=$user_profile->identifier;
						break;
					}

            $query2=$this->db->query("INSERT INTO `user` (`id`, `name`, `password`, `email`, `accesslevel`, `timestamp`, `status`, `image`, `username`, `socialid`, `logintype`, `json`, `dob`, `street`, `address`, `city`, `state`, `country`, `pincode`, `facebook`, `google`, `twitter`) VALUES (NULL, '$user_profile->displayName', '', '$user_profile->email', '3', CURRENT_TIMESTAMP, '1', '$user_profile->photoURL', '', '$user_profile->identifier', '$provider', '', '$user_profile->birthYear-$user_profile->birthMonth-$user_profile->birthDay', '', '$user_profile->address,$user_profile->region', '$user_profile->city', '', '$user_profile->country', '', '$facebookid', '$googleid', '$twitterid')");
            $id=$this->db->insert_id();
            $newdata = array(
                'email'     => $user_profile->email,
                'password' => "",
                'logged_in' => true,
                'id'=> $id,
                'name'=> $user_profile->displayName,
                'image'=> $user_profile->photoURL,
                'logintype'=>$provider
            );

            $this->session->set_userdata($newdata);

            return $newdata;
						// CART PART

$cartdata = $this->cart->contents();
if ($cartdata) {
	$newcart = array();
	foreach ($cartdata as $item) {
			array_push($newcart, $item);
	}
	foreach ($newcart as $cart) {
			$querycart = $this->db->query("INSERT INTO `fynx_cart`(`user`, `product`, `quantity`, `timestamp`, `json`,`design`) VALUES ('$id','".$cart['id']."','".$cart['qty']."',NULL,'".$cart['options']['json']."','".$cart['design']."')");
	}
}

// cart ends

        }
        else
        {
            $query=$query->row();
            $newdata = array(
                'email'     => $user_profile->email,
                'password' => "",
                'logged_in' => true,
                'id'=> $query->id,
                'name'=> $user_profile->displayName,
                'image'=> $user_profile->photoURL,
                'logintype'=>$provider
            );

            $this->session->set_userdata($newdata);

            return $newdata;
        }
    }
    function registeruser($firstname,$lastname,$email,$password)
    {
    	$newdata=0;
        $password=md5($password);
        //echo $email;
        $query=$this->db->query("SELECT `id` FROM `user` WHERE `email`='$email'");
				$num=$query->num_rows();

        if($num == 0)
        {
             $this->db->query("INSERT INTO `user`(`firstname`, `lastname`, `email`, `password`) VALUE('$firstname','$lastname','$email','$password')");
            $user=$this->db->insert_id();

            $newdata = array(
                    'id' => $user,
                    'email' => $email,
                    'firstname' => $firstname,
                    'lastname' => $lastname,
                    'logged_in' => 'true'
            );

            $this->session->set_userdata($newdata);


        }
        else
        {
						$newdata=false;

				}
        return $newdata;

    }
      function loginuser($email,$password)
    {
        $password=md5($password);
      //  $query=$this->db->query("SELECT `id`,`firstname`,`lastname`,`username`,`name` FROM `user` WHERE `email`='$email' AND `password`= '$password'");
			$query=$this->db->query("SELECT `id`, `name`, `email`, `accesslevel`, `timestamp`, `status`, `image`, `username`, `socialid`, `logintype`, `json`, `firstname`, `lastname`, `phone`, `billingaddress`, `billingcity`, `billingstate`, `billingcountry`, `billingcontact`, `billingpincode`, `shippingaddress`, `shippingcity`, `shippingcountry`, `shippingstate`, `shippingpincode`, `shippingname`, `shippingcontact`, `currency`, `credit`, `companyname`, `registrationno`, `vatnumber`, `country`, `fax`, `gender`, `facebook`, `google`, `twitter`, `street`, `address`, `pincode`, `state`, `dob`, `city`, `billingline1`, `billingline2`, `billingline3`, `shippingline1`, `shippingline2`, `shippingline3` FROM `user` WHERE `email`='$email' AND `password`= '$password'");

				if($query->num_rows > 0)
        {
            $user=$query->row_array();
						$userid = $user['id'];
												// CART PART

					$cartdata = $this->cart->contents();
					if ($cartdata) {
							$newcart = array();
							foreach ($cartdata as $item) {
									array_push($newcart, $item);
							}
							foreach ($newcart as $cart) {
							$querycart = $this->db->query("INSERT INTO `fynx_cart`(`user`, `product`, `quantity`, `timestamp`, `json`,`design`,`status`) VALUES ('$userid','".$cart['id']."','".$cart['qty']."',NULL,'".$cart['options']['json']."','".$cart['design']."','".$cart['options']['status']."')");

							}
					}

					// cart ends

					            $this->session->set_userdata($user);

            return $user;
        }
        else

				$object = new stdClass();
				$object->value = false;
			return $object;
    }
    function addToCart($product, $quantity, $design,$json)
    {
        //$data=$this->cart->contents();

        $getexactproduct=$this->db->query("SELECT * FROM `fynx_product` WHERE `id`='$product'")->row();

        $size=$getexactproduct->size;
        $productname=$getexactproduct->name;
        $price=$getexactproduct->price;
        $color=$getexactproduct->color;
        $image=$getexactproduct->image1;
        $exactproduct=$getexactproduct->id;
        $getsize=$this->db->query("SELECT `id`, `status`, `name` FROM `fynx_size` WHERE `id`='$size'")->row();
        $sizeid=$getsize->id;
        $sizename=$getsize->name;
        $getcolor=$this->db->query("SELECT `id`, `name`, `status`, `timestamp` FROM `fynx_color` WHERE `id`='$color'")->row();
        $colorid=$getcolor->id;
        $colorname=$getcolor->name;
				if($design!=''){
        $getdesign=$this->db->query("SELECT `id`, `designer`, `image`, `status`,`name`, `timestamp` FROM `fynx_designs` WHERE `id`='$design'")->row();
        $designid=$getdesign->id;
        $designer=$getdesign->designer;
        $designimage=$getdesign->image;
        $designname=$getdesign->name;
				$data = array(
               'id'      => $exactproduct,
               'name'      => '1',
               'qty'     => $quantity,
               'price'   => $price,
							 'design'   => $design,
               'image'   => $image,

              	'options' =>array(
                    'realname' => $designname,
                    // 'sizeid' => $sizeid,
                    // 'colorid' => $colorid,
                    // 'sizename' => $sizename,
                    // 'colorname' => $colorname,
                    // 'designid' => $designid,
                    // 'designer' => $designer,
                    // 'designimage' => $designimage,
                     'json' => $json
                )
        );
			}else{

        $data = array(
               'id'      => $exactproduct,
               'name'      => '1',
               'qty'     => $quantity,
               'price'   => $price,
							 'design'   => $design,
               'image'   => $image,

              	'options' =>array(
                    'realname' => $designname,
                    // 'sizeid' => $sizeid,
                    // 'colorid' => $colorid,
                    // 'sizename' => $sizename,
                    // 'colorname' => $colorname,
                    // 'designid' => "",
                    // 'designer' => "",
                    // 'designimage' => "",
                     'json' => $json
                )
        );
			}
        $userid=$this->session->userdata('id');
            //CHECK IF PRODUCT ALREADY THERE IN CART
            $checkcart=$this->db->query("SELECT * FROM `fynx_cart` WHERE `user`='$userid' AND `product`='$exactproduct' AND `design` = '$design' AND `json` = '$json'");
         if ( $checkcart->num_rows() > 0 )
         {
             $checkcart=$this->db->query("UPDATE `fynx_cart` SET `quantity` = `quantity`+ $quantity WHERE `user`='$userid' AND `product`='$exactproduct'  AND `design` = '$design' AND `json` = '$json' ");
              $returnval=$this->cart->insert($data);
             return true;
         }else
            {
                    if($userid=="")
                    {
                        $returnval=$this->cart->insert($data);
                        if(!empty($returnval)){
                        return true;
                        }
                        else{
                        return false;
                        }
                    }
                    else
                    {
                        $query=$this->db->query("INSERT INTO `fynx_cart`(`user`, `product`, `quantity`, `timestamp`,`design`,`json`) VALUES ('$userid','$exactproduct','$quantity',NULL,'$design','$json')");
                        $this->cart->insert($data);
                        if($query)
                        return true;
                        else
                        return false;
                    }
            }

    }


public function showCart($user)
{

$query1=$this->db->query("SELECT `fynx_cart`.`user`,`fynx_cart`.`product` as `id`,`fynx_cart`.`quantity` as `qty`, `plans`.`price_in_INR` AS 'price',`plans`.`price_in_dollars` AS 'dollarprice',`plans`.`price_in_INR` as `subtotal`,`plans`.`price_in_dollars` AS 'dollarsubtotal',`fynx_cart`.`status`,  `plans`.`plan`,`selftables_subtype`.`name` as `subtype`,`selftables_healthpackages`.`months` FROM
 `fynx_cart` LEFT OUTER JOIN `plans` ON `plans`.`id`=`fynx_cart`.`product` LEFT OUTER JOIN `selftables_healthpackages` ON `plans`.`packageid`=`selftables_healthpackages`.`id` LEFT OUTER JOIN `selftables_subtype`ON `selftables_healthpackages`.`subtype`=`selftables_subtype`.`id`
		 WHERE `fynx_cart`.`user`='$user' AND `fynx_cart`.`status`=3")->result_array();



$query=$this->db->query("SELECT `fynx_cart`.`user`,`fynx_cart`.`status`,`fynx_product`.`name` as `name`, `fynx_cart`.`quantity` as `qty`, `fynx_product`.`price`*`fynx_cart`.`quantity` as `subtotal` ,`fynx_cart`.`product` as `id`, `fynx_product`.`price`,`fynx_product`.`image1` as 'image' FROM `fynx_cart`
                INNER JOIN `fynx_product` ON `fynx_product`.`id`=`fynx_cart`.`product`
                WHERE `fynx_cart`.`user`='$user' AND `fynx_cart`.`status`=1")->result_array();
for($i=0;$i<count($query);$i++)
{
	$query[$i]["options"] = new stdClass();
	$query[$i]["options"]->realname = $query[$i]["name"];

}
						return array_merge($query1,$query);


 }


 function getidbyemail($email)
 {
	 $query = $this->db->query("SELECT `id`,`firstname`,`lastname` FROM `user`
	 WHERE `email`='$email'")->row();

			 return $query;

 }


		function forgotpasswordsubmit($hashcode,$password)
		{
				$normalfromhash=base64_decode ($hashcode);
				$returnvalue=explode("&",$normalfromhash);


				$userid=$returnvalue[0];
				$password=md5($password);


				$query=$this->db->query("UPDATE `user` SET `password`='$password' WHERE `id`='$userid'");

        $getemailbyid=$this->db->query("SELECT `email`,`name` FROM `user` WHERE `id`='$userid'")->row();
        $email=$getemailbyid->email;
        $name=$getemailbyid->name;

				$data['name']=$name;
				$viewcontent = $this->load->view('emailers/forgotpasswordsubmit', $data, true);
				$this->email_model->emailer($viewcontent,'Password changed Successfully',$email,$username);

	 if(!$query)
		 return  0;
	 else
		 return  1;
		}


    function deletecartfromdb($id,$user,$design){
		//	echo "DELETE FROM `fynx_cart` WHERE `product`='$id' AND `user`='$user' AND `design`='$design'";
    $query=$this->db->query("DELETE FROM `fynx_cart` WHERE `product`='$id' AND `user`='$user' AND `design`='$design'");
    }
     public function uploadImage(){
        $config['upload_path'] = './uploads/';
        $config['allowed_types'] = 'gif|jpg|png|jpeg';
        $this->load->library('upload', $config);
        $filename="image";
        $image="";
        if (  $this->upload->do_upload($filename))
        {
            $uploaddata = $this->upload->data();
            $image=$uploaddata['file_name'];
            $imagename=$image;

        }
         $image = $imagename;
        return $image;

    }


function testmail()
{
$firstname ="vinod";
$lastname ="beloshe";
		$message = "<html><body><div id=':1fn' class='a3s adM' style='overflow: hidden;'><div class='HOEnZb'><div class='adm'><div id='q_152da6db6beee01c_0' class='ajR h4' data-tooltip='Hide expanded content' aria-label='Hide expanded content'><div class='ajT'></div></div></div><div class='im'><u></u>
		<div style='margin:0'>

		<u></u>
		<div style='margin:0 auto;width:90%'>
		<div style='margin:50px auto;width:80%'>
		<div style='text-align:center' align='center'>
		 <img src='http://selfcareindia.com/img/logo.png' alt='Selfcare' class='CToWUd'>
		</div>
		<p style='color:#000;font-family:Roboto;font-size:20px'>Dear <span style='color:#000;font-family:Roboto;font-size:20px'>$firstname $lastname</span>,</p>
		<p style='color:#000;font-family:Roboto;font-size:20px'>Thank You for shopping with SelfCare. You've picked up some really healthy and amazing stuff and we can't wait to have it delivered at your doorstep. Here's what you ordered:
		</p>
		<p style='color:#000;font-family:Roboto;font-size:20px'>
		<table style='width:100%'>
		<thead style='background:#c2a388;color:#3b1808'>
		<tr>
		<th style='font-size:14px;padding:10px;text-transform:uppercase'>Products</th>
		<th style='font-size:14px;padding:10px;text-transform:uppercase'>SKU</th>
		<th style='font-size:14px;padding:10px;text-transform:uppercase'>Price</th>
		<th style='font-size:14px;padding:10px;text-transform:uppercase'>Qty</th>
		<th style='font-size:14px;padding:10px;text-transform:uppercase'>Tax</th>
		<th style='font-size:14px;padding:10px;text-transform:uppercase'>Subtotal</th>
		</tr></thead>
		<tbody>
		";
		$newcart =  array();
		$q="SELECT `fynx_orderitem`.`order`,`fynx_orderitem`.`product`,`fynx_product`.`name`,`fynx_product`.`image1`,`fynx_product`.`sku`, `fynx_orderitem`.`quantity`,`fynx_orderitem`.`price`,`fynx_orderitem`.`status`,`fynx_orderitem`.`discount`,`fynx_orderitem`.`finalprice` FROM `fynx_orderitem`
		INNER JOIN `fynx_order` ON `fynx_order`.`id`=`fynx_orderitem`.`order`
		INNER JOIN `fynx_product` ON `fynx_product`.`id`=`fynx_orderitem`.`product` WHERE `fynx_orderitem`.`order`='28' AND `fynx_orderitem`.`status`!=3";
		$productquery = $this->db->query($q)->result();


		$planquery=$this->db->query("SELECT `plans`.`id`,`plans`.`plan`,`selftables_subtype`.`name` AS 'subtype',`selftables_healthpackages`.`months` ,`fynx_orderitem`.`quantity`,`fynx_orderitem`.`price`,`fynx_orderitem`.`finalprice` FROM `fynx_orderitem`  LEFT OUTER JOIN `plans` ON `plans`.`id`=`fynx_orderitem`.`product` LEFT OUTER JOIN `selftables_healthpackages` ON `plans`.`packageid`=`selftables_healthpackages`.`id` LEFT OUTER JOIN `selftables_subtype`ON `selftables_healthpackages`.`subtype`=`selftables_subtype`.`id` WHERE `fynx_orderitem`.`order`= '28' AND `fynx_orderitem`.`status`=3
		" )->result();


		$counter=1;
		$finalpricetotal=0;
		foreach($planquery as $value)
		{
		$plan = $value->plan;
		if ($plan == 1) {
		$plan = 'Silver Plan';
		}
		if ($plan == 2) {
		$plan = 'Gold Plan';
		}
		if ($plan == 3) {
		$plan = 'Platinum Plan';
		}
		if ($plan == 4) {
		$plan = 'Diamond Plan';
		}
		if($value->months == 1)
		{
		$months = $value->months." Month";
		}
		else
		{
		$months = $value->months." Months";
		}

		$name = $months." ".$plan;
		$oprice = $value->price / 1.145;
		$ovat = $value->price - $oprice;
		$sku =$value->sku;
		$qty =$value->quantity;
		$price = number_format($oprice,2);
		$vat =number_format($ovat,2);
		$total = number_format($value->finalprice,2);

		$message .= "

		<tr>
		 <td style='text-align:center' align='center'>
		$name
		</td>
		<td style='text-align:center' align='center'>$sku</td>
		<td style='text-align:center' align='center'>$price</td>
		<td style='text-align:center' align='center'>$qty</td>
		<td style='text-align:center' align='center'>$vat</td>
		<td style='text-align:center' align='center'>$total</td>
		</tr>";
		$finalpricetotal1=$finalpricetotal1+$value->finalprice;
		$totalvat1 = $totalvat1+$ovat;
		}

		foreach($productquery as $value)
		{
		$name = $value->name;
		$image = $value->image1;
		$oprice = $value->price / 1.05;
		$ovat = $value->price - $oprice;
		$sku =$value->sku;
		$qty =$value->quantity;
		$price = number_format($oprice,2);
		$vat =number_format($ovat,2);
		$total = number_format($value->finalprice,2);

		$message .= "

		<tr>
		<td style='text-align:center' align='center'>

		<img src='http://admin.selfcareindia.com/uploads/$image' alt='' width='70' style='border-radius:100%'>
		<figcaption>$name</figcaption>
		</figure>


		</td>
		<td style='text-align:center' align='center'>$sku</td>
		<td style='text-align:center' align='center'>$price</td>
		<td style='text-align:center' align='center'>$qty</td>
		<td style='text-align:center' align='center'>$vat</td>
		<td style='text-align:center' align='center'>$total</td>
		</tr>";
		$finalpricetotal2=$finalpricetotal2+$value->finalprice;
		$totalvat2 = $totalvat2+$ovat;

		}


		$finalpricetotal= $finalpricetotal1 + $finalpricetotal2;
		$finalt= number_format($finalpricetotal,2);
		$message .= "

		</tbody>
		</table>  <div style='background:#c2a388;color:#3b1808;width:100%'>
		<p style='color:#000;font-family:Roboto;font-size:20px;margin:0;padding:10px 20px;text-align:right' align='right'>Grand Total<span style='color:#000;display:inline-block;font-family:Roboto;font-size:20px;margin-left:10px'>$finalt </span></p>
		</div></p>

		<p style='color:#000;font-family:Roboto;font-size:20px'>In case you have any queries regarding your package, please call us on +912261312222 or leave us a mail on info@selfcareindia.com

		</p>

		<span style='color:#000;font-family:Roboto;font-size:20px'>Thank You,</span>
		<span style='color:#000;display:block;font-family:Roboto;font-size:20px'>Team Selfcare !</span>
		</div>
		</div>
		<u></u>
		<footer style='background:#e96542;padding:10px 0'>
		<div style='margin:0 auto;width:90%'>
		<div>
		<table>
		<tbody><tr>
		<td style='padding:0 15px'><div>
		<span style='color:#ffd8ce;font-family:Roboto;font-size:14px'>COPYRIGHT@SELFCARE2016</span>
		</div></td>
		<td style='padding:0 15px'><div>
		 <span style='color:#ffd8ce;font-family:Roboto;font-size:14px'>CONTACT US<a href='tel:+912261312222' style='color:#ffd8ce;font-family:Roboto;font-size:14px;margin:0px 10px;text-decoration:none' target='_blank'>+91 22 6131 2222</a></span>
		</div></td>
		<td style='padding:0 15px;vertical-align:middle' valign='middle'>
		 <div>
		 <span style='color:#ffd8ce;display:block;font-family:Roboto;font-size:14px'>FOLLOW US ON</span>
		 <a href='https://www.facebook.com/selfcarebysuman' style='color:#ffd8ce;display:inline-block;font-family:Roboto;font-size:18px;margin:3px 5px 0 0' target='_blank'><img src='http://selfcareindia.com/img/selfcare-facebook.png' alt='Facebook' width='20' class='CToWUd'></a>
		 <a href='https://twitter.com/selfcarebysuman' style='color:#ffd8ce;display:inline-block;font-family:Roboto;font-size:18px;margin:3px 5px 0 0' target='_blank'><img src='http://selfcareindia.com/img/selfcare-twitter.png' alt='Twitter' width='20' class='CToWUd'></a>
		 <a href='https://www.instagram.com/selfcarebysuman' style='color:#ffd8ce;display:inline-block;font-family:Roboto;font-size:18px;margin:3px 5px 0 0' target='_blank'><img src='http://selfcareindia.com/img/selfcare-insta.png' alt='Instagram' width='20' class='CToWUd'></a>
		 <a href='https://www.youtube.com/channel/UCVqKgmC6eaMrgPyXoOcOz2A' style='color:#ffd8ce;display:inline-block;font-family:Roboto;font-size:18px;margin:3px 5px 0 0' target='_blank'><img src='http://selfcareindia.com/img/selfcare-youtube.png' alt='Youtube' width='20' class='CToWUd'></a>
		</div>
		</td>
		</tr>
		</tbody></table>
		</div>
		</div>
		</footer>
		</div>
	</div></div></div></body></html>";


		$this->email_model->emailer($message,'Your Order Confirmation',$email,$username);


}

}
?>
