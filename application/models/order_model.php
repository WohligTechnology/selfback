<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}
class order_model extends CI_Model
{
    public function create($user, $firstname, $lastname, $email, $billingaddress, $billingcontact, $billingcity, $billingstate, $billingpincode, $billingcountry, $shippingcity, $shippingaddress, $shippingname, $shippingcountry, $shippingcontact, $shippingstate, $shippingpincode, $trackingcode, $defaultcurrency, $shippingmethod, $orderstatus, $billingline1, $billingline2, $billingline3, $shippingline1, $shippingline2, $shippingline3, $transactionid, $paymentmode)
    {
        $data = array('user' => $user,'firstname' => $firstname,'lastname' => $lastname,'email' => $email,'billingaddress' => $billingaddress,'billingcontact' => $billingcontact,'billingcity' => $billingcity,'billingstate' => $billingstate,'billingpincode' => $billingpincode,'billingcountry' => $billingcountry,'shippingcity' => $shippingcity,'shippingaddress' => $shippingaddress,'shippingname' => $shippingname,'shippingcountry' => $shippingcountry,'shippingcontact' => $shippingcontact,'shippingstate' => $shippingstate,'shippingpincode' => $shippingpincode,'trackingcode' => $trackingcode,'defaultcurrency' => $defaultcurrency,'shippingmethod' => $shippingmethod,'orderstatus' => $orderstatus,'billingline1' => $billingline1,'billingline2' => $billingline2,'billingline3' => $billingline3,'shippingline1' => $shippingline1,'shippingline2' => $shippingline2,'shippingline3' => $shippingline3,'transactionid' => $transactionid,'paymentmode' => $paymentmode);
        $query = $this->db->insert('fynx_order', $data);
        $id = $this->db->insert_id();
        if (!$query) {
            return  0;
        } else {
            return  $id;
        }
    }
    public function beforeedit($id)
    {
        $this->db->where('id', $id);
        $query = $this->db->get('fynx_order')->row();

        return $query;
    }
    public function getsingleorder($id)
    {
        $this->db->where('id', $id);
        $query = $this->db->get('fynx_order')->row();

        return $query;
    }
    public function edit($id, $user, $firstname, $lastname, $email, $billingaddress, $billingcontact, $billingcity, $billingstate, $billingpincode, $billingcountry, $shippingcity, $shippingaddress, $shippingname, $shippingcountry, $shippingcontact, $shippingstate, $shippingpincode, $trackingcode, $defaultcurrency, $shippingmethod, $orderstatus, $billingline1, $billingline2, $billingline3, $shippingline1, $shippingline2, $shippingline3, $transactionid, $paymentmode)
    {
        $data = array('user' => $user,'firstname' => $firstname,'lastname' => $lastname,'email' => $email,'billingaddress' => $billingaddress,'billingcontact' => $billingcontact,'billingcity' => $billingcity,'billingstate' => $billingstate,'billingpincode' => $billingpincode,'billingcountry' => $billingcountry,'shippingcity' => $shippingcity,'shippingaddress' => $shippingaddress,'shippingname' => $shippingname,'shippingcountry' => $shippingcountry,'shippingcontact' => $shippingcontact,'shippingstate' => $shippingstate,'shippingpincode' => $shippingpincode,'trackingcode' => $trackingcode,'defaultcurrency' => $defaultcurrency,'shippingmethod' => $shippingmethod,'orderstatus' => $orderstatus,'billingline1' => $billingline1,'billingline2' => $billingline2,'billingline3' => $billingline3,'shippingline1' => $shippingline1,'shippingline2' => $shippingline2,'shippingline3' => $shippingline3,'transactionid' => $transactionid,'paymentmode' => $paymentmode);
        $this->db->where('id', $id);
        $query = $this->db->update('fynx_order', $data);

        return 1;
    }
    public function delete($id)
    {
        $query = $this->db->query("DELETE FROM `fynx_order` WHERE `id`='$id'");

        return $query;
    }
    public function getorderstatus()
    {
        $query = $this->db->query('SELECT * FROM `orderstatus` ORDER BY `name` ASC')->result();
        $return = array(
        '' => 'Choose an option',
        );

        foreach ($query as $row) {
            $return[$row->id] = $row->name;
        }

        return $return;
    }
    public function getpaymentmodedropdown()
    {
        $return = array(
        '' => 'Choose Payment Mode',
        '1' => 'Credit Card',
        '2' => 'Debit Card',
        '3' => 'Net Banking',
        '4' => 'Cash On Delivery',
        );

        return $return;
    }
    public function getorderdropdown()
    {
        $query = $this->db->query('SELECT * FROM `fynx_order`  ORDER BY `id` ASC')->result();
        $return = array(
        '' => '',
        );
        foreach ($query as $row) {
            $return[$row->id] = $row->firstname.' '.$row->lastname;
        }

        return $return;
    }
    public function getorderitem($id)
    {
        $query = $this->db->query("SELECT `fynx_orderitem`.`id`,`fynx_order`.`firstname`,`fynx_orderitem`.`order`,`fynx_orderitem`.`product`,`fynx_product`.`name`,`fynx_product`.`sku`, `fynx_orderitem`.`quantity`,`fynx_orderitem`.`price`,`fynx_orderitem`.`discount`,`fynx_orderitem`.`finalprice` FROM `fynx_orderitem`
		INNER JOIN `fynx_order` ON `fynx_order`.`id`=`fynx_orderitem`.`order`
		INNER JOIN `fynx_product` ON `fynx_product`.`id`=`fynx_orderitem`.`product` AND `fynx_orderitem`.`order`='$id'
        ")->result();

        return $query;
    }

    public function placeOrder($user, $firstname, $lastname, $email, $phone, $billingline1, $billingline2, $billingline3, $billingcity, $billingstate, $billingcountry, $shippingcity, $shippingcountry, $shippingstate, $shippingpincode, $billingpincode, $carts, $shippingline1, $shippingline2, $shippingline3, $paymentmode)
     {

         $mysession = $this->session->all_userdata();

         if ($shippingline1 == '') {
             $query = $this->db->query("INSERT INTO `fynx_order`(`user`, `firstname`, `lastname`, `email`,`billingcontact`, `billingline1`,`billingline2`,`billingline3`, `billingcity`, `billingstate`, `billingcountry`, `shippingline1`,`shippingline2`,`shippingline3`, `shippingcity`, `shippingcountry`, `shippingstate`, `shippingpincode`, `billingpincode`,`shippingcontact`,`orderstatus`,`paymentmode`) VALUES ('$user','$firstname','$lastname','$email','$phone','$billingline1','$billingline2','$billingline3','$billingcity','$billingstate','$billingcountry','$billingline1','$billingline2','$billingline3','$billingcity','$billingcountry','$billingstate','$billingpincode','$billingpincode','$phone','1','$paymentmode')");
         } else {

             $query = $this->db->query("INSERT INTO `fynx_order`(`user`, `firstname`, `lastname`, `email`,`billingcontact`, `billingline1`,`billingline2`,`billingline3`, `billingcity`, `billingstate`, `billingcountry`, `shippingline1`,`shippingline2`,`shippingline3`, `shippingcity`, `shippingcountry`, `shippingstate`, `shippingpincode`, `billingpincode`,`shippingcontact`,`orderstatus`,`paymentmode`) VALUES ('$user','$firstname','$lastname','$email','$phone','$billingline1','$billingline2','$billingline3','$billingcity','$billingstate','$billingcountry','$shippingline1','$shippingline2','$shippingline3','$shippingcity','$shippingcountry','$shippingstate','$shippingpincode','$billingpincode','$phone','1','$paymentmode')");
         }

         $order = $this->db->insert_id();
         $mysession['orderid'] = $order;
         $this->session->set_userdata($mysession);

// echo"cart";
// print_r($mysession);
  // print_r($carts);
   //        $cartcount=count($carts);
   //        echo "    cart count    ".$cartcount."      "."end";
              foreach ($carts as $cart) {
             $querycart = $this->db->query("INSERT INTO `fynx_orderitem`(`order`, `product`, `quantity`,`status`, `price`, `finalprice`,`design`) VALUES ('$order','".$cart['id']."','".$cart['qty']."','".$cart['status']."','".$cart['price']."','".$cart['subtotal']."','".$cart['design']."')");

            // print_r($querycart);
             $quantity = intval($cart['qty']);
             $productid = $cart['id'];
             $this->db->query("UPDATE `fynx_product` SET `fynx_product`.`quantity`=`fynx_product`.`quantity`-$quantity WHERE `fynx_product`.`id`='$productid'");
         }


         //email to customer
         $this->load->library('email');
         $this->email->from('vigwohlig@gmail.com', 'Self Care');
         $this->email->to($email);
         $this->email->subject('Thank You for shopping with us');
         $message= "test text";
         $message = "<html><body style='margin: 0;'>
           <div class='fynxmailer' style='width: 600px; max-width:600px; margin: 0 auto;'>
             <header>
               <img src='http://myfynx.in/img/img/emailer-fynx.png' alt='' class='img-responsive'>
             </header>
             <main>
               <div class=''>
                 <div class='section-login' style='margin: 0 20px;'>
                   <p style='font-family: Roboto;font-size: 20px;color: #000;'>Dear <span style='font-family: Roboto;font-size: 20px;color: #000;'>Manan</span>,</p>
                   <p style='font-family: Roboto;font-size: 20px;color: #000;'>Thank You for signing up on My Fynx. We are really excited to have you with us!</p>";

         $count=1;
         $finalpricetotal=0;
         foreach($carts as $cart)
         {
         $id=$cart['id'];
         $color=$cart['color'];
         $size=$cart['size'];
         $quantity=$cart['qty'];
         $price=$cart['price'];
         $subtotal=$cart['subtotal'];

         $message.="
         <table style='width: 100%;'>
           <thead style=' background-color: #fc483f; color: #fff;'>
             <th style='padding: 10px; text-transform:uppercase; font-size: 14px'>Item</th>
             <th style='padding: 10px; text-transform:uppercase; font-size: 14px'>Color</th>
             <th style='padding: 10px; text-transform:uppercase; font-size: 14px'>Size</th>
             <th style='padding: 10px; text-transform:uppercase; font-size: 14px'>Quantity</th>
             <th style='padding: 10px; text-transform:uppercase; font-size: 14px'>SubTotal</th>
           </thead>
           <tbody>
             <tr>
               <td style='text-align:center;'>
                 <img src='http://www.myfynx.com/newfynx/uploads/WS05MAIN1.JPG' alt='' width='70' class='img-responsive'>
               </td>
               <td style='text-align:center;'>White</td>
                 <td style='text-align:center;'>S</td>
                 <td style='text-align:center;'>$quantity</td>
                 <td style='text-align:center;'>$subtotal</td>
             </tr>
           </tbody>
         </table>
         ";
         $finalpricetotal=$finalpricetotal+$value->finalprice;
                $counter++;
         }
         $message.="
         <p style='font-family: Roboto;font-size: 20px;color: #000;'>Your My Fynx Registered Email Id is : <a href='' style='color: #000;font-size: 20px;text-decoration: none;font-family: Roboto;'>manan@ting.in</a></p>
         <p style='font-family: Roboto;font-size: 20px;color: #000;'><a href='http://www.myfynx.com' target='_blank' style='font-size: 20px;color: #fc483f;font-family: Roboto;'>Click Here</a> to return to the website.</p>
         <p style='color: #fc483f;font-family: Roboto;font-size: 20px;'>Happy Shopping !</p>
         <span style='font-family: Roboto;font-size: 20px;color: #000;'>Thank You,</span>
         <span class='block' style='font-family: Roboto;font-size: 20px;color: #000;display: block;'>Team My Fynx!</span>
         </div>
         </div>
         </main>
         <footer style='background-color: #000; padding: 10px 0; color: #fff; margin-top: 20px;'>
         <div class='footer-wrapper'>
         <table style='width: 100%;'>
         <tr>
           <td style='padding:15px; float:left;'>
             <div class='copy'>
               <span style='font-family: Roboto;font-size: 14px;color: #fff;'>COPYRIGHT@MYFYNX2016</span>
             </div>
           </td>
           <td style='padding: 0 15px; text-align: right;'>
             <div class='follow' style='text-align: center; float: right;'>
               <span class='block' style='font-family: Roboto;font-size: 14px;color: #fff;display: block;'>FOLLOW US ON</span>
               <a href='https://www.facebook.com/MyFynx-401315743385366/?fref=ts' target='_blank' class='inline-block' style='font-family: Roboto;font-size: 18px;color: #fff;display: inline-block;margin: 3px 5px 0 0;'><img src='http://myfynx.in/img/img/fynx-fb.png' alt='Facebook' width='20'></a>
               <a href='https://twitter.com/MyFynx' target='_blank' class='inline-block' style='font-family: Roboto;font-size: 18px;color: #fff;display: inline-block;margin: 3px 5px 0 0;'><img src='http://myfynx.in/img/img/fynx-twi.png' alt='Twitter' width='20'></a>
               <a href='https://www.instagram.com/myfynx/' target='_blank' class='inline-block' style='font-family: Roboto;font-size: 18px;color: #fff;display: inline-block;margin: 3px 5px 0 0;'><img src='http://myfynx.in/img/img/fynx-insta.png' alt='Instagram' width='20'></a>
               <a href='https://www.youtube.com/channel/UCIo8qm3zCU8JmDZ1UaHhf3Q' target='_blank' class='inline-block' style='font-family: Roboto;font-size: 18px;color: #fff;display: inline-block;margin: 3px 5px 0 0;'><img src='http://myfynx.in/img/img/fynx-youtube.png' alt='Youtube' width='20'></a>
             </div>
           </td>
         </tr>
         </table>
         </div>
         </footer>
         </div>
         </body></html>";

         $this->email->message($message);
         $this->email->send();
         //echo $this->email->print_debugger();
   //		$table =$this->order_model->getorderitem($order);
   //		$before=$this->order_model->beforeedit($order);

                //email to customer
                $this->load->library('email');
                $this->email->from('vigwohlig@gmail.com', 'Selfcare');
                $this->email->to($email);
                $this->email->subject('Thank You for shopping with us');
$message= "test text";
                $message = "<html><body><div id=':1fn' class='a3s adM' style='overflow: hidden;'><div class='HOEnZb'><div class='adm'><div id='q_152da6db6beee01c_0' class='ajR h4' data-tooltip='Hide expanded content' aria-label='Hide expanded content'><div class='ajT'></div></div></div><div class='im'><u></u>
                <div style='margin:0'>

                <u></u>
                <div style='margin:0 auto;width:90%'>
                <div style='margin:50px auto;width:80%'>
                <div style='text-align:center' align='center'>
                 <img src='http://selfcareindia.com/img/logo.png' alt='Selfcare' class='CToWUd'>
                </div>

                <p style='color:#000;font-family:Roboto;font-size:20px'>Thank You for shopping with SelfCare. You've picked up some really healthy and amazing stuff and we can't wait to have it delivered at your doorstep. Here's what you ordered:
   </p>
   <p style='color:#000;font-family:Roboto;font-size:20px'>";

   $count=1;
   $finalpricetotal=0;
   foreach($carts as $cart)
   {
       $id=$cart['id'];
       $quantity=$cart['qty'];
       $price=$cart['price'];

       $message.="
       <table>
       <tr>
           <td align='center' style='padding: 10px 0;'>$count</td>
           <td align='center' style='padding: 10px 0;'>$id</td>
           <td align='center' style='padding: 10px 0;'>$quantity</td>
           <td align='center' style='padding: 10px 0;'>$price</td>

         </tr>
         </table>";
       $finalpricetotal=$finalpricetotal+$value->finalprice;
                       $counter++;
   }
     $message.="

   </p>

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

                $this->email->message($message);
                $this->email->send();
                //echo $this->email->print_debugger();


         $userquery = $this->db->query("UPDATE `user` SET `firstname`='$firstname',`lastname`='$lastname',`phone`='$phone',`status`='2',`billingline1`='$billingline1',`billingline2`='$billingline2',`billingline3`='$billingline3',`billingcity`='$billingcity',`billingstate`='$billingstate',`billingcountry`='$billingcountry',`billingpincode`='$billingpincode',`shippingline1`='$shippingline1',`shippingline2`='$shippingline2',`shippingline3`='$shippingline3',`shippingcity`='$shippingcity',`shippingcountry`='$shippingcountry',`shippingstate`='$shippingstate',`shippingpincode`='$shippingpincode' WHERE `id`='$user'");
         if ($query) {
             return $order;


         } else {
             return false;
         }
     }


}
