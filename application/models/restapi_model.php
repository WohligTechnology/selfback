<?php
if ( !defined( 'BASEPATH' ) )
	exit( 'No direct script access allowed' );
class restapi_model extends CI_Model
{

    public function subscribe($email){
        $query1=$this->db->query("SELECT * FROM `subscribe` WHERE `email`='$email'");
        $num=$query1->num_rows();
        if($num>0)
        {
        $object = new stdClass();
				$object->value = false;
				$object->comment = 'already exists';
			 return $object;
        }
        else{
        $this->db->query("INSERT INTO `subscribe`(`email`) VALUE('$email')");
        $id=$this->db->insert_id();

        $object = new stdClass();
				$object->value = true;
        return $object;
              }
    }


		public function askSumanSubmit($category,$name,$email,$question){

        $this->db->query("INSERT INTO `asksuman`(`category`,`name`,`email`,`question`) VALUE('$category','$name','$email','$question')");
        $object = new stdClass();
				$object->value = true;
        return $object;

    }


		public function commentSubmit($blogid,$name,$email,$website,$comment){

				$this->db->query("INSERT INTO `selftables_comment`(`blog`,`name`,`email`,`website`,`comment`) VALUE('$blogid','$name','$email','$website','$comment')");
				$object = new stdClass();
				$object->value = true;
				return $object;

		}


		public function contactSubmit($firstname,$lastname,$mobile,$email,$message){

				$this->db->query("INSERT INTO `contact`(`firstname`,`lastname`,`telephone`,`email`,`comment`) VALUE('$firstname','$lastname','$mobile','$email','$message')");
				$object = new stdClass();
				$object->value = true;
				return $object;

		}


		function getTestimonial()
		{
				$query=$this->db->query("SELECT `name`, `location`, `weight`, `description` FROM `testimonial`")->result();
				if($query)
				{
					 return $query;
				}
				else
				{
						$object = new stdClass();
						$object->value = false;
						return $object;
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
					$this->db->query("INSERT INTO `user`(`firstname`, `lastname`, `email`, `password`,`accesslevel`,`status`) VALUE('$firstname','$lastname','$email','$password','3','2')");
				 $user=$this->db->insert_id();

				 $newdata = array(
								 'id' => $user,
								 'email' => $email,
								 'firstname' => $firstname,
								 'lastname' => $lastname,
								 'logged_in' => 'true'
				 );

				 $this->session->set_userdata($newdata);
				 $getuser=$this->db->query("SELECT `id`, `name`, `email`, `accesslevel`, `timestamp`, `status`, `image`, `username`, `socialid`, `logintype`, `json`, `firstname`, `lastname`, `phone`, `billingaddress`, `billingcity`, `billingstate`, `billingcountry`, `billingcontact`, `billingpincode`, `shippingaddress`, `shippingcity`, `shippingcountry`, `shippingstate`, `shippingpincode`, `shippingname`, `shippingcontact`, `currency`, `credit`, `companyname`, `registrationno`, `vatnumber`, `country`, `fax`, `gender`, `facebook`, `google`, `twitter`, `street`, `address`, `pincode`, `state`, `dob`, `city` FROM `user` WHERE `id`='$user'")->row();

					$object=$getuser;
		 }
		 else
		 {
				 $object = new stdClass();
				 $object->value = false;
				 $object->comment = 'Email already exists.';

		 }
		 return $object;

 }




    public function getallcategory(){
    $query=$this->db->query("SELECT `id`, `name`, `parent`, `status`, `order`, `image1`, `image2` FROM `category` WHERE `parent`=0")->result();
        return $query;
    }
     public function gethomecontent(){
    $query=$this->db->query("SELECT `id`, `name`, `link` as `url`, `target`, `status`, `image` as `src`, `template`, `class`, `text`, `centeralign` as `centerAlign` FROM `fynx_homeslide` WHERE `status`=1")->result();
        return $query;
    }
    public function getorderbyorderid($id){
    $query=$this->db->query("SELECT `transactionid` FROM `fynx_order` WHERE `id`='$id'")->row();
    $query->amount=$this->db->query("SELECT SUM(`finalprice`) as `amount` FROM `fynx_orderitem` WHERE `order`='$id'")->row();
        return $query;
    }


		public function getorders($userid){
if(empty($userid))
{
//echo "NO users found";
}
else {

	  $return->plans = $this->db->query("select `id` from `fynx_order` where `user`=$userid" )->result();

		foreach($return->plans  as $plan)
			{
				$q="SELECT `fynx_orderitem`.`order`,`fynx_product`.`name`,`fynx_product`.`image1` as 'image' ,`fynx_orderitem`.`quantity`,`fynx_orderitem`.`price` FROM `fynx_orderitem` LEFT OUTER JOIN `fynx_product` ON `fynx_orderitem`.`product`=`fynx_product`.`id`  WHERE `fynx_orderitem`.`order`= '$plan->id' ";
				//echo $q;
					$plan->products = $this->db->query($q)->result();
				}

	// $query=$this->db->query("SELECT `fynx_orderitem`.`order`,`fynx_product`.`name`,`fynx_orderitem`.`quantity`,`fynx_orderitem`.`price` FROM `fynx_orderitem` LEFT OUTER JOIN `fynx_product` ON `fynx_orderitem`.`product`=`fynx_product`.`id` LEFT OUTER JOIN `fynx_order` ON `fynx_orderitem`.`order`=`fynx_order`.`id` WHERE `fynx_order`.`user`=$userid")->result();
	// $query->amount=$this->db->query("SELECT SUM(`finalprice`) as `amount` FROM `fynx_orderitem`")->result();
			  return $return;
}

		}

// SELECT `fynx_orderitem`.`order`,`fynx_product`.`name`,`fynx_orderitem`.`quantity`,`fynx_orderitem`.`price` FROM `fynx_orderitem` LEFT OUTER JOIN `fynx_product` ON `fynx_orderitem`.`product`=`fynx_product`.`id` LEFT OUTER JOIN `fynx_order` ON `fynx_orderitem`.`order`=`fynx_order`.`id`


    public function getUserDetails($user){
    $query=$this->db->query("SELECT `id`, `name`, `password`, `email`, `accesslevel`, `timestamp`, `status`, `image`, `username`, `socialid`, `logintype`, `json`, `firstname`, `lastname`, `phone`, `billingaddress`, `billingcity`, `billingstate`, `billingcountry`, `billingcontact`, `billingpincode`, `shippingaddress`, `shippingcity`, `shippingcountry`, `shippingstate`, `shippingpincode`, `shippingname`, `shippingcontact`, `currency`, `credit`, `companyname`, `registrationno`, `vatnumber`, `country`, `fax`, `gender`, `facebook`, `google`, `twitter`, `street`, `address`, `pincode`, `state`, `dob`, `city`, `billingline1`, `billingline2`, `shippingline1`, `shippingline2`, `billingline3`, `shippingline3` FROM `user` WHERE `id`=$user")->row();
        return $query;
    }
    public function getSubCategoryProductHome($id){
    $query['subcategorynames']=$this->db->query("SELECT `homecategoryproduct`.`id`, `homecategoryproduct`.`subcategory`,`subcategory`.`name` FROM `homecategoryproduct` LEFT OUTER JOIN `subcategory` ON `subcategory`.`id`=`homecategoryproduct`.`subcategory` GROUP BY `homecategoryproduct`.`subcategory`")->result();
        $query1=$this->db->query("SELECT `product` FROM `homecategoryproduct` WHERE `subcategory`=$id")->result();
        $productids="(";
            foreach($query1 as $key=>$value){
//            $catid=$row->id;
                if($key==0)
                {
                    $productids.=$value->product;
                }
                else
                {
                    $productids.=",".$value->product;
                }
            }
            $productids.=")";
        if($productids=="()"){
        $productids="(0)";
        }
        $query['product']=$this->db->query("SELECT `id`, `name`, `sku`, `description`, `url`, `visibility`, `price`, `wholesaleprice`, `firstsaleprice`, `secondsaleprice`, `specialpriceto`, `specialpricefrom`, `metatitle`, `metadesc`, `metakeyword`, `quantity`, `status`, `modelnumber`, `brandcolor`, `eanorupc`, `eanorupcmeasuringunits`, `type`, `compatibledevice`, `compatiblewith`, `material`, `color`, `design`, `width`, `height`, `depth`, `portsize`, `packof`, `salespackage`, `keyfeatures`, `videourl`, `modelname`, `finish`, `weight`, `domesticwarranty`, `domesticwarrantymeasuringunits`, `internationalwarranty`, `internationalwarrantymeasuringunits`, `warrantysummary`, `warrantyservicetype`, `coveredinwarranty`, `notcoveredinwarranty`, `size`, `typename`, `subcategory`, `category` FROM `product` WHERE `id` IN $productids")->result();
        return $query;
    }

    public function getFilters($catid)
    {
       $query['color']=$this->db->query("SELECT DISTINCT  `fynx_color`.`id`,`fynx_color`.`name` FROM `fynx_product`
       LEFT OUTER JOIN `fynx_color` ON `fynx_color`.`id`=`fynx_product`.`color`
       WHERE `fynx_product`.`category`='$catid'")->result();

        $query['type']=$this->db->query("SELECT DISTINCT  `fynx_type`.`id`,`fynx_type`.`name` FROM `fynx_product`
       LEFT OUTER JOIN `fynx_type` ON `fynx_type`.`id`=`fynx_product`.`type`
       WHERE `fynx_product`.`category`='$catid' AND `fynx_type`.`status`=2")->result();

        $query['size']=$this->db->query("SELECT DISTINCT  `fynx_size`.`id`,`fynx_size`.`name` FROM `fynx_product`
       LEFT OUTER JOIN `fynx_size` ON `fynx_size`.`id`=`fynx_product`.`size`
       WHERE `fynx_product`.`category`='$catid' AND `fynx_size`.`status`=2")->result();

        $query['subcategory']=$this->db->query("SELECT DISTINCT  `fynx_subcategory`.`id`,`fynx_subcategory`.`name` FROM `fynx_product`
       LEFT OUTER JOIN `fynx_subcategory` ON `fynx_subcategory`.`id`=`fynx_product`.`subcategory`
       WHERE `fynx_product`.`category`='$catid' AND `fynx_subcategory`.`status`=2 AND `fynx_subcategory`.`category`='$catid'")->result();

      return $query;
    }
    public function removeFromWishlist($user, $product,$design){
        $query=$this->db->query(" DELETE FROM `fynx_wishlist` WHERE `user`='$user' AND `product`='$product' AND `design`='$design'");
        if($query){
        return 1;
        }
        else{
        return false;
        }
    }
    public function getAllSize(){
        $query=$this->db->query("SELECT `id`, `status`, `name` FROM `fynx_size` WHERE 1")->result();
        return $query;

    }

		public function getFiltersLater ($query) {
			$query2 = " SELECT `id` FROM ($query) as `tab1` ";
			$query3['subcategory'] = $this->db->query(" SELECT DISTINCT `fynx_subcategory`.`name`,`fynx_subcategory`.`id`,`fynx_subcategory`.`order` FROM `fynx_product` INNER JOIN `fynx_subcategory` ON `fynx_product`.`subcategory` = `fynx_subcategory`.`id` WHERE `fynx_product`.`id` IN ($query2) " )->result();


			return $query3;
		}
    public function updateProfile($user,$firstname,$lastname,$email,$phone,$billingline1,$billingline2,$billingline3,$billingcity,$billingstate,$billingcountry,$billingpincode,$shippingline1,$shippingline2,$shippingline3,$shippingcity,$shippingstate,$shippingpincode,$shippingcountry){
        $data  = array(
			'firstname' => $firstname,
			'lastname' => $lastname,
			'email' => $email,

			'phone' => $phone,

			'billingcity' => $billingcity,
			'billingstate' => $billingstate,
			'billingcountry' => $billingcountry,
			'billingpincode' => $billingpincode,
			'shippingcity' => $shippingcity,
			'shippingstate' => $shippingstate,
			'shippingcountry' => $shippingcountry,
			'shippingpincode' => $shippingpincode,
            'billingline1' => $billingline1,
            'billingline2' => $billingline2,
            'billingline3' => $billingline3,
            'shippingline1' => $shippingline1,
            'shippingline2' => $shippingline2,
            'shippingline3' => $shippingline3
		);

		$this->db->where( 'id', $user );
		$query=$this->db->update( 'user', $data );

        $useridquery = $this->db->query("SELECT `id`, `firstname`,`lastname`,`email`, `phone`, `billingaddress`, `billingcity`, `billingstate`, `billingcountry`, `billingcontact`, `billingpincode`, `shippingaddress`, `shippingcity`, `shippingcountry`, `shippingstate`, `shippingpincode`, `shippingname`, `shippingcontact`,  `billingline1`, `billingline2`, `shippingline1`, `shippingline2`, `billingline3`, `shippingline3` FROM `user` WHERE `id`='$user'")->row();
        return $useridquery;
    }

		function addToCart($product, $quantity, $json,$status)
{
		if($status==2)
		{
					$getexactproduct=$this->db->query("SELECT * FROM `plans` WHERE `id`='$product'")->row();
	$exactproduct=$getexactproduct->id;
	$price=$getexactproduct->price_in_INR;
		$productname=$getexactproduct->plan;
	//$price=floatval($price);


	$data = array(
				 'id'      => $exactproduct,
				 'name'      => 1,
				 'qty'     => 1,
	 			'price'   => $price,
				 'image'   => 0,
					'options' =>array(
							'status' => $status,
							'realname' => $productname,
					)
	);




		}
		else {
			$getexactproduct=$this->db->query("SELECT * FROM `fynx_product` WHERE `id`='$product'")->row();
			$size=$getexactproduct->size;
			$stockquantity=$getexactproduct->quantity;
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
			$data = array(
						 'id'      => $exactproduct,
						 'name'      => '1',
						 'qty'     => $quantity,
						 'price'   => $price,
						 'image'   => $image,
							'options' =>array(
									'realname' => $productname,
							)
			);
		}




		$userid=$this->session->userdata('id');


			if (empty($userid))
								{


												$this->cart->insert($data);
								$returnval=$this->cart->insert($data);

								if(!empty($returnval)){

									 $object = new stdClass();
								 $object->value = true;
								 return $object;
								}
								else{

								$object->value = false;
								$object->comment = 'Internal Server Error';
								return $object;
								}
								}
				else{
						// USER ID IS PRESENT

						if($status==1)
						{

								//PRODUCT DETAIL
															//CHECK IF PRODUCT ALREADY THERE IN CART
								$checkcart=$this->db->query("SELECT * FROM `fynx_cart` WHERE `user`='$userid' AND `product`='$exactproduct' and `status`=0");
								 if ( $checkcart->num_rows() > 0 )
								 {
										 //already in cart
												 $object = new stdClass();
												 $object->value = false;
												 $object->comment = 'already in cart';
												 return $object;
								 }
								else{

									if($quantity > $stockquantity)
									{
											 $object = new stdClass();
											 $object->value = false;
											 $object->comment = 'quantity not available ';
											return $object;
									}

										else
										{// INSERT PRODUCT IN CART
												$query=$this->db->query("INSERT INTO `fynx_cart`(`user`, `product`, `quantity`, `timestamp`,`design`) VALUES ('$userid','$exactproduct','$quantity',NULL,'$design')");
										$this->cart->insert($data);
										if($query){
												 $object = new stdClass();
												 $object->value = true;
												return $object;
												}
										else{
												$object = new stdClass();
												 $object->value = false;
												 $object->comment = 'Internal Server Error';
												return $object;
												}
											}
								}
						}


						if($status==2)
						{

								//PRODUCT DETAIL
															//CHECK IF PRODUCT ALREADY THERE IN CART
								$checkcart=$this->db->query("SELECT * FROM `fynx_cart` WHERE `user`='$userid' AND `product`='$exactproduct'  and `status`=2");
								 if ( $checkcart->num_rows() > 0 )
								 {
										 //already in cart
												 $object = new stdClass();
												 $object->value = false;
												 $object->comment = 'already in cart';
												 return $object;
								 }
								else{

								// INSERT PRODUCT IN CART
												$query=$this->db->query("INSERT INTO `fynx_cart`(`user`, `product`, `status`, `timestamp`,`design`) VALUES ('$userid','$exactproduct','$status',NULL,'$design')");
										$this->cart->insert($data);
										if($query){
												 $object = new stdClass();
												 $object->value = true;
												return $object;
												}
										else{
												$object = new stdClass();
												 $object->value = false;
												 $object->comment = 'Internal Server Error';
												return $object;
												}

								}
						}

						else
						{

								$checkcartagain=$this->db->query("SELECT * FROM `fynx_cart` WHERE `user`='$userid' AND `product`='$exactproduct'");
									if ( $checkcartagain->num_rows() > 0 )
								 {
												//UPDATE DATABASE CART

										$queryupdate=$this->db->query("UPDATE `fynx_cart` SET `quantity`='$quantity' WHERE `user`='$userid' AND `product`='$exactproduct' and `status`=0");
										$this->cart->insert($data);
										if($queryupdate){
												 $object = new stdClass();
												 $object->value = true;
												 return $object;
												}
										else{
												 $object = new stdClass();
												 $object->value = false;
												 $object->comment = 'Internal Server Error';
												 return $object;
										}
								 }
								else{
										 // INSERT PRODUCT IN CART
												$query=$this->db->query("INSERT INTO `fynx_cart`(`user`, `product`, `quantity`, `timestamp`,`design`) VALUES ('$userid','$exactproduct','$quantity',NULL,'$design')");
										$this->cart->insert($data);
										if($query){
												 $object = new stdClass();
												 $object->value = true;
												return $object;
												}
										else{
												$object = new stdClass();
												 $object->value = false;
												 $object->comment = 'Internal Server Error';
												return $object;
												}
								}

						}

				}

}

function removeFromCart($cart)
{
		$user = $this->session->userdata('id');
		if($user!=''){
				$deletecart=$this->db->query("DELETE FROM `fynx_cart` WHERE `product`='$cart' AND `user`='$user'");
				if($deletecart)
				{
						$object = new stdClass();
						$object->value = true;
						return $object;
				}
				else
				{
						$object = new stdClass();
						$object->value = false;
						return $object;
				}
		}
		else{
				$id=$cart;
				 $cart = $this->cart->contents();
		$newcart = array();
		foreach ($cart as $item) {
				if ($item['id'] != $id) {
						array_push($newcart, $item);
				}
		}
		$this->cart->destroy();
		$this->cart->insert($newcart);
				 $object = new stdClass();
						$object->value = true;
						return $object;
		}

}



     public function changepassword($id, $oldpassword, $newpassword, $confirmpassword) {
        $oldpassword = md5($oldpassword);
        $newpassword = md5($newpassword);
        $confirmpassword = md5($confirmpassword);
        if ($newpassword == $confirmpassword) {
            $useridquery = $this->db->query("SELECT `id` FROM `user` WHERE `password`='$oldpassword'");
            if ($useridquery->num_rows() == 0) {
                return 0;
            } else {
                $query = $useridquery->row();
                $userid = $query->id;
                $updatequery = $this->db->query("UPDATE `user` SET `password`='$newpassword' WHERE `id`='$userid'");
                return 1;
            }
        } else {
//            echo "New password and confirm password do not match!!!";
			return -1;
        }
    }
     public function checkstatus($orderid){
      $query=$this->db->query("SELECT * FROM `fynx_order` WHERE `id`='$orderid'")->row();
        $orderstatus=$query->orderstatus;
        if($orderstatus==1){
        return 1;
        }
        else
        {
        return 0;
        }
    }
		public function updateorderstatusafterpayment($orderid,$transactionid,$responsecode,$amount)
        {
            if($responsecode==0)
            {
             $checkamt=$this->db->query("SELECT IFNULL(SUM(`price`),0) as `totalamount` FROM `fynx_orderitem` WHERE `order`='$orderid'")->row();
                $totalamount=$checkamt->totalamount;
                if($totalamount==$amount){
                    $query1=$this->db->query("UPDATE `fynx_order` SET `orderstatus`=2,`transactionid`='$transactionid' WHERE `id`='$orderid'");
             // DESTROY CART
                    $getuser=$this->db->query("SELECT `user` FROM `fynx_order` WHERE `id`='$orderid'")->row();
                    $user=$getuser->user;
                    $this->cart->destroy();
                    $deletecart=$this->db->query("DELETE FROM `fynx_cart` WHERE `user`='$user'");
            redirect("http://www.myfynx.com/testing/#/thankyou/".$orderid);
                }
                else{
                      $query=$this->db->query("UPDATE `fynx_order` SET `orderstatus`=5,`transactionid`='$transactionid' WHERE `id`='$orderid'");
            redirect("http://www.myfynx.com/testing/#/sorry/".$orderid);
                }


            }
            else
            {
            $query=$this->db->query("UPDATE `fynx_order` SET `orderstatus`=5,`transactionid`='$transactionid' WHERE `id`='$orderid'");
            redirect("http://www.myfynx.com/testing/#/sorry/".$orderid);
            }
}
public function checkproductquantity($prodid)
{
	 $query=$this->db->query("SELECT `quantity` FROM `fynx_product` WHERE `id`='$prodid'")->row();
	 $quantity=$query->quantity;
	 return $quantity;
}
}
?>
