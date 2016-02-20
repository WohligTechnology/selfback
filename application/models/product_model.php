<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class product_model extends CI_Model
{


  function getProductDetail($id){
      // $query['product']=$this->db->query("SELECT `fynx_product`.`id`,`fynx_product`.`category`,`fynx_product`.`name`,`fynx_product`.`price`,`fynx_product`.`weight`as 'netweight', `fynx_product`.`quantity` AS 'maxQuantity',`fynx_product`.`status`,`fynx_product`.`image1` AS 'image', `fynx_product`.`about`,`fynx_product`.`nutritionalvalue` as 'nutritional', `fynx_subcategory`.`name` AS 'subcategory',`fynx_subcategory`.`image1` as 'bannerimg' FROM `fynx_product` LEFT OUTER JOIN `productcategory` ON `fynx_product`.`id`=`productcategory`.`product` LEFT OUTER JOIN `fynx_subcategory` ON `productcategory`.`subcategory`= `fynx_subcategory`.`id` WHERE `fynx_product`.`id`=$id")->row();
       $query['product']=$this->db->query("SELECT `fynx_product`.`id`,`fynx_product`.`category`,`fynx_product`.`name`,`fynx_product`.`price`,`fynx_product`.`weight`as 'netweight', `fynx_product`.`quantity` AS 'maxQuantity',`fynx_product`.`status`,`fynx_product`.`image1` AS 'image', `fynx_product`.`about`,`fynx_product`.`nutritionalvalue` AS 'nutritional',`fynx_category`.`image2` AS 'bannerimg' FROM `fynx_product` LEFT OUTER JOIN `fynx_category` ON `fynx_product`.`category`= `fynx_category`.`id` WHERE `fynx_product`.`id`=$id AND `fynx_product`.`visibility`=1 AND `fynx_product`.`status`=2")->row();

      $query['relatedproduct']=$this->db->query("SELECT `fynx_product`.`id` ,  `fynx_product`.`image1` AS  `image` ,  `fynx_product`.`price` ,  `fynx_product`.`name`
FROM  `fynx_product`
INNER JOIN  `relatedproduct` ON  `relatedproduct`.`relatedproduct` =  `fynx_product`.`id`
WHERE  `relatedproduct`.`product` ='$id' AND `fynx_product`.`visibility`=1 AND `fynx_product`.`status`=2")->result();
   return $query;

  }

public function create($subcategory,$quantity,$weight,$name,$type,$about,$nutritionalvalue,$visibility,$price,$relatedproduct,$category,$color,$size,$sizechart,$status,$sku,$image1,$image2,$image3,$image4,$image5,$baseproduct,$discountprice)
{
$data=array("quantity" => $quantity,"weight" => $weight,"name" => $name,"type" => $type,"about" => $about,"nutritionalvalue" => $nutritionalvalue, "visibility" => $visibility,"price" => $price,"category" => $category,"color" => $color,"size" => $size,"sizechart" => $sizechart,"status" => $status,"sku" => $sku,"image1" => $image1,"image2" => $image2,"image3" => $image3,"image4" => $image4,"image5" => $image5,"baseproduct" => $baseproduct,"discountprice" => $discountprice);
$query=$this->db->insert( "fynx_product", $data );
$id=$this->db->insert_id();

// foreach($subcategory as $subcat)
// {
//   $q="insert into productcategory(subcategory,product) values($subcat,$id)";
// echo $q;
//
// $query=$this->db->query($q);
// //  return $query;
// }

//    foreach($relatedproduct AS $key=>$value)
//        {
//            $this->product_model->createrelatedproduct($value,$id);
//        }



if(!$query)
return  0;
else
return  $id;
}
    public function createrelatedproduct($value,$productid)
	{
		$data  = array(
			'relatedproduct' => $value,
			'product' => $productid
		);
		$query=$this->db->insert( 'relatedproduct', $data );
		return  1;
	}
public function beforeedit($id)
{
$this->db->where("id",$id);
$query=$this->db->get("fynx_product")->row();
return $query;
}
function getsingleproduct($id){
$this->db->where("id",$id);
$query=$this->db->get("fynx_product")->row();
return $query;
}
public function edit($id,$subcategory,$quantity,$weight,$name,$type,$about,$nutritionalvalue,$visibility,$price,$relatedproduct,$category,$color,$size,$sizechart,$status, $sku,$image1,$image2,$image3,$image4,$image5,$baseproduct,$discountprice)
{
$data=array("subcategory" => $subcategory,"quantity" => $quantity,"weight" => $weight,"name" => $name,"type" => $type,"about" => $about,"nutritionalvalue" => $nutritionalvalue,"visibility" => $visibility,"price" => $price,"category" => $category,"color" => $color,"size" => $size,"sizechart" => $sizechart,"status" => $status,"sku" => $sku,"image1" => $image1,"image2" => $image2,"image3" => $image3,"image4" => $image4,"image5" => $image5,"baseproduct" => $baseproduct,"discountprice" => $discountprice);
    if($image1 != "")
			$data['image1']=$image1;
		if($image2 != "")
			$data['image2']=$image2;
    if($image3 != "")
			$data['image3']=$image3;
    if($image4 != "")
			$data['image4']=$image4;
    if($image5 != "")
			$data['image5']=$image5;
//         $query1=$this->db->query("DELETE FROM `relatedproduct` WHERE `product`='$id'");
//    foreach($relatedproduct AS $key=>$value)
//        {
//            $this->product_model->createrelatedproduct($value,$id);
//        }
$this->db->where( "id", $id );
$query=$this->db->update( "fynx_product", $data );
return 1;
}
public function delete($id)
{
$query=$this->db->query("DELETE FROM `fynx_product` WHERE `id`='$id'");
return $query;
}
    	public function getproductdropdown()
	{
		$query=$this->db->query("SELECT * FROM `fynx_product`  ORDER BY `id` ASC")->result();
		$return=array(
		"" => "Choose an option"
		);
		foreach($query as $row)
		{
			$return[$row->id]=$row->name;
		}

		return $return;
	}
    public function getvisibility()
	{
		$status= array(
            "" => "Choose an option",
			 "1" => "Yes",
			 "0" => "No",
			);
		return $status;
	}
    public function getcategorydropdown()
	{
		$query=$this->db->query("SELECT * FROM `fynx_category`  ORDER BY `id` ASC")->result();
		$return=array(

		);
		foreach($query as $row)
		{
			$return[$row->id]=$row->name;
		}

		return $return;
	}
    public function getimage1byid($id)
	{
		$query=$this->db->query("SELECT `image1` FROM `fynx_product` WHERE `id`='$id'")->row();
		return $query;
	}
    public function getimage2byid($id)
	{
		$query=$this->db->query("SELECT `image2` FROM `fynx_product` WHERE `id`='$id'")->row();
		return $query;
	}
    public function getimage3byid($id)
	{
		$query=$this->db->query("SELECT `image3` FROM `fynx_product` WHERE `id`='$id'")->row();
		return $query;
	}
    public function getimage4byid($id)
	{
		$query=$this->db->query("SELECT `image4` FROM `fynx_product` WHERE `id`='$id'")->row();
		return $query;
	}
    public function getimage5byid($id)
	{
		$query=$this->db->query("SELECT `image5` FROM `fynx_product` WHERE `id`='$id'")->row();
		return $query;
	}
    public function getrelatedproductcount($id)
	{
        $return=array();
		$query=$this->db->query("SELECT `fynx_product`.`id`,`fynx_product`.`name` FROM `fynx_product` LEFT OUTER JOIN `relatedproduct` ON `relatedproduct`.`relatedproduct`=`fynx_product`.`id` WHERE `relatedproduct`.`product`='$id'");
		  if($query->num_rows() > 0)
        {
            $query=$query->result();
            foreach($query as $row)
            {
                $return[]=$row->id;
            }
        }
         return $return;
	}
    function getProductDetails($product,$user,$size,$color,$design)
	{
        $where=" ";
        if($size && $color){
            $query1=$this->db->query("SELECT * FROM `fynx_product` WHERE `id`='$product'")->row();
            $baseproduct=$query1->name;
            $productid=$query1->id;
            $where .=" `fynx_product`.`size`='$size' AND `fynx_product`.`color`='$color' AND `fynx_product`.`baseproduct` LIKE '$baseproduct'";
        }
        else{
              $where .="`fynx_product`.`id`='$product'";
        }


        $query['product']=$this->db->query("SELECT `fynx_product`.`id`, `fynx_product`.`subcategory`, `fynx_product`.`quantity`, `fynx_designs`.`name` as `name`,`fynx_product`.`name` as `productname`, `fynx_product`.`type`, `fynx_product`.`description`, `fynx_product`.`visibility`, `fynx_product`.`price`, `fynx_product`.`relatedproduct`, `fynx_product`.`category`, `fynx_product`.`color`, `fynx_product`.`size`, `fynx_product`.`sizechart`, `fynx_product`.`status`, `fynx_product`.`sku`, `productdesignimage`.`image` as `image1`,`fynx_wishlist`.`user`,`fynx_product`.`baseproduct` FROM `fynx_product`
        LEFT OUTER JOIN `fynx_wishlist` ON `fynx_wishlist`.`product`=`fynx_product`.`id` AND `fynx_wishlist`.`user`='$user'
        LEFT OUTER JOIN `productdesignimage` ON `productdesignimage`.`product`=`fynx_product`.`id`
        INNER JOIN `fynx_designs` ON `fynx_designs`.`id`  = `productdesignimage`.`design` AND `fynx_designs`.`id`='$design'
        WHERE  $where")->row();

        $baseproduct=$query['product']->productname;
//        $product=$query['product']->id;
//          $query['relatedproduct'] = $this->db->query("SELECT `fynx_designs`.`id` as `designid`, `fynx_designs`.`designer`, `fynx_designs`.`image` as `designimage`, `fynx_designs`.`status` as `designstatus`, `fynx_designs`.`timestamp`,`relatedproduct`.`relatedproduct`,`relatedproduct`.`design`,`fynx_product`.`id`, `fynx_product`.`subcategory`, `fynx_product`.`quantity`, `fynx_product`.`name`, `fynx_product`.`type`, `fynx_product`.`description`, `fynx_product`.`visibility`, `fynx_product`.`price`, `fynx_product`.`relatedproduct`, `fynx_product`.`category`, `fynx_product`.`color`, `fynx_product`.`size`, `fynx_product`.`sizechart`, `fynx_product`.`status`, `fynx_product`.`sku`, `fynx_product`.`image1`, `fynx_product`.`image2`, `fynx_product`.`image3`, `fynx_product`.`image4`, `fynx_product`.`image5` FROM `fynx_product`
//LEFT OUTER JOIN `relatedproduct` ON `relatedproduct`.`relatedproduct`=`fynx_product`.`id`
//LEFT OUTER JOIN `fynx_designs` ON `fynx_designs`.`id`=`relatedproduct`.`design`
//WHERE `relatedproduct`.`product`='$product'")->result();
//        $designquery=$this->db->query("SELECT * FROM `productdesignimage` WHERE `product`='$product'")->result();
//
//        foreach($designquery as $getimgbydesign)
//        {
//         $query['productdesignimage']=$this->db->query("SELECT `id`, `product`, `design`, `image` FROM `productdesignimage` WHERE `product`='$product' AND `design`='$getimgbydesign->design' GROUP BY `design`")->result();
//        }
//
        $query['productdesignimage'] = $this->db->query("SELECT `id`, `product`, `design`, `image` FROM `productdesignimage` WHERE `product`='$product' AND `design`='$design'")->result();


           $query['size'] = $this->db->query("SELECT DISTINCT `fynx_size`.`id`,`fynx_size`.`name` FROM `fynx_size`
        WHERE `fynx_size`.`id` IN (SELECT DISTINCT `size` FROM `fynx_product` WHERE `baseproduct` LIKE '$baseproduct' OR `name` LIKE '$baseproduct')")->result();
          $query['color'] = $this->db->query("SELECT DISTINCT `fynx_color`.`id`,`fynx_color`.`name` FROM `fynx_color`
        WHERE `fynx_color`.`id` IN (SELECT DISTINCT `color` FROM `fynx_product` WHERE `baseproduct` LIKE '$baseproduct' OR `name` LIKE '$baseproduct')")->result();


		return $query;
	}
      function addtowishlist($user,$product,$quantity,$design)
    {
        $userwishlist=$this->db->query("SELECT * FROM `fynx_wishlist` WHERE `user`='$user' AND `product`='$product'AND `design`='$design'")->row();
        if(empty($userwishlist))
        {
            $query=$this->db->query("INSERT INTO `fynx_wishlist`(`user`,`product`,`design`) VALUES ('$user','$product','$design')");
            return $query;
        }
        else
        {
            return 0;
        }


    }

    public function createbycsv($file)
	{
        foreach ($file as $row)
        {
            $subcategory=$row['subcategory'];
            $quantity=$row['quantity'];
            $name=$row['name'];
            $type=$row['type'];
            $about=$row['about'];
            $nutritionalvalue=$row['nutritionalvalue'];
            $price=$row['price'];
            $category=$row['category'];
            $color=$row['color'];
            $size=$row['size'];
            $sizechart=$row['sizechart'];
            $sku=$row['sku'];
            $image1=$row['image1'];
            $image2=$row['image2'];
            $image3=$row['image3'];
            $image4=$row['image4'];
            $image5=$row['image5'];
            $baseproduct=$row['baseproduct'];
            if($relatedproduct){
             $allrelatedproduct=explode(",",$relatedproduct);
                }


		$data  = array(
            "quantity" => $quantity,
            "name" => $name,
            "about" => $about,
            "nutritionalvalue" => $nutritionalvalue,
            "visibility" => 1,
            "price" => $price,
            "status" => 2,
            "sku" => $sku,
            "image1" => $image1,
            "image2" => $image2,
            "image3" => $image3,
            "image4" => $image4,
            "image5" => $image5,
            "baseproduct" => $baseproduct
		);
		$query=$this->db->insert( 'fynx_product', $data );
		$productid=$this->db->insert_id();

            //INSERT CATEGORY
             $query1=$this->db->query("SELECT `id` FROM `fynx_category` WHERE `name` = '$category'")->row();

            if(empty($query1))
            {
                $data=array("name" => $category,"status" => 1);
                $query=$this->db->insert( "fynx_category", $data );
                $categoryid=$this->db->insert_id();

                //SUB CATEGORY

                  $querysubcat=$this->db->query("SELECT `id` FROM `fynx_subcategory` WHERE `name` = '$subcategory' AND `category`='$categoryid'")->row();
                if(empty($querysubcat))
                {
                    $data=array("name" => $subcategory,"status" => 1,"category" => $categoryid);
                    $query=$this->db->insert( "fynx_subcategory", $data );
                    $subcategoryid=$this->db->insert_id();

                    $data=array("subcategory" => $subcategoryid);
                    $this->db->where( "id", $productid );
                    $query=$this->db->update( "fynx_product", $data );

                }
                else
                {
                    $subcategoryid=$querysubcat->id;
                    $data=array("subcategory" => $subcategoryid);
                    $this->db->where( "id", $productid );
                    $query=$this->db->update( "fynx_product", $data );
                }
                // update product

                $data=array("category" => $categoryid);
                $this->db->where( "id", $productid );
                $query=$this->db->update( "fynx_product", $data );
            }
            else
            {
                  $categoryid=$query1->id;
                //SUB CATEGORY

                  $querysubcat=$this->db->query("SELECT `id` FROM `fynx_subcategory` WHERE `name` = '$subcategory' AND `category`='$categoryid'")->row();
                if(empty($querysubcat))
                {
                    $data=array("name" => $subcategory,"status" => 1,"category" => $categoryid);
                    $query=$this->db->insert( "fynx_subcategory", $data );
                    $subcategoryid=$this->db->insert_id();

                    $data=array("subcategory" => $subcategoryid);
                    $this->db->where( "id", $productid );
                    $query=$this->db->update( "fynx_product", $data );

                }
                else
                {
                    $subcategoryid=$querysubcat->id;
                    $data=array("subcategory" => $subcategoryid);
                    $this->db->where( "id", $productid );
                    $query=$this->db->update( "fynx_product", $data );
                }
                  // update product
                $data=array("category" => $categoryid);
                $this->db->where( "id", $productid );
                $query=$this->db->update( "fynx_product", $data );
            }
            //INSERT type
             $query2=$this->db->query("SELECT `id` FROM `fynx_type` WHERE `name` = '$type'")->row();

            if(empty($query2))
            {
                // $data=array("name" => $type,"status" => 1);
                // $query=$this->db->insert( "fynx_type", $data );
                // $typeid=$this->db->insert_id();
                //
                // // update product
                // $data=array("type" => $typeid);
                // $this->db->where( "id", $productid );
                // $query=$this->db->update( "fynx_product", $data );
            }
            else
            {
                  $typeid=$query2->id;
                  // update product
                $data=array("type" => $typeid);
                $this->db->where( "id", $productid );
                $query=$this->db->update( "fynx_product", $data );
            }
            //INSERT color
             $query3=$this->db->query("SELECT `id` FROM `fynx_color` WHERE `name` = '$color'")->row();

            if(empty($query3))
            {
                // $data=array("name" => $color,"status" => 1);
                // $query=$this->db->insert( "fynx_color", $data );
                // $colorid=$this->db->insert_id();
                //
                // // update product
                // $data=array("color" => $colorid);
                // $this->db->where( "id", $productid );
                // $query=$this->db->update( "fynx_product", $data );
            }
            else
            {
                  $colorid=$query3->id;
                  // update product
                $data=array("color" => $colorid);
                $this->db->where( "id", $productid );
                $query=$this->db->update( "fynx_product", $data );
            }

            //INSERT size
             $query4=$this->db->query("SELECT `id` FROM `fynx_size` WHERE `name` = '$size'")->row();

            if(empty($query4))
            {
                // $data=array("name" => $size,"status" => 1);
                // $query=$this->db->insert( "fynx_size", $data );
                // $sizeid=$this->db->insert_id();
                //
                // // update product
                // $data=array("size" => $sizeid);
                // $this->db->where( "id", $productid );
                // $query=$this->db->update( "fynx_product", $data );
            }
            else
            {
                  $sizeid=$query4->id;
                  // update product
                $data=array("size" => $sizeid);
                $this->db->where( "id", $productid );
                $query=$this->db->update( "fynx_product", $data );
            }
            //INSERT sizechart
             $query5=$this->db->query("SELECT `id` FROM `fynx_sizechart` WHERE `name` = '$sizechart'")->row();

            if(empty($query5))
            {
                // $data=array("name" => $sizechart);
                // $query=$this->db->insert( "fynx_sizechart", $data );
                // $sizechartid=$this->db->insert_id();
                //
                // // update product
                // $data=array("sizechart" => $sizechartid);
                // $this->db->where( "id", $productid );
                // $query=$this->db->update( "fynx_product", $data );
            }
            else
            {
                  $sizechartid=$query5->id;
                  // update product
                $data=array("sizechart" => $sizechartid);
                $this->db->where( "id", $productid );
                $query=$this->db->update( "fynx_product", $data );
            }

            if($allrelatedproduct){
            foreach($allrelatedproduct as $key => $relatedproduct)
			{
                $relatedproduct=trim($relatedproduct);
                $relatedproductquery=$this->db->query("SELECT * FROM `fynx_product` where `name` LIKE '$relatedproduct'")->row();
                if(empty($relatedproductquery))
                {

                }
                else
                {
                    $relatedproduct=$relatedproductquery->id;
                }

				$data2  = array(
					'product' => $productid,
					'relatedproduct' => $relatedproduct,
				);
				$queryproductrelatedproduct=$this->db->insert( 'relatedproduct', $data2 );
			}
                }



        }
			return  1;
	}

}
?>
