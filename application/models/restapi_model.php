<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}
class restapi_model extends CI_Model
{
    public function deletecareers($id)
    {
        $query = $this->db->query("DELETE FROM `careers` WHERE `id`=$id");

        return $query;
    }

    public function getFoodGroup()
    {
        $query = $this->db->query("SELECT DISTINCT `category` AS 'name' FROM `caloriemeter`")->result();
        return $query;
    }
    public function getFoodProducts($name)
    {
        $query = $this->db->query("SELECT DISTINCT `product` AS 'name' FROM `caloriemeter` WHERE `category`='$name'")->result();
        return $query;
    }
    public function getFoodProductdetail($name,$catname)
    {
        $query = $this->db->query("SELECT DISTINCT * FROM `caloriemeter` WHERE `product`='$name' AND `category`='$catname'")->row();
        return $query;
    }

    public function subscribe($email)
    {
        $query1 = $this->db->query("SELECT * FROM `subscribe` WHERE `email`='$email'");
        $num = $query1->num_rows();
        if ($num > 0) {
            $object = new stdClass();
            $object->value = false;
            $object->comment = 'already exists';

            return $object;
        } else {
            $this->db->query("INSERT INTO `subscribe`(`email`) VALUE('$email')");
            $id = $this->db->insert_id();
            $viewcontent = $this->load->view('emailers/subscribe', $data, true);
              $this->email_model->emailer($viewcontent,'Thank You For Subscribing With Selfcare',$email,$username);
            // $viewcontent = $this->load->view('emailers/subscriberesponse', $data, true);
            //   $this->email_model->emailer($viewcontent,'Thank You For Subscribing With Selfcare','care@selfcareindia.com',$username);

            $object = new stdClass();
            $object->value = true;

            return $object;
        }
    }

    public function askSumanSubmit($category, $name, $email, $question)
    {
        $this->db->query("INSERT INTO `asksuman`(`category`,`name`,`email`,`question`) VALUE('$category','$name','$email','$question')");
        $data['name']=$name;
        $data['category']=$category;
        $data['email']=$email;
        $data['question']=$question;
        $viewcontent = $this->load->view('emailers/asksuman', $data, true);
        $this->email_model->emailer($viewcontent,'Ask Suman Form Submission','care@selfcareindia.com',$username);
        $viewcontent = $this->load->view('emailers/asksumanresponse', $data, true);
        $this->email_model->emailer($viewcontent,'Ask Suman Form Submission',$email,$username);
        $object = new stdClass();
        $object->value = true;

        return $object;
    }

    public function commentSubmit($blogid, $name, $email, $website, $comment)
    {
        $this->db->query("INSERT INTO `selftables_comment`(`blog`,`name`,`email`,`website`,`comment`) VALUE('$blogid','$name','$email','$website','$comment')");
            $object = new stdClass();
        $object->value = true;
        return $object;
    }

    public function careersSubmit($name, $email, $mobile, $message, $resume)
    {
        $this->db->query("INSERT INTO `careers`(`name`,`email`,`mobile`,`message`,`resume`) VALUE('$name','$email','$mobile','$message','$resume')");
        $data['name']=$name;
        $data['mobile']=$mobile;
        $data['email']=$email;
        $data['message']=$message;

        $viewcontent = $this->load->view('emailers/careersubmit', $data, true);
        $this->email_model->emailer($viewcontent,'Career Form Submission','care@selfcareindia.com',$username);
        $viewcontent = $this->load->view('emailers/careersubmitresponse', $data, true);
        $this->email_model->emailer($viewcontent,'Career Form Submission',$email,$username);

        $object = new stdClass();
        $object->value = true;

        return $object;
    }

    public function contactSubmit($firstname, $lastname, $mobile, $email, $message)
    {
        $this->db->query("INSERT INTO `contact`(`firstname`,`lastname`,`telephone`,`email`,`comment`) VALUE('$firstname','$lastname','$mobile','$email','$message')");
        $object = new stdClass();
        $object->value = true;

        return $object;
    }

    public function getTestimonial()
    {
        $query = $this->db->query('SELECT `name`, `location`, `weight`, `description` FROM `testimonial`')->result();
        if ($query) {
            return $query;
        } else {
            $object = new stdClass();
            $object->value = false;

            return $object;
        }
    }

    public function registeruser($firstname, $lastname, $email, $password)
    {
        $newdata = 0;
        $password = md5($password);

        //  echo 'email id  '.$email;
         $query = $this->db->query("SELECT `id` FROM `user` WHERE `email`='$email'");
        $num = $query->num_rows();

        if ($num == 0) {
            $this->db->query("INSERT INTO `user`(`name`,`firstname`, `lastname`, `email`, `password`,`accesslevel`,`status`) VALUE('$firstname $lastname','$firstname','$lastname','$email','$password','3','2')");
            $userid = $this->db->insert_id();

            // CART PART

$cartdata = $this->cart->contents();
if ($cartdata) {
  $newcart = array();
  foreach ($cartdata as $item) {
      array_push($newcart, $item);
  }

  foreach ($newcart as $cart) {
  $querycart = $this->db->query("INSERT INTO `fynx_cart`(`user`, `product`,`quantity`, `timestamp`, `json`,`design`,`status`) VALUES ('$userid','".$cart['id']."','".$cart['qty']."',NULL,'".$cart['options']['json']."','".$cart['design']."','".$cart['options']['status']."')");

  }
}

// cart ends
            $data['name']=$firstname.' '.$lastname;
            $data['email']=$email;
            $viewcontent = $this->load->view('emailers/registeruser', $data, true);
            $this->email_model->emailer($viewcontent,'Welcome to SelfCare',$email,$username);
            $newdata = array(
                                 'id' => $user,
                                 'email' => $email,
                                 'firstname' => $firstname,
                                 'lastname' => $lastname,
                                 'logged_in' => 'true',
                 );

            $this->session->set_userdata($newdata);
            $q="SELECT `id`, `name`, `email`, `accesslevel`, `timestamp`, `status`, `image`, `username`, `socialid`, `logintype`, `json`, `firstname`, `lastname`, `phone`, `billingaddress`, `billingcity`, `billingstate`, `billingcountry`, `billingcontact`, `billingpincode`, `shippingaddress`, `shippingcity`, `shippingcountry`, `shippingstate`, `shippingpincode`, `shippingname`, `shippingcontact`, `currency`, `credit`, `companyname`, `registrationno`, `vatnumber`, `country`, `fax`, `gender`, `facebook`, `google`, `twitter`, `street`, `address`, `pincode`, `state`, `dob`, `city` FROM `user` WHERE `id`='$userid'";
            // echo $q;
            $getuser = $this->db->query($q)->row();
            $object = $getuser;
        } else {
            $object = new stdClass();
            $object->value = false;
            $object->comment = 'Email already exists.';
        }

        return $object;
    }

    public function getallcategory()
    {
        $query = $this->db->query('SELECT `id`, `name`, `parent`, `status`, `order`, `image1`, `image2` FROM `category` WHERE `parent`=0')->result();

        return $query;
    }
    public function gethomecontent()
    {
        $query = $this->db->query('SELECT `id`, `name`, `link` as `url`, `target`, `status`, `image` as `src`, `template`, `class`, `text`, `centeralign` as `centerAlign` FROM `fynx_homeslide` WHERE `status`=1')->result();

        return $query;
    }
    public function getorderbyorderid($orderid)
    {
        $query = $this->db->query("SELECT `transactionid` FROM `fynx_order` WHERE `id`='$orderid'")->row();
        $query->amount = $this->db->query("SELECT SUM(`finalprice`) as `amount` FROM `fynx_orderitem` WHERE `order`='$orderid'")->row();

        return $query;
    }

    public function getorders($userid)
    {
        if (empty($userid)) {
            //echo "NO users found";
        } else {

            $return->orders = $this->db->query("select DISTINCT `fynx_order`.`id`,`fynx_order`.`trackingcode` from `fynx_order` INNER JOIN `fynx_orderitem` ON `fynx_order`.`id`=`fynx_orderitem`.`order` where `fynx_order`.`user`=$userid AND `fynx_order`.`transactionid`!=''")->result();

          foreach($return->orders  as $plan)
            {
                $plan->product = $this->db->query("SELECT `fynx_orderitem`.`order`,`fynx_orderitem`.`status`,`fynx_product`.`id`,`fynx_product`.`name`,`fynx_product`.`image1` as 'image' ,`fynx_orderitem`.`quantity`,`fynx_orderitem`.`price`*`fynx_orderitem`.`quantity` as `price` FROM `fynx_orderitem` LEFT OUTER JOIN `fynx_product` ON `fynx_orderitem`.`product`=`fynx_product`.`id`  WHERE `fynx_orderitem`.`order`= '$plan->id' AND `fynx_orderitem`.`status`!=3")->result();


                  $plan->plans = $this->db->query("SELECT `fynx_orderitem`.`order`,`fynx_orderitem`.`status`,`plans`.`id`,`plans`.`plan`,`selftables_subtype`.`name` as `subtype`,`selftables_healthpackages`.`months` ,`fynx_orderitem`.`quantity`,`fynx_orderitem`.`price` FROM `fynx_orderitem`  LEFT OUTER JOIN `plans` ON `plans`.`id`=`fynx_orderitem`.`product` LEFT OUTER JOIN `selftables_healthpackages` ON `plans`.`packageid`=`selftables_healthpackages`.`id` LEFT OUTER JOIN `selftables_subtype`ON `selftables_healthpackages`.`subtype`=`selftables_subtype`.`id` WHERE `fynx_orderitem`.`order`= '$plan->id' AND `fynx_orderitem`.`status`=3")->result();


                    }

          return $return;

        }

  }


    public function getUserDetails($user)
    {
        $query = $this->db->query("SELECT `id`, `name`, `password`, `email`, `accesslevel`, `timestamp`, `status`, `image`, `username`, `socialid`, `logintype`, `json`, `firstname`, `lastname`, `phone`, `billingaddress`, `billingcity`, `billingstate`, `billingcountry`, `billingcontact`, `billingpincode`, `shippingaddress`, `shippingcity`, `shippingcountry`, `shippingstate`, `shippingpincode`, `shippingname`, `shippingcontact`, `currency`, `credit`, `companyname`, `registrationno`, `vatnumber`, `country`, `fax`, `gender`, `facebook`, `google`, `twitter`, `street`, `address`, `pincode`, `state`, `dob`, `city`, `billingline1`, `billingline2`, `shippingline1`, `shippingline2`, `billingline3`, `shippingline3` FROM `user` WHERE `id`=$user")->row();

        return $query;
    }
    public function getSubCategoryProductHome($id)
    {
        $query['subcategorynames'] = $this->db->query('SELECT `homecategoryproduct`.`id`, `homecategoryproduct`.`subcategory`,`subcategory`.`name` FROM `homecategoryproduct` LEFT OUTER JOIN `subcategory` ON `subcategory`.`id`=`homecategoryproduct`.`subcategory` GROUP BY `homecategoryproduct`.`subcategory`')->result();
        $query1 = $this->db->query("SELECT `product` FROM `homecategoryproduct` WHERE `subcategory`=$id")->result();
        $productids = '(';
        foreach ($query1 as $key => $value) {
            //            $catid=$row->id;
                if ($key == 0) {
                    $productids .= $value->product;
                } else {
                    $productids .= ','.$value->product;
                }
        }
        $productids .= ')';
        if ($productids == '()') {
            $productids = '(0)';
        }
        $query['product'] = $this->db->query("SELECT `id`, `name`, `sku`, `description`, `url`, `visibility`, `price`, `wholesaleprice`, `firstsaleprice`, `secondsaleprice`, `specialpriceto`, `specialpricefrom`, `metatitle`, `metadesc`, `metakeyword`, `quantity`, `status`, `modelnumber`, `brandcolor`, `eanorupc`, `eanorupcmeasuringunits`, `type`, `compatibledevice`, `compatiblewith`, `material`, `color`, `design`, `width`, `height`, `depth`, `portsize`, `packof`, `salespackage`, `keyfeatures`, `videourl`, `modelname`, `finish`, `weight`, `domesticwarranty`, `domesticwarrantymeasuringunits`, `internationalwarranty`, `internationalwarrantymeasuringunits`, `warrantysummary`, `warrantyservicetype`, `coveredinwarranty`, `notcoveredinwarranty`, `size`, `typename`, `subcategory`, `category` FROM `product` WHERE `id` IN $productids")->result();

        return $query;
    }

    public function getFilters($catid)
    {
        $query['color'] = $this->db->query("SELECT DISTINCT  `fynx_color`.`id`,`fynx_color`.`name` FROM `fynx_product`
       LEFT OUTER JOIN `fynx_color` ON `fynx_color`.`id`=`fynx_product`.`color`
       WHERE `fynx_product`.`category`='$catid'")->result();

        $query['type'] = $this->db->query("SELECT DISTINCT  `fynx_type`.`id`,`fynx_type`.`name` FROM `fynx_product`
       LEFT OUTER JOIN `fynx_type` ON `fynx_type`.`id`=`fynx_product`.`type`
       WHERE `fynx_product`.`category`='$catid' AND `fynx_type`.`status`=2")->result();

        $query['size'] = $this->db->query("SELECT DISTINCT  `fynx_size`.`id`,`fynx_size`.`name` FROM `fynx_product`
       LEFT OUTER JOIN `fynx_size` ON `fynx_size`.`id`=`fynx_product`.`size`
       WHERE `fynx_product`.`category`='$catid' AND `fynx_size`.`status`=2")->result();

        $query['subcategory'] = $this->db->query("SELECT DISTINCT  `fynx_subcategory`.`id`,`fynx_subcategory`.`name` FROM `fynx_product`
       LEFT OUTER JOIN `fynx_subcategory` ON `fynx_subcategory`.`id`=`fynx_product`.`subcategory`
       WHERE `fynx_product`.`category`='$catid' AND `fynx_subcategory`.`status`=2 AND `fynx_subcategory`.`category`='$catid'")->result();

        return $query;
    }
    public function removeFromWishlist($user, $product, $design)
    {
        $query = $this->db->query(" DELETE FROM `fynx_wishlist` WHERE `user`='$user' AND `product`='$product' AND `design`='$design'");
        if ($query) {
            return 1;
        } else {
            return false;
        }
    }
    public function getAllSize()
    {
        $query = $this->db->query('SELECT `id`, `status`, `name` FROM `fynx_size` WHERE 1')->result();

        return $query;
    }

    public function getFiltersLater($query)
    {
        $query2 = " SELECT `id` FROM ($query) as `tab1` ";
        $query3['subcategory'] = $this->db->query(" SELECT DISTINCT `fynx_subcategory`.`name`,`fynx_subcategory`.`id`,`fynx_subcategory`.`order` FROM `fynx_product` INNER JOIN `fynx_subcategory` ON `fynx_product`.`subcategory` = `fynx_subcategory`.`id` WHERE `fynx_product`.`id` IN ($query2) ")->result();

        return $query3;
    }
    public function updateProfile($user,$name, $firstname, $lastname, $email, $phone, $billingline1, $billingline2, $billingline3, $billingcity, $billingstate, $billingcountry, $billingpincode, $shippingline1, $shippingline2, $shippingline3, $shippingcity, $shippingstate, $shippingpincode, $shippingcountry)
    {
        $data = array(
            'name' => $name,
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
            'shippingline3' => $shippingline3,
        );

        $this->db->where('id', $user);
        $query = $this->db->update('user', $data);

        $useridquery = $this->db->query("SELECT `id`, `name`,`firstname`,`lastname`,`email`, `phone`, `billingaddress`, `billingcity`, `billingstate`, `billingcountry`, `billingcontact`, `billingpincode`, `shippingaddress`, `shippingcity`, `shippingcountry`, `shippingstate`, `shippingpincode`, `shippingname`, `shippingcontact`,  `billingline1`, `billingline2`, `shippingline1`, `shippingline2`, `billingline3`, `shippingline3` FROM `user` WHERE `id`='$user'")->row();

        return $useridquery;
    }

    public function addToCart($product, $quantity, $json, $status)
    {
        if ($status == 3) {
            $getexactproduct = $this->db->query("SELECT * FROM `plans` WHERE `id`='$product'")->row();
            $exactproduct = $getexactproduct->id;
            $packageid = $getexactproduct->packageid;
            $price = $getexactproduct->price_in_INR;
            $dollarprice = $getexactproduct->price_in_dollars;
            $productname = $getexactproduct->plan;
            $price = floatval($price);
            $dollarprice = floatval($dollarprice);
            $months = $this->db->query("SELECT `months` as 'months',`subtype` as 'subtype'  FROM `selftables_healthpackages` WHERE `id`='$packageid'")->row();
            $subtype = $this->db->query("SELECT `selftables_subtype`.`name` as 'name' FROM `selftables_healthpackages` INNER JOIN `selftables_subtype` ON `selftables_healthpackages`.`subtype`=`selftables_subtype`.`id` WHERE `selftables_subtype`.`id`='$months->subtype'")->row();

            $data = array(
                   'id' => $exactproduct,
                   'qty' => 1,
                  'price' => $price,
                   'name' => $productname,
                                 'options' => array(
                                                        'status' => $status,
                                                        'subtype' => $subtype->name,
                                                        'plan' => $productname,
                                                            'months' => $months->months,
                                                            'dollarprice' => $dollarprice,
                                                ),
                );
        } else {
            $getexactproduct = $this->db->query("SELECT * FROM `fynx_product` WHERE `id`='$product'")->row();
            $size = $getexactproduct->size;
            $stockquantity = $getexactproduct->quantity;
            $productname = $getexactproduct->name;
            $price = $getexactproduct->price;
            $color = $getexactproduct->color;
            $image = $getexactproduct->image1;
            $exactproduct = $getexactproduct->id;
            $getsize = $this->db->query("SELECT `id`, `status`, `name` FROM `fynx_size` WHERE `id`='$size'")->row();
            $sizeid = $getsize->id;
            $sizename = $getsize->name;
            $getcolor = $this->db->query("SELECT `id`, `name`, `status`, `timestamp` FROM `fynx_color` WHERE `id`='$color'")->row();
            $colorid = $getcolor->id;
            $colorname = $getcolor->name;
            $data = array(
                         'id' => $exactproduct,
                         'name' => '1',
                         'qty' => $quantity,
                         'price' => $price,
                         'image' => $image,
                            'options' => array(
                                    'status' => $status,
                                    'realname' => $productname,
                            ),
            );
        }

        $userid = $this->session->userdata('id');

        if (empty($userid)) {
            $this->cart->insert($data);
            $returnval = $this->cart->insert($data);
            if (!empty($returnval)) {
                $object = new stdClass();
                $object->value = true;

                return $object;
            } else {
                $object->value = false;
                $object->comment = 'Internal Server Error';

                return $object;
            }
        } else {
            // USER ID IS PRESENT

                        if ($status == 1) {

                                //PRODUCT DETAIL
                                                            //CHECK IF PRODUCT ALREADY THERE IN CART
                                $checkcart = $this->db->query("SELECT * FROM `fynx_cart` WHERE `user`='$userid' AND `product`='$exactproduct' and `status`=1");
                            if ($checkcart->num_rows() > 0) {
                                //  //already in cart
                                        // 		 $object = new stdClass();
                                        // 		 $object->value = false;
                                        // 		 $object->comment = 'already in cart';
                                        // 		 return $object;
                                        $queryupdate = $this->db->query("UPDATE `fynx_cart` SET `quantity`='$quantity' WHERE `user`='$userid' AND `product`='$exactproduct' and `status`=1");
                                $this->cart->insert($data);
                                if ($queryupdate) {
                                    $object = new stdClass();
                                    $object->value = true;

                                    return $object;
                                } else {
                                    $object = new stdClass();
                                    $object->value = false;
                                    $object->comment = 'Internal Server Error';

                                    return $object;
                                }
                            } else {
                                if ($quantity > $stockquantity) {
                                    $object = new stdClass();
                                    $object->value = false;
                                    $object->comment = 'quantity not available ';

                                    return $object;
                                } else {
                                    // INSERT PRODUCT IN CART
                                                $query = $this->db->query("INSERT INTO `fynx_cart`(`user`, `product`, `quantity`, `timestamp`,`design`,`status`) VALUES ('$userid','$exactproduct','$quantity',NULL,'$design','$status')");
                                    $this->cart->insert($data);
                                    if ($query) {
                                        $object = new stdClass();
                                        $object->value = true;

                                        return $object;
                                    } else {
                                        $object = new stdClass();
                                        $object->value = false;
                                        $object->comment = 'Internal Server Error';

                                        return $object;
                                    }
                                }
                            }
                        }

            if ($status == 3) {

                                //PRODUCT DETAIL
                                                            //CHECK IF PRODUCT ALREADY THERE IN CART
                                $checkcart = $this->db->query("SELECT * FROM `fynx_cart` WHERE `user`='$userid' AND `product`='$exactproduct'  and `status`=3");
                if ($checkcart->num_rows() > 0) {
                    //already in cart
                                                 $object = new stdClass();
                    $object->value = false;
                    $object->comment = 'already in cart';

                    return $object;
                } else {

                                // INSERT PRODUCT IN CART
                                                $query = $this->db->query("INSERT INTO `fynx_cart`(`user`,`quantity`, `product`, `status`, `timestamp`,`design`) VALUES ('$userid',1,'$exactproduct','$status',NULL,'$design')");
                    $this->cart->insert($data);
                    if ($query) {
                        $object = new stdClass();
                        $object->value = true;

                        return $object;
                    } else {
                        $object = new stdClass();
                        $object->value = false;
                        $object->comment = 'Internal Server Error';

                        return $object;
                    }
                }
            }

                        // else
                        // {
                        //
                        // 		$checkcartagain=$this->db->query("SELECT * FROM `fynx_cart` WHERE `user`='$userid' AND `product`='$exactproduct'");
                        // 			if ( $checkcartagain->num_rows() > 0 )
                        // 		 {
                        // 						//UPDATE DATABASE CART
                        //
                        // 				$queryupdate=$this->db->query("UPDATE `fynx_cart` SET `quantity`='$quantity' WHERE `user`='$userid' AND `product`='$exactproduct' and `status`=0");
                        // 				$this->cart->insert($data);
                        // 				if($queryupdate){
                        // 						 $object = new stdClass();
                        // 						 $object->value = true;
                        // 						 return $object;
                        // 						}
                        // 				else{
                        // 						 $object = new stdClass();
                        // 						 $object->value = false;
                        // 						 $object->comment = 'Internal Server Error';
                        // 						 return $object;
                        // 				}
                        // 		 }
                        // 		else{
                        // 				 // INSERT PRODUCT IN CART
                        // 						$query=$this->db->query("INSERT INTO `fynx_cart`(`user`, `product`, `quantity`, `timestamp`,`design`) VALUES ('$userid','$exactproduct','$quantity',NULL,'$design')");
                        // 				$this->cart->insert($data);
                        // 				if($query){
                        // 						 $object = new stdClass();
                        // 						 $object->value = true;
                        // 						return $object;
                        // 						}
                        // 				else{
                        // 						$object = new stdClass();
                        // 						 $object->value = false;
                        // 						 $object->comment = 'Internal Server Error';
                        // 						return $object;
                        // 						}
                        // 		}
                        //
                        // }
        }
    }

    public function removeFromCart($cart, $status)
    {
        $user = $this->session->userdata('id');
        if ($user != '') {
            $deletecart = $this->db->query("DELETE FROM `fynx_cart` WHERE `product`='$cart' AND `user`='$user'AND `status`='$status'");

            if (!empty($deletecart)) {
                $object = new stdClass();
                $object->value = true;

                return $object;
            } else {
                $object = new stdClass();
                $object->value = false;

                return $object;
            }
        } else {
            $id = $cart;
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

    public function changepassword($id, $oldpassword, $newpassword, $confirmpassword)
    {
        $oldpassword = md5($oldpassword);
        $newpassword = md5($newpassword);
        $confirmpassword = md5($confirmpassword);
        if ($newpassword == $confirmpassword) {
            $useridquery = $this->db->query("SELECT `id` FROM `user` WHERE `password`='$oldpassword'");
            if ($useridquery->num_rows() == 0) {
                $object = new stdClass();
                $object->value = false;

                return $object;
            } else {
                $query = $useridquery->row();
                $userid = $query->id;
                $updatequery = $this->db->query("UPDATE `user` SET `password`='$newpassword' WHERE `id`='$userid'");
                $object = new stdClass();
                $object->value = true;

                return $object;
            }
        } else {
            //            echo "New password and confirm password do not match!!!";
        //	return -1;
        $object = new stdClass();
            $object->value = false;

            return $object;
        }
    }
    public function checkstatus($orderid)
    {
        $query = $this->db->query("SELECT * FROM `fynx_order` WHERE `id`='$orderid'")->row();
        $orderstatus = $query->orderstatus;
        if ($orderstatus == 1) {
            return 1;
        } else {
            return 0;
        }
    }
    public function updateorderstatusafterpayment($OrderId, $nb_order_no, $responsecode, $Amount)
    {
//        $checkamt = $this->db->query("SELECT IFNULL(SUM(`price`),0) as `totalamount` FROM `fynx_orderitem` WHERE `order`='$orderid'")->row();
//        $totalamount = $checkamt->totalamount;

        $getorderdetails=$this->db->query("SELECT * FROM `fynx_order` WHERE `id`='$OrderId'")->row();
        $totalamount=$getorderdetails->finalamount;

     if (intval($Amount)  > 0 )
        // if (intval($Amount) == intval($totalamount) )

         {
            $query1 = $this->db->query("UPDATE `fynx_order` SET `orderstatus`='$responsecode',`transactionid`='$nb_order_no' WHERE `id`='$OrderId'");


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
            INNER JOIN `fynx_product` ON `fynx_product`.`id`=`fynx_orderitem`.`product` WHERE `fynx_orderitem`.`order`='$OrderId' AND `fynx_orderitem`.`status`!=3";
            $productquery = $this->db->query($q)->result();


            $planquery=$this->db->query("SELECT `plans`.`id`,`plans`.`plan`,`selftables_subtype`.`name` AS 'subtype',`selftables_healthpackages`.`months` ,`fynx_orderitem`.`quantity`,`fynx_orderitem`.`price`,`fynx_orderitem`.`finalprice` FROM `fynx_orderitem`  LEFT OUTER JOIN `plans` ON `plans`.`id`=`fynx_orderitem`.`product` LEFT OUTER JOIN `selftables_healthpackages` ON `plans`.`packageid`=`selftables_healthpackages`.`id` LEFT OUTER JOIN `selftables_subtype`ON `selftables_healthpackages`.`subtype`=`selftables_subtype`.`id` WHERE `fynx_orderitem`.`order`= '$OrderId' AND `fynx_orderitem`.`status`=3
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


             // DESTROY CART
                    $getuser = $this->db->query("SELECT `user` FROM `fynx_order` WHERE `id`='$OrderId'")->row();
            $user = $getuser->user;
            $this->cart->destroy();
            $deletecart = $this->db->query("DELETE FROM `fynx_cart` WHERE `user`='$user'");
            redirect('http://selfcareindia.com/#/thankyou/'.$OrderId."/".$totalamount);
        } else {
            $query = $this->db->query("UPDATE `fynx_order` SET `orderstatus`=5,`transactionid`='$nb_order_no' WHERE `id`='$OrderId'");
            redirect('http://selfcareindia.com/#/wentwrong/'.$OrderId);
        }
    }
    public function checkproductquantity($prodid)
    {
        $query = $this->db->query("SELECT `quantity` FROM `fynx_product` WHERE `id`='$prodid'")->row();
        $quantity = $query->quantity;

        return $quantity;
    }

    public function setTime() {
        $this->db->query("SET @@session.time_zone = '+05:30'");
    }
     public function getTime() {
        return $this->db->query("SELECT NOW()")->row();
    }


}
