<?php
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}
class Json extends CI_Controller
{


  public function getSlide()
  {

  $data['message'] = $this->homeslide_model->getSlide();
  $this->load->view('json', $data);
}

public function testmail()
{

$data['message'] = $this->user_model->testmail();
$this->load->view('json', $data);
}


public function getTvVideo()
{

$data['message'] = $this->video_model->getTvVideo();
$this->load->view('json', $data);
}

public function getNews()
{
  $year= $this->input->get_post("year");
$data['message'] = $this->news_model->getNews($year);
$this->load->view('json', $data);
}


public function getNewsYear()
{

$data['message'] = $this->news_model->getNewsYear();
$this->load->view('json', $data);
}


public function getAllBlog()
{
  $where = " WHERE 1 ";
$tag=$this->input->get_post("tag");

$this->chintantable->createelement("`selftables_blog`.`id`", '1', "ID", "id");
$this->chintantable->createelement("`selftables_blog`.`name`", '1', "title", "title");
$this->chintantable->createelement("`selftables_blog`.`image`", '0', "image", "image");
// $this->chintantable->createelement("`selftables_blog`.`dateofposting`", '1', "timestamp", "timestamp");
$this->chintantable->createelement("`selftables_blog`.`description`", '0', "content", "content");
//$this->chintantable->createelement("group_concat(`tags`.`name` separator ',')", '0', "tags", "tags");
$search=$this->input->get_post("search");
$pageno=$this->input->get_post("pageno");
$orderby=$this->input->get_post("orderby");
$orderorder=$this->input->get_post("orderorder");
$maxrow=$this->input->get_post("maxrow");
if($maxrow=="")
{
$maxrow=  20;
}
if($orderby=="")
{
$orderby="id";
$orderorder="DESC";
}

if($tag != "")
{
  $where= " WHERE `tags`.`name` = '$tag' ";
}
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `selftables_blog` LEFT OUTER JOIN `tagsblog` ON `selftables_blog`.`id` = `tagsblog`.`blog` LEFT OUTER JOIN `tags` ON `tags`.`id` = `tagsblog`.`tag`",$where,"GROUP BY `selftables_blog`.`id`");

$this->load->view("json",$data);
}



function getAllTags()
{
  $data["message"]=$this->tags_model->getAllTags();
  $this->load->view("json",$data);
}


function popularPost()
{
  $data["message"]=$this->blog_model->popularPost();
  $this->load->view("json",$data);
}
function getBlogById()
{
    $id=$this->input->get_post("id");
  $data["message"]=$this->blog_model->getBlogById($id);
  $this->load->view("json",$data);
}

function searchBlog()
{

  $title=$this->input->get_post("title");
  $data['message']= $this->blog_model->searchBlog($title);
  $this->load->view('json', $data);
}


function getPlans()
{
$sid= $this->input->get_post("id");
  $data['message']= $this->healthpackages_model->getPlans($sid);
  $this->load->View('json', $data);

}

function getSubPackages()
{
  $data['message']= $this->healthpackages_model->getSubPackages();
  $this->load->View('json', $data);

}

public function commentSubmit()
{

  $data = json_decode(file_get_contents('php://input'), true);
    $blogid = $data['blogid'];
    $name = $data['name'];
  $email = $data['email'];
  $website = $data['website'];
  $comment = $data['comment'];

$data['message'] = $this->restapi_model->commentSubmit($blogid,$name,$email,$website,$comment);
$this->load->view('json', $data);
}

public function careersSubmit()
{
  $name= $this->input->get_post("name");
  $email= $this->input->get_post("email");
  $mobile= $this->input->get_post("mobile");
  $message= $this->input->get_post("message");
  $url= $this->input->get_post("url");
  $config['upload_path'] = './uploads/';
  $config['allowed_types'] = '*';
  $this->load->library('upload', $config);
  $filename="resume";
  $resume="";
  if (  $this->upload->do_upload($filename))
  {
  $uploaddata = $this->upload->data();
  $resume=$uploaddata['file_name'];
	$config_r['source_pdf']   = './uploads/' . $uploaddata['file_name'];

$data['message'] = $this->restapi_model->careersSubmit($name,$email,$mobile,$message,$resume);
$data['redirect'] = $url;
$this->load->view('redirect3', $data);
//$this->load->view('json', $data);
}
}



public function subscribe()
{
  $email=$this->input->get_post("email");

$data['message'] = $this->restapi_model->subscribe($email);
$this->load->view('json', $data);
}


public function askSumanSubmit()
{

  $data = json_decode(file_get_contents('php://input'), true);
  $category = $data['category'];
  $name = $data['name'];
  $email = $data['email'];
  $question = $data['question'];

$data['message'] = $this->restapi_model->askSumanSubmit($category,$name,$email,$question);
$this->load->view('json', $data);
}





public function contactSubmit()
{

  $data = json_decode(file_get_contents('php://input'), true);
  $firstname = $data['firstname'];
  $lastname = $data['lastname'];
  $mobile = $data['mobile'];
  $email = $data['email'];
  $message = $data['message'];

$data['message'] = $this->restapi_model->contactSubmit($firstname,$lastname,$mobile,$email,$message);
$this->load->view('json', $data);
}

public function getTestimonial()
{
    $data['message'] = $this->restapi_model->getTestimonial();
    $this->load->view('json', $data);
}



public function getCategory()
{

$data['message'] = $this->category_model->getCategory();
$this->load->view('json', $data);
}

public function getCategoryById()
{
$id=$this->input->get_post("id");
$data["message"]=$this->category_model->getCategoryById($id);
$this->load->view("json",$data);
}



public function getProductsByCategory() {

    $categoryid = $this->input->get_post('categoryid');

    $subcategories  = $this->input->get_post("subcategories");

    $where = " ";
    if($subcategories != "")
    {
      $where .= " AND `productcategory`.`subcategory` IN ($subcategories) ";
    }

    $this->chintantable->createelement('`fynx_product`.`id`','1','ID', 'id');
    $this->chintantable->createelement('`fynx_product`.`name`','1','name', 'name');
    $this->chintantable->createelement('`fynx_product`.`image1`','1','image', 'image');
    $this->chintantable->createelement('`fynx_product`.`price`','1','price', 'price');
    $this->chintantable->createelement('`fynx_product`.`quantity`','1','quantity', 'quantity');

    $search = $this->input->get_post('search');
    $pageno = $this->input->get_post('pageno');
    $orderby = "price";
    if($orderby=="")
    {
    $orderby="id";
    $orderorder="ASC";
    }

    $maxrow = $this->input->get_post('maxrow');
     $data3["data"] =  $this->chintantable->query($pageno, $maxrow, $orderby, $orderorder, $search,"", "FROM `fynx_product` LEFT OUTER JOIN `productcategory` on `fynx_product`.id=`productcategory`.`product`","WHERE `fynx_product`.`category` = '$categoryid' AND `fynx_product`.`visibility`=1 AND `fynx_product`.`status`=2", "$where", "GROUP BY `fynx_product`.`id`");
$data3["filter"] = $this->restapi_model->getFiltersLater($data3["data"]->querycomplete);

        $data["message"] = $data3;
    $this->load->view('json', $data);
}


public function getProductDetail()
{
$id=$this->input->get_post("id");
$data["message"]=$this->product_model->getProductDetail($id);
$this->load->view("json",$data);
}

public function getRecipeDetail()
{
$id=$this->input->get_post("id");
$data["message"]=$this->recipes_model->getRecipeDetail($id);
$this->load->view("json",$data);
}

public function getRelatedProduct()
{
  $id=$this->input->get_post("id");
$this->chintantable->createelement('`fynx_product`.`id`','1','ID', 'id');
$this->chintantable->createelement('`fynx_product`.`name`','1','name', 'name');
$this->chintantable->createelement('`fynx_product`.`image1`','1','image', 'image');
$this->chintantable->createelement('`fynx_product`.`price`','1','price', 'price');
$this->chintantable->createelement('`fynx_product`.`quantity`','1','quantity', 'quantity');
$search=$this->input->get_post("search");
$pageno=$this->input->get_post("pageno");
$orderby=$this->input->get_post("orderby");
$orderorder=$this->input->get_post("orderorder");
$maxrow=$this->input->get_post("maxrow");
if($maxrow=="")
{
$maxrow=20;
}
if($orderby=="")
{
$orderby="id";
$orderorder="ASC";
}
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `relatedproduct` LEFT OUTER JOIN `fynx_product` ON `fynx_product`.`id`=`relatedproduct`.`relatedproduct` LEFT OUTER JOIN `fynx_designs` ON `fynx_designs`.`id`=`relatedproduct`.`design`","WHERE `relatedproduct`.`product`='$id'");
$this->load->view("json",$data);
}

public function getSubCategory()
{
$id=$this->input->get_post("id");
$data["message"]=$this->category_model->getSubCategory($id);
$this->load->view("json",$data);

}


public function signup()
{
    $data = json_decode(file_get_contents('php://input'), true);
    $firstname = $data['firstname'];
    $lastname = $data['lastname'];
    $email = $data['email'];
    $password = $data['password'];
    $data['message'] = $this->restapi_model->registeruser($firstname, $lastname, $email, $password);
    $this->load->view('json', $data);
}


    public function getalluseraddress()
    {
        $elements = array();
        $elements[0] = new stdClass();
        $elements[0]->field = '`fynx_useraddress`.`id`';
        $elements[0]->sort = '1';
        $elements[0]->header = 'ID';
        $elements[0]->alias = 'id';

        $elements = array();
        $elements[1] = new stdClass();
        $elements[1]->field = '`fynx_useraddress`.`user`';
        $elements[1]->sort = '1';
        $elements[1]->header = 'User';
        $elements[1]->alias = 'user';

        $elements = array();
        $elements[2] = new stdClass();
        $elements[2]->field = '`fynx_useraddress`.`name`';
        $elements[2]->sort = '1';
        $elements[2]->header = 'Name';
        $elements[2]->alias = 'name';

        $elements = array();
        $elements[3] = new stdClass();
        $elements[3]->field = '`fynx_useraddress`.`billingcity`';
        $elements[3]->sort = '1';
        $elements[3]->header = 'Billing City';
        $elements[3]->alias = 'billingcity';

        $elements = array();
        $elements[4] = new stdClass();
        $elements[4]->field = '`fynx_useraddress`.`billingstate`';
        $elements[4]->sort = '1';
        $elements[4]->header = 'Billing State';
        $elements[4]->alias = 'billingstate';

        $elements = array();
        $elements[5] = new stdClass();
        $elements[5]->field = '`fynx_useraddress`.`billingcountry`';
        $elements[5]->sort = '1';
        $elements[5]->header = 'Billing Country';
        $elements[5]->alias = 'billingcountry';

        $elements = array();
        $elements[6] = new stdClass();
        $elements[6]->field = '`fynx_useraddress`.`shippingcity`';
        $elements[6]->sort = '1';
        $elements[6]->header = 'Shipping City';
        $elements[6]->alias = 'shippingcity';

        $elements = array();
        $elements[7] = new stdClass();
        $elements[7]->field = '`fynx_useraddress`.`shippingstate`';
        $elements[7]->sort = '1';
        $elements[7]->header = 'Shipping State';
        $elements[7]->alias = 'shippingstate';

        $elements = array();
        $elements[8] = new stdClass();
        $elements[8]->field = '`fynx_useraddress`.`shippingcountry`';
        $elements[8]->sort = '1';
        $elements[8]->header = 'Shipping Country';
        $elements[8]->alias = 'shippingcountry';

        $elements = array();
        $elements[9] = new stdClass();
        $elements[9]->field = '`fynx_useraddress`.`shippingpincode`';
        $elements[9]->sort = '1';
        $elements[9]->header = 'Shipping Pincode';
        $elements[9]->alias = 'shippingpincode';

        $elements = array();
        $elements[10] = new stdClass();
        $elements[10]->field = '`fynx_useraddress`.`billingaddress`';
        $elements[10]->sort = '1';
        $elements[10]->header = 'Billing Address';
        $elements[10]->alias = 'billingaddress';

        $elements = array();
        $elements[11] = new stdClass();
        $elements[11]->field = '`fynx_useraddress`.`shippingaddress`';
        $elements[11]->sort = '1';
        $elements[11]->header = 'Shipping Address';
        $elements[11]->alias = 'shippingaddress';

        $search = $this->input->get_post('search');
        $pageno = $this->input->get_post('pageno');
        $orderby = $this->input->get_post('orderby');
        $orderorder = $this->input->get_post('orderorder');
        $maxrow = $this->input->get_post('maxrow');
        if ($maxrow == '') {
        }
        if ($orderby == '') {
            $orderby = 'id';
            $orderorder = 'ASC';
        }
        $data['message'] = $this->chintantable->query($pageno, $maxrow, $orderby, $orderorder, $search, $elements, 'FROM `fynx_useraddress`');
        $this->load->view('json', $data);
    }
    public function getsingleuseraddress()
    {
        $id = $this->input->get_post('id');
        $data['message'] = $this->useraddress_model->getsingleuseraddress($id);
        $this->load->view('json', $data);
    }
    public function getallcart()
    {
        $elements = array();
        $elements[0] = new stdClass();
        $elements[0]->field = '`fynx_cart`.`id`';
        $elements[0]->sort = '1';
        $elements[0]->header = 'ID';
        $elements[0]->alias = 'id';

        $elements = array();
        $elements[1] = new stdClass();
        $elements[1]->field = '`fynx_cart`.`user`';
        $elements[1]->sort = '1';
        $elements[1]->header = 'User';
        $elements[1]->alias = 'user';

        $elements = array();
        $elements[2] = new stdClass();
        $elements[2]->field = '`fynx_cart`.`quantity`';
        $elements[2]->sort = '1';
        $elements[2]->header = 'Quantity';
        $elements[2]->alias = 'quantity';

        $elements = array();
        $elements[3] = new stdClass();
        $elements[3]->field = '`fynx_cart`.`product`';
        $elements[3]->sort = '1';
        $elements[3]->header = 'Product';
        $elements[3]->alias = 'product';

        $elements = array();
        $elements[4] = new stdClass();
        $elements[4]->field = '`fynx_cart`.`timestamp`';
        $elements[4]->sort = '1';
        $elements[4]->header = 'Timestamp';
        $elements[4]->alias = 'timestamp';

        $search = $this->input->get_post('search');
        $pageno = $this->input->get_post('pageno');
        $orderby = $this->input->get_post('orderby');
        $orderorder = $this->input->get_post('orderorder');
        $maxrow = $this->input->get_post('maxrow');
        if ($maxrow == '') {
        }
        if ($orderby == '') {
            $orderby = 'id';
            $orderorder = 'ASC';
        }
        $data['message'] = $this->chintantable->query($pageno, $maxrow, $orderby, $orderorder, $search, $elements, 'FROM `fynx_cart`');
        $this->load->view('json', $data);
    }
    public function getsinglecart()
    {
        $id = $this->input->get_post('id');
        $data['message'] = $this->cart_model->getsinglecart($id);
        $this->load->view('json', $data);
    }
    public function getallwishlist()
    {
        $elements = array();
        $elements[0] = new stdClass();
        $elements[0]->field = '`fynx_wishlist`.`id`';
        $elements[0]->sort = '1';
        $elements[0]->header = 'ID';
        $elements[0]->alias = 'id';

        $elements = array();
        $elements[1] = new stdClass();
        $elements[1]->field = '`fynx_wishlist`.`user`';
        $elements[1]->sort = '1';
        $elements[1]->header = 'User';
        $elements[1]->alias = 'user';

        $elements = array();
        $elements[2] = new stdClass();
        $elements[2]->field = '`fynx_wishlist`.`product`';
        $elements[2]->sort = '1';
        $elements[2]->header = 'Product';
        $elements[2]->alias = 'product';

        $elements = array();
        $elements[3] = new stdClass();
        $elements[3]->field = '`fynx_wishlist`.`timestamp`';
        $elements[3]->sort = '1';
        $elements[3]->header = 'Timestamp';
        $elements[3]->alias = 'timestamp';

        $search = $this->input->get_post('search');
        $pageno = $this->input->get_post('pageno');
        $orderby = $this->input->get_post('orderby');
        $orderorder = $this->input->get_post('orderorder');
        $maxrow = $this->input->get_post('maxrow');
        if ($maxrow == '') {
        }
        if ($orderby == '') {
            $orderby = 'id';
            $orderorder = 'ASC';
        }
        $data['message'] = $this->chintantable->query($pageno, $maxrow, $orderby, $orderorder, $search, $elements, 'FROM `fynx_wishlist`');
        $this->load->view('json', $data);
    }
    public function getsinglewishlist()
    {
        $id = $this->input->get_post('id');
        $data['message'] = $this->wishlist_model->getsinglewishlist($id);
        $this->load->view('json', $data);
    }
    public function getallcredit()
    {
        $elements = array();
        $elements[0] = new stdClass();
        $elements[0]->field = '`fynx_credit`.`id`';
        $elements[0]->sort = '1';
        $elements[0]->header = 'ID';
        $elements[0]->alias = 'id';

        $elements = array();
        $elements[1] = new stdClass();
        $elements[1]->field = '`fynx_credit`.`user`';
        $elements[1]->sort = '1';
        $elements[1]->header = 'User';
        $elements[1]->alias = 'user';

        $elements = array();
        $elements[2] = new stdClass();
        $elements[2]->field = '`fynx_credit`.`credit`';
        $elements[2]->sort = '1';
        $elements[2]->header = 'Credit';
        $elements[2]->alias = 'credit';

        $elements = array();
        $elements[3] = new stdClass();
        $elements[3]->field = '`fynx_credit`.`addcredit`';
        $elements[3]->sort = '1';
        $elements[3]->header = 'Add Credit';
        $elements[3]->alias = 'addcredit';

        $search = $this->input->get_post('search');
        $pageno = $this->input->get_post('pageno');
        $orderby = $this->input->get_post('orderby');
        $orderorder = $this->input->get_post('orderorder');
        $maxrow = $this->input->get_post('maxrow');
        if ($maxrow == '') {
        }
        if ($orderby == '') {
            $orderby = 'id';
            $orderorder = 'ASC';
        }
        $data['message'] = $this->chintantable->query($pageno, $maxrow, $orderby, $orderorder, $search, $elements, 'FROM `fynx_credit`');
        $this->load->view('json', $data);
    }
    public function getsinglecredit()
    {
        $id = $this->input->get_post('id');
        $data['message'] = $this->credit_model->getsinglecredit($id);
        $this->load->view('json', $data);
    }
    public function getallproduct()
    {
        $elements = array();
        $elements[0] = new stdClass();
        $elements[0]->field = '`fynx_product`.`id`';
        $elements[0]->sort = '1';
        $elements[0]->header = 'ID';
        $elements[0]->alias = 'id';

        $elements = array();
        $elements[1] = new stdClass();
        $elements[1]->field = '`fynx_product`.`subcategory`';
        $elements[1]->sort = '1';
        $elements[1]->header = 'Subcategory';
        $elements[1]->alias = 'subcategory';

        $elements = array();
        $elements[2] = new stdClass();
        $elements[2]->field = '`fynx_product`.`quantity`';
        $elements[2]->sort = '1';
        $elements[2]->header = 'Quantity';
        $elements[2]->alias = 'quantity';

        $elements = array();
        $elements[3] = new stdClass();
        $elements[3]->field = '`fynx_product`.`name`';
        $elements[3]->sort = '1';
        $elements[3]->header = 'Name';
        $elements[3]->alias = 'name';

        $elements = array();
        $elements[4] = new stdClass();
        $elements[4]->field = '`fynx_product`.`type`';
        $elements[4]->sort = '1';
        $elements[4]->header = 'Type';
        $elements[4]->alias = 'type';

        $elements = array();
        $elements[5] = new stdClass();
        $elements[5]->field = '`fynx_product`.`description`';
        $elements[5]->sort = '1';
        $elements[5]->header = 'Description';
        $elements[5]->alias = 'description';

        $elements = array();
        $elements[6] = new stdClass();
        $elements[6]->field = '`fynx_product`.`visibility`';
        $elements[6]->sort = '1';
        $elements[6]->header = 'Visibility';
        $elements[6]->alias = 'visibility';

        $elements = array();
        $elements[7] = new stdClass();
        $elements[7]->field = '`fynx_product`.`price`';
        $elements[7]->sort = '1';
        $elements[7]->header = 'Price';
        $elements[7]->alias = 'price';

        $elements = array();
        $elements[8] = new stdClass();
        $elements[8]->field = '`fynx_product`.`relatedproduct`';
        $elements[8]->sort = '1';
        $elements[8]->header = 'Related Product';
        $elements[8]->alias = 'relatedproduct';

        $elements = array();
        $elements[9] = new stdClass();
        $elements[9]->field = '`fynx_product`.`category`';
        $elements[9]->sort = '1';
        $elements[9]->header = 'Category';
        $elements[9]->alias = 'category';

        $elements = array();
        $elements[10] = new stdClass();
        $elements[10]->field = '`fynx_product`.`color`';
        $elements[10]->sort = '1';
        $elements[10]->header = 'Color';
        $elements[10]->alias = 'color';

        $elements = array();
        $elements[11] = new stdClass();
        $elements[11]->field = '`fynx_product`.`size`';
        $elements[11]->sort = '1';
        $elements[11]->header = 'Size';
        $elements[11]->alias = 'size';

        $elements = array();
        $elements[12] = new stdClass();
        $elements[12]->field = '`fynx_product`.`sizechart`';
        $elements[12]->sort = '1';
        $elements[12]->header = 'Size Chart';
        $elements[12]->alias = 'sizechart';

        $elements = array();
        $elements[13] = new stdClass();
        $elements[13]->field = '`fynx_product`.`status`';
        $elements[13]->sort = '1';
        $elements[13]->header = 'Status';
        $elements[13]->alias = 'status';

        $search = $this->input->get_post('search');
        $pageno = $this->input->get_post('pageno');
        $orderby = $this->input->get_post('orderby');
        $orderorder = $this->input->get_post('orderorder');
        $maxrow = $this->input->get_post('maxrow');
        if ($maxrow == '') {
        }
        if ($orderby == '') {
            $orderby = 'id';
            $orderorder = 'ASC';
        }
        $data['message'] = $this->chintantable->query($pageno, $maxrow, $orderby, $orderorder, $search, $elements, 'FROM `fynx_product`');
        $this->load->view('json', $data);
    }
    public function getsingleproduct()
    {
        $id = $this->input->get_post('id');
        $data['message'] = $this->product_model->getsingleproduct($id);
        $this->load->view('json', $data);
    }
    public function getallproductimage()
    {
        $elements = array();
        $elements[0] = new stdClass();
        $elements[0]->field = '`fynx_productimage`.`id`';
        $elements[0]->sort = '1';
        $elements[0]->header = 'ID';
        $elements[0]->alias = 'id';

        $elements = array();
        $elements[1] = new stdClass();
        $elements[1]->field = '`fynx_productimage`.`product`';
        $elements[1]->sort = '1';
        $elements[1]->header = 'Product';
        $elements[1]->alias = 'product';

        $elements = array();
        $elements[2] = new stdClass();
        $elements[2]->field = '`fynx_productimage`.`order`';
        $elements[2]->sort = '1';
        $elements[2]->header = 'Order';
        $elements[2]->alias = 'order';

        $elements = array();
        $elements[3] = new stdClass();
        $elements[3]->field = '`fynx_productimage`.`image`';
        $elements[3]->sort = '1';
        $elements[3]->header = 'Image';
        $elements[3]->alias = 'image';

        $elements = array();
        $elements[4] = new stdClass();
        $elements[4]->field = '`fynx_productimage`.`status`';
        $elements[4]->sort = '1';
        $elements[4]->header = 'Status';
        $elements[4]->alias = 'status';

        $search = $this->input->get_post('search');
        $pageno = $this->input->get_post('pageno');
        $orderby = $this->input->get_post('orderby');
        $orderorder = $this->input->get_post('orderorder');
        $maxrow = $this->input->get_post('maxrow');
        if ($maxrow == '') {
        }
        if ($orderby == '') {
            $orderby = 'id';
            $orderorder = 'ASC';
        }
        $data['message'] = $this->chintantable->query($pageno, $maxrow, $orderby, $orderorder, $search, $elements, 'FROM `fynx_productimage`');
        $this->load->view('json', $data);
    }
    public function getsingleproductimage()
    {
        $id = $this->input->get_post('id');
        $data['message'] = $this->productimage_model->getsingleproductimage($id);
        $this->load->view('json', $data);
    }
    public function getalldesigner()
    {
        $elements = array();
        $elements[0] = new stdClass();
        $elements[0]->field = '`fynx_designer`.`id`';
        $elements[0]->sort = '1';
        $elements[0]->header = 'ID';
        $elements[0]->alias = 'id';

        $elements = array();
        $elements[1] = new stdClass();
        $elements[1]->field = '`fynx_designer`.`email`';
        $elements[1]->sort = '1';
        $elements[1]->header = 'Email Id';
        $elements[1]->alias = 'email';

        $elements = array();
        $elements[2] = new stdClass();
        $elements[2]->field = '`fynx_designer`.`noofdesigns`';
        $elements[2]->sort = '1';
        $elements[2]->header = 'No of Designs';
        $elements[2]->alias = 'noofdesigns';

        $elements = array();
        $elements[3] = new stdClass();
        $elements[3]->field = '`fynx_designer`.`designerid`';
        $elements[3]->sort = '1';
        $elements[3]->header = 'Designer Id';
        $elements[3]->alias = 'designerid';

        $elements = array();
        $elements[4] = new stdClass();
        $elements[4]->field = '`fynx_designer`.`name`';
        $elements[4]->sort = '1';
        $elements[4]->header = 'Name';
        $elements[4]->alias = 'name';

        $elements = array();
        $elements[5] = new stdClass();
        $elements[5]->field = '`fynx_designer`.`contact`';
        $elements[5]->sort = '1';
        $elements[5]->header = 'Contact';
        $elements[5]->alias = 'contact';

        $elements = array();
        $elements[6] = new stdClass();
        $elements[6]->field = '`fynx_designer`.`commission`';
        $elements[6]->sort = '1';
        $elements[6]->header = 'Commission in %';
        $elements[6]->alias = 'commission';

        $search = $this->input->get_post('search');
        $pageno = $this->input->get_post('pageno');
        $orderby = $this->input->get_post('orderby');
        $orderorder = $this->input->get_post('orderorder');
        $maxrow = $this->input->get_post('maxrow');
        if ($maxrow == '') {
        }
        if ($orderby == '') {
            $orderby = 'id';
            $orderorder = 'ASC';
        }
        $data['message'] = $this->chintantable->query($pageno, $maxrow, $orderby, $orderorder, $search, $elements, 'FROM `fynx_designer`');
        $this->load->view('json', $data);
    }
    public function getsingledesigner()
    {
        $id = $this->input->get_post('id');
        $data['message'] = $this->designer_model->getsingledesigner($id);
        $this->load->view('json', $data);
    }
    public function getalldesigns()
    {
        $elements = array();
        $elements[0] = new stdClass();
        $elements[0]->field = '`fynx_designs`.`id`';
        $elements[0]->sort = '1';
        $elements[0]->header = 'ID';
        $elements[0]->alias = 'id';

        $elements = array();
        $elements[1] = new stdClass();
        $elements[1]->field = '`fynx_designs`.`designer`';
        $elements[1]->sort = '1';
        $elements[1]->header = 'Designer';
        $elements[1]->alias = 'designer';

        $elements = array();
        $elements[2] = new stdClass();
        $elements[2]->field = '`fynx_designs`.`image`';
        $elements[2]->sort = '1';
        $elements[2]->header = 'Image';
        $elements[2]->alias = 'image';

        $elements = array();
        $elements[3] = new stdClass();
        $elements[3]->field = '`fynx_designs`.`status`';
        $elements[3]->sort = '1';
        $elements[3]->header = 'Status';
        $elements[3]->alias = 'status';

        $elements = array();
        $elements[4] = new stdClass();
        $elements[4]->field = '`fynx_designs`.`timestamp`';
        $elements[4]->sort = '1';
        $elements[4]->header = 'Timestamp';
        $elements[4]->alias = 'timestamp';

        $search = $this->input->get_post('search');
        $pageno = $this->input->get_post('pageno');
        $orderby = $this->input->get_post('orderby');
        $orderorder = $this->input->get_post('orderorder');
        $maxrow = $this->input->get_post('maxrow');
        if ($maxrow == '') {
        }
        if ($orderby == '') {
            $orderby = 'id';
            $orderorder = 'ASC';
        }
        $data['message'] = $this->chintantable->query($pageno, $maxrow, $orderby, $orderorder, $search, $elements, 'FROM `fynx_designs`');
        $this->load->view('json', $data);
    }
    public function getsingledesigns()
    {
        $id = $this->input->get_post('id');
        $data['message'] = $this->designs_model->getsingledesigns($id);
        $this->load->view('json', $data);
    }
    public function getallhomeslide()
    {
        $elements = array();
        $elements[0] = new stdClass();
        $elements[0]->field = '`fynx_homeslide`.`id`';
        $elements[0]->sort = '1';
        $elements[0]->header = 'ID';
        $elements[0]->alias = 'id';

        $elements = array();
        $elements[1] = new stdClass();
        $elements[1]->field = '`fynx_homeslide`.`name`';
        $elements[1]->sort = '1';
        $elements[1]->header = 'Name';
        $elements[1]->alias = 'name';

        $elements = array();
        $elements[2] = new stdClass();
        $elements[2]->field = '`fynx_homeslide`.`link`';
        $elements[2]->sort = '1';
        $elements[2]->header = 'Link';
        $elements[2]->alias = 'link';

        $elements = array();
        $elements[3] = new stdClass();
        $elements[3]->field = '`fynx_homeslide`.`target`';
        $elements[3]->sort = '1';
        $elements[3]->header = 'Target';
        $elements[3]->alias = 'target';

        $elements = array();
        $elements[4] = new stdClass();
        $elements[4]->field = '`fynx_homeslide`.`status`';
        $elements[4]->sort = '1';
        $elements[4]->header = 'Status';
        $elements[4]->alias = 'status';

        $elements = array();
        $elements[5] = new stdClass();
        $elements[5]->field = '`fynx_homeslide`.`image`';
        $elements[5]->sort = '1';
        $elements[5]->header = 'Image';
        $elements[5]->alias = 'image';

        $elements = array();
        $elements[6] = new stdClass();
        $elements[6]->field = '`fynx_homeslide`.`template`';
        $elements[6]->sort = '1';
        $elements[6]->header = 'Template';
        $elements[6]->alias = 'template';

        $elements = array();
        $elements[7] = new stdClass();
        $elements[7]->field = '`fynx_homeslide`.`class`';
        $elements[7]->sort = '1';
        $elements[7]->header = 'Class';
        $elements[7]->alias = 'class';

        $elements = array();
        $elements[8] = new stdClass();
        $elements[8]->field = '`fynx_homeslide`.`text`';
        $elements[8]->sort = '1';
        $elements[8]->header = 'Text';
        $elements[8]->alias = 'text';

        $elements = array();
        $elements[9] = new stdClass();
        $elements[9]->field = '`fynx_homeslide`.`centeralign`';
        $elements[9]->sort = '1';
        $elements[9]->header = 'Center Align';
        $elements[9]->alias = 'centeralign';

        $search = $this->input->get_post('search');
        $pageno = $this->input->get_post('pageno');
        $orderby = $this->input->get_post('orderby');
        $orderorder = $this->input->get_post('orderorder');
        $maxrow = $this->input->get_post('maxrow');
        if ($maxrow == '') {
        }
        if ($orderby == '') {
            $orderby = 'id';
            $orderorder = 'ASC';
        }
        $data['message'] = $this->chintantable->query($pageno, $maxrow, $orderby, $orderorder, $search, $elements, 'FROM `fynx_homeslide`');
        $this->load->view('json', $data);
    }
    public function getsinglehomeslide()
    {
        $id = $this->input->get_post('id');
        $data['message'] = $this->homeslide_model->getsinglehomeslide($id);
        $this->load->view('json', $data);
    }
    public function getalltype()
    {
        $elements = array();
        $elements[0] = new stdClass();
        $elements[0]->field = '`fynx_type`.`id`';
        $elements[0]->sort = '1';
        $elements[0]->header = 'ID';
        $elements[0]->alias = 'id';

        $elements = array();
        $elements[1] = new stdClass();
        $elements[1]->field = '`fynx_type`.`name`';
        $elements[1]->sort = '1';
        $elements[1]->header = 'Name';
        $elements[1]->alias = 'name';

        $elements = array();
        $elements[2] = new stdClass();
        $elements[2]->field = '`fynx_type`.`status`';
        $elements[2]->sort = '1';
        $elements[2]->header = 'Status';
        $elements[2]->alias = 'status';

        $elements = array();
        $elements[3] = new stdClass();
        $elements[3]->field = '`fynx_type`.`timestamp`';
        $elements[3]->sort = '1';
        $elements[3]->header = 'Timestamp';
        $elements[3]->alias = 'timestamp';

        $search = $this->input->get_post('search');
        $pageno = $this->input->get_post('pageno');
        $orderby = $this->input->get_post('orderby');
        $orderorder = $this->input->get_post('orderorder');
        $maxrow = $this->input->get_post('maxrow');
        if ($maxrow == '') {
        }
        if ($orderby == '') {
            $orderby = 'id';
            $orderorder = 'ASC';
        }
        $data['message'] = $this->chintantable->query($pageno, $maxrow, $orderby, $orderorder, $search, $elements, 'FROM `fynx_type`');
        $this->load->view('json', $data);
    }
    public function getsingletype()
    {
        $id = $this->input->get_post('id');
        $data['message'] = $this->type_model->getsingletype($id);
        $this->load->view('json', $data);
    }
    public function getallcategory()
    {
        $elements = array();
        $elements[0] = new stdClass();
        $elements[0]->field = '`fynx_category`.`id`';
        $elements[0]->sort = '1';
        $elements[0]->header = 'ID';
        $elements[0]->alias = 'id';

        $elements = array();
        $elements[1] = new stdClass();
        $elements[1]->field = '`fynx_category`.`order`';
        $elements[1]->sort = '1';
        $elements[1]->header = 'Order';
        $elements[1]->alias = 'order';

        $elements = array();
        $elements[2] = new stdClass();
        $elements[2]->field = '`fynx_category`.`name`';
        $elements[2]->sort = '1';
        $elements[2]->header = 'Name';
        $elements[2]->alias = 'name';

        $elements = array();
        $elements[3] = new stdClass();
        $elements[3]->field = '`fynx_category`.`parent`';
        $elements[3]->sort = '1';
        $elements[3]->header = 'Parent';
        $elements[3]->alias = 'parent';

        $elements = array();
        $elements[4] = new stdClass();
        $elements[4]->field = '`fynx_category`.`status`';
        $elements[4]->sort = '1';
        $elements[4]->header = 'Status';
        $elements[4]->alias = 'status';

        $elements = array();
        $elements[5] = new stdClass();
        $elements[5]->field = '`fynx_category`.`image1`';
        $elements[5]->sort = '1';
        $elements[5]->header = 'Image1';
        $elements[5]->alias = 'image1';

        $elements = array();
        $elements[6] = new stdClass();
        $elements[6]->field = '`fynx_category`.`image2`';
        $elements[6]->sort = '1';
        $elements[6]->header = 'Image2';
        $elements[6]->alias = 'image2';

        $search = $this->input->get_post('search');
        $pageno = $this->input->get_post('pageno');
        $orderby = $this->input->get_post('orderby');
        $orderorder = $this->input->get_post('orderorder');
        $maxrow = $this->input->get_post('maxrow');
        if ($maxrow == '') {
        }
        if ($orderby == '') {
            $orderby = 'id';
            $orderorder = 'ASC';
        }
        $data['message'] = $this->chintantable->query($pageno, $maxrow, $orderby, $orderorder, $search, $elements, 'FROM `fynx_category`');
        $this->load->view('json', $data);
    }
    public function getsinglecategory()
    {
        $id = $this->input->get_post('id');
        $data['message'] = $this->category_model->getsinglecategory($id);
        $this->load->view('json', $data);
    }
    public function getallcolor()
    {
        $elements = array();
        $elements[0] = new stdClass();
        $elements[0]->field = '`fynx_color`.`id`';
        $elements[0]->sort = '1';
        $elements[0]->header = 'ID';
        $elements[0]->alias = 'id';

        $elements = array();
        $elements[1] = new stdClass();
        $elements[1]->field = '`fynx_color`.`name`';
        $elements[1]->sort = '1';
        $elements[1]->header = 'Name';
        $elements[1]->alias = 'name';

        $elements = array();
        $elements[2] = new stdClass();
        $elements[2]->field = '`fynx_color`.`status`';
        $elements[2]->sort = '1';
        $elements[2]->header = 'Status';
        $elements[2]->alias = 'status';

        $elements = array();
        $elements[3] = new stdClass();
        $elements[3]->field = '`fynx_color`.`timestamp`';
        $elements[3]->sort = '1';
        $elements[3]->header = 'Timestamp';
        $elements[3]->alias = 'timestamp';

        $search = $this->input->get_post('search');
        $pageno = $this->input->get_post('pageno');
        $orderby = $this->input->get_post('orderby');
        $orderorder = $this->input->get_post('orderorder');
        $maxrow = $this->input->get_post('maxrow');
        if ($maxrow == '') {
        }
        if ($orderby == '') {
            $orderby = 'id';
            $orderorder = 'ASC';
        }
        $data['message'] = $this->chintantable->query($pageno, $maxrow, $orderby, $orderorder, $search, $elements, 'FROM `fynx_color`');
        $this->load->view('json', $data);
    }
    public function getsinglecolor()
    {
        $id = $this->input->get_post('id');
        $data['message'] = $this->color_model->getsinglecolor($id);
        $this->load->view('json', $data);
    }
    public function getalloffer()
    {
        $elements = array();
        $elements[0] = new stdClass();
        $elements[0]->field = '`fynx_offer`.`id`';
        $elements[0]->sort = '1';
        $elements[0]->header = 'ID';
        $elements[0]->alias = 'id';

        $elements = array();
        $elements[1] = new stdClass();
        $elements[1]->field = '`fynx_offer`.`title`';
        $elements[1]->sort = '1';
        $elements[1]->header = 'Title';
        $elements[1]->alias = 'title';

        $elements = array();
        $elements[2] = new stdClass();
        $elements[2]->field = '`fynx_offer`.`description`';
        $elements[2]->sort = '1';
        $elements[2]->header = 'Description';
        $elements[2]->alias = 'description';

        $elements = array();
        $elements[3] = new stdClass();
        $elements[3]->field = '`fynx_offer`.`price`';
        $elements[3]->sort = '1';
        $elements[3]->header = 'Price';
        $elements[3]->alias = 'price';

        $elements = array();
        $elements[4] = new stdClass();
        $elements[4]->field = '`fynx_offer`.`status`';
        $elements[4]->sort = '1';
        $elements[4]->header = 'Status';
        $elements[4]->alias = 'status';

        $elements = array();
        $elements[5] = new stdClass();
        $elements[5]->field = '`fynx_offer`.`image`';
        $elements[5]->sort = '1';
        $elements[5]->header = 'Image';
        $elements[5]->alias = 'image';

        $elements = array();
        $elements[6] = new stdClass();
        $elements[6]->field = '`fynx_offer`.`fromdate`';
        $elements[6]->sort = '1';
        $elements[6]->header = 'From Date';
        $elements[6]->alias = 'fromdate';

        $elements = array();
        $elements[7] = new stdClass();
        $elements[7]->field = '`fynx_offer`.`todate`';
        $elements[7]->sort = '1';
        $elements[7]->header = 'To Date';
        $elements[7]->alias = 'todate';

        $search = $this->input->get_post('search');
        $pageno = $this->input->get_post('pageno');
        $orderby = $this->input->get_post('orderby');
        $orderorder = $this->input->get_post('orderorder');
        $maxrow = $this->input->get_post('maxrow');
        if ($maxrow == '') {
        }
        if ($orderby == '') {
            $orderby = 'id';
            $orderorder = 'ASC';
        }
        $data['message'] = $this->chintantable->query($pageno, $maxrow, $orderby, $orderorder, $search, $elements, 'FROM `fynx_offer`');
        $this->load->view('json', $data);
    }
    public function getsingleoffer()
    {
        $id = $this->input->get_post('id');
        $data['message'] = $this->offer_model->getsingleoffer($id);
        $this->load->view('json', $data);
    }
    public function getallofferproduct()
    {
        $elements = array();
        $elements[0] = new stdClass();
        $elements[0]->field = '`fynx_offerproduct`.`id`';
        $elements[0]->sort = '1';
        $elements[0]->header = 'ID';
        $elements[0]->alias = 'id';

        $elements = array();
        $elements[1] = new stdClass();
        $elements[1]->field = '`fynx_offerproduct`.`offer`';
        $elements[1]->sort = '1';
        $elements[1]->header = 'Offer';
        $elements[1]->alias = 'offer';

        $elements = array();
        $elements[2] = new stdClass();
        $elements[2]->field = '`fynx_offerproduct`.`product`';
        $elements[2]->sort = '1';
        $elements[2]->header = 'Product';
        $elements[2]->alias = 'product';

        $elements = array();
        $elements[3] = new stdClass();
        $elements[3]->field = '`fynx_offerproduct`.`quantity`';
        $elements[3]->sort = '1';
        $elements[3]->header = 'Quantity';
        $elements[3]->alias = 'quantity';

        $search = $this->input->get_post('search');
        $pageno = $this->input->get_post('pageno');
        $orderby = $this->input->get_post('orderby');
        $orderorder = $this->input->get_post('orderorder');
        $maxrow = $this->input->get_post('maxrow');
        if ($maxrow == '') {
        }
        if ($orderby == '') {
            $orderby = 'id';
            $orderorder = 'ASC';
        }
        $data['message'] = $this->chintantable->query($pageno, $maxrow, $orderby, $orderorder, $search, $elements, 'FROM `fynx_offerproduct`');
        $this->load->view('json', $data);
    }
    public function getsingleofferproduct()
    {
        $id = $this->input->get_post('id');
        $data['message'] = $this->offerproduct_model->getsingleofferproduct($id);
        $this->load->view('json', $data);
    }
    public function getallsubcategory()
    {
        $elements = array();
        $elements[0] = new stdClass();
        $elements[0]->field = '`fynx_subcategory`.`id`';
        $elements[0]->sort = '1';
        $elements[0]->header = 'ID';
        $elements[0]->alias = 'id';

        $elements = array();
        $elements[1] = new stdClass();
        $elements[1]->field = '`fynx_subcategory`.`category`';
        $elements[1]->sort = '1';
        $elements[1]->header = 'Category';
        $elements[1]->alias = 'category';

        $elements = array();
        $elements[2] = new stdClass();
        $elements[2]->field = '`fynx_subcategory`.`name`';
        $elements[2]->sort = '1';
        $elements[2]->header = 'Name';
        $elements[2]->alias = 'name';

        $elements = array();
        $elements[3] = new stdClass();
        $elements[3]->field = '`fynx_subcategory`.`order`';
        $elements[3]->sort = '1';
        $elements[3]->header = 'Order';
        $elements[3]->alias = 'order';

        $elements = array();
        $elements[4] = new stdClass();
        $elements[4]->field = '`fynx_subcategory`.`status`';
        $elements[4]->sort = '1';
        $elements[4]->header = 'Status';
        $elements[4]->alias = 'status';

        $elements = array();
        $elements[5] = new stdClass();
        $elements[5]->field = '`fynx_subcategory`.`image1`';
        $elements[5]->sort = '1';
        $elements[5]->header = 'Image1';
        $elements[5]->alias = 'image1';

        $elements = array();
        $elements[6] = new stdClass();
        $elements[6]->field = '`fynx_subcategory`.`image2`';
        $elements[6]->sort = '1';
        $elements[6]->header = 'Image2';
        $elements[6]->alias = 'image2';

        $search = $this->input->get_post('search');
        $pageno = $this->input->get_post('pageno');
        $orderby = $this->input->get_post('orderby');
        $orderorder = $this->input->get_post('orderorder');
        $maxrow = $this->input->get_post('maxrow');
        if ($maxrow == '') {
        }
        if ($orderby == '') {
            $orderby = 'id';
            $orderorder = 'ASC';
        }
        $data['message'] = $this->chintantable->query($pageno, $maxrow, $orderby, $orderorder, $search, $elements, 'FROM `fynx_subcategory`');
        $this->load->view('json', $data);
    }
    public function getsinglesubcategory()
    {
        $id = $this->input->get_post('id');
        $data['message'] = $this->subcategory_model->getsinglesubcategory($id);
        $this->load->view('json', $data);
    }
    public function getallorder()
    {
        $elements = array();
        $elements[0] = new stdClass();
        $elements[0]->field = '`fynx_order`.`id`';
        $elements[0]->sort = '1';
        $elements[0]->header = 'ID';
        $elements[0]->alias = 'id';

        $elements = array();
        $elements[1] = new stdClass();
        $elements[1]->field = '`fynx_order`.`user`';
        $elements[1]->sort = '1';
        $elements[1]->header = 'User';
        $elements[1]->alias = 'user';

        $elements = array();
        $elements[2] = new stdClass();
        $elements[2]->field = '`fynx_order`.`firstname`';
        $elements[2]->sort = '1';
        $elements[2]->header = 'First Name';
        $elements[2]->alias = 'firstname';

        $elements = array();
        $elements[3] = new stdClass();
        $elements[3]->field = '`fynx_order`.`lastname`';
        $elements[3]->sort = '1';
        $elements[3]->header = 'Last Name';
        $elements[3]->alias = 'lastname';

        $elements = array();
        $elements[4] = new stdClass();
        $elements[4]->field = '`fynx_order`.`email`';
        $elements[4]->sort = '1';
        $elements[4]->header = 'Email Id';
        $elements[4]->alias = 'email';

        $elements = array();
        $elements[5] = new stdClass();
        $elements[5]->field = '`fynx_order`.`billingaddress`';
        $elements[5]->sort = '1';
        $elements[5]->header = 'Billing Address';
        $elements[5]->alias = 'billingaddress';

        $elements = array();
        $elements[6] = new stdClass();
        $elements[6]->field = '`fynx_order`.`billingcontact`';
        $elements[6]->sort = '1';
        $elements[6]->header = 'Billing Contact';
        $elements[6]->alias = 'billingcontact';

        $elements = array();
        $elements[7] = new stdClass();
        $elements[7]->field = '`fynx_order`.`billingcity`';
        $elements[7]->sort = '1';
        $elements[7]->header = 'Billing City';
        $elements[7]->alias = 'billingcity';

        $elements = array();
        $elements[8] = new stdClass();
        $elements[8]->field = '`fynx_order`.`billingstate`';
        $elements[8]->sort = '1';
        $elements[8]->header = 'Billing State';
        $elements[8]->alias = 'billingstate';

        $elements = array();
        $elements[9] = new stdClass();
        $elements[9]->field = '`fynx_order`.`billingpincode`';
        $elements[9]->sort = '1';
        $elements[9]->header = 'Billing Pincode';
        $elements[9]->alias = 'billingpincode';

        $elements = array();
        $elements[10] = new stdClass();
        $elements[10]->field = '`fynx_order`.`billingcountry`';
        $elements[10]->sort = '1';
        $elements[10]->header = 'Billing Country';
        $elements[10]->alias = 'billingcountry';

        $elements = array();
        $elements[11] = new stdClass();
        $elements[11]->field = '`fynx_order`.`shippingcity`';
        $elements[11]->sort = '1';
        $elements[11]->header = 'Shipping City';
        $elements[11]->alias = 'shippingcity';

        $elements = array();
        $elements[12] = new stdClass();
        $elements[12]->field = '`fynx_order`.`shippingaddress`';
        $elements[12]->sort = '1';
        $elements[12]->header = 'Shipping Address';
        $elements[12]->alias = 'shippingaddress';

        $elements = array();
        $elements[13] = new stdClass();
        $elements[13]->field = '`fynx_order`.`shippingname`';
        $elements[13]->sort = '1';
        $elements[13]->header = 'Shipping Name';
        $elements[13]->alias = 'shippingname';

        $elements = array();
        $elements[14] = new stdClass();
        $elements[14]->field = '`fynx_order`.`shippingcountry`';
        $elements[14]->sort = '1';
        $elements[14]->header = 'Shipping Country';
        $elements[14]->alias = 'shippingcountry';

        $elements = array();
        $elements[15] = new stdClass();
        $elements[15]->field = '`fynx_order`.`shippingcontact`';
        $elements[15]->sort = '1';
        $elements[15]->header = 'Shipping Contact';
        $elements[15]->alias = 'shippingcontact';

        $elements = array();
        $elements[16] = new stdClass();
        $elements[16]->field = '`fynx_order`.`shippingstate`';
        $elements[16]->sort = '1';
        $elements[16]->header = 'shippingstate';
        $elements[16]->alias = 'shippingstate';

        $elements = array();
        $elements[17] = new stdClass();
        $elements[17]->field = '`fynx_order`.`shippingpincode`';
        $elements[17]->sort = '1';
        $elements[17]->header = 'Shipping Pincode';
        $elements[17]->alias = 'shippingpincode';

        $elements = array();
        $elements[18] = new stdClass();
        $elements[18]->field = '`fynx_order`.`trackingcode`';
        $elements[18]->sort = '1';
        $elements[18]->header = 'Tracking Code';
        $elements[18]->alias = 'trackingcode';

        $elements = array();
        $elements[19] = new stdClass();
        $elements[19]->field = '`fynx_order`.`defaultcurrency`';
        $elements[19]->sort = '1';
        $elements[19]->header = 'Default Currency';
        $elements[19]->alias = 'defaultcurrency';

        $elements = array();
        $elements[20] = new stdClass();
        $elements[20]->field = '`fynx_order`.`shippingmethod`';
        $elements[20]->sort = '1';
        $elements[20]->header = 'Shipping Method';
        $elements[20]->alias = 'shippingmethod';

        $elements = array();
        $elements[21] = new stdClass();
        $elements[21]->field = '`fynx_order`.`orderstatus`';
        $elements[21]->sort = '1';
        $elements[21]->header = 'Order Status';
        $elements[21]->alias = 'orderstatus';

        $search = $this->input->get_post('search');
        $pageno = $this->input->get_post('pageno');
        $orderby = $this->input->get_post('orderby');
        $orderorder = $this->input->get_post('orderorder');
        $maxrow = $this->input->get_post('maxrow');
        if ($maxrow == '') {
        }
        if ($orderby == '') {
            $orderby = 'id';
            $orderorder = 'ASC';
        }
        $data['message'] = $this->chintantable->query($pageno, $maxrow, $orderby, $orderorder, $search, $elements, 'FROM `fynx_order`');
        $this->load->view('json', $data);
    }
    public function getsingleorder()
    {
        $id = $this->input->get_post('id');
        $data['message'] = $this->order_model->getsingleorder($id);
        $this->load->view('json', $data);
    }
    public function getallorderitem()
    {
        $elements = array();
        $elements[0] = new stdClass();
        $elements[0]->field = '`fynx_orderitem`.`id`';
        $elements[0]->sort = '1';
        $elements[0]->header = 'ID';
        $elements[0]->alias = 'id';

        $elements = array();
        $elements[1] = new stdClass();
        $elements[1]->field = '`fynx_orderitem`.`discount`';
        $elements[1]->sort = '1';
        $elements[1]->header = 'Discount';
        $elements[1]->alias = 'discount';

        $elements = array();
        $elements[2] = new stdClass();
        $elements[2]->field = '`fynx_orderitem`.`order`';
        $elements[2]->sort = '1';
        $elements[2]->header = 'Order';
        $elements[2]->alias = 'order';

        $elements = array();
        $elements[3] = new stdClass();
        $elements[3]->field = '`fynx_orderitem`.`product`';
        $elements[3]->sort = '1';
        $elements[3]->header = 'Product';
        $elements[3]->alias = 'product';

        $elements = array();
        $elements[4] = new stdClass();
        $elements[4]->field = '`fynx_orderitem`.`quantity`';
        $elements[4]->sort = '1';
        $elements[4]->header = 'Quantity';
        $elements[4]->alias = 'quantity';

        $elements = array();
        $elements[5] = new stdClass();
        $elements[5]->field = '`fynx_orderitem`.`price`';
        $elements[5]->sort = '1';
        $elements[5]->header = 'Price';
        $elements[5]->alias = 'price';

        $elements = array();
        $elements[6] = new stdClass();
        $elements[6]->field = '`fynx_orderitem`.`finalprice`';
        $elements[6]->sort = '1';
        $elements[6]->header = 'Final Price';
        $elements[6]->alias = 'finalprice';

        $search = $this->input->get_post('search');
        $pageno = $this->input->get_post('pageno');
        $orderby = $this->input->get_post('orderby');
        $orderorder = $this->input->get_post('orderorder');
        $maxrow = $this->input->get_post('maxrow');
        if ($maxrow == '') {
        }
        if ($orderby == '') {
            $orderby = 'id';
            $orderorder = 'ASC';
        }
        $data['message'] = $this->chintantable->query($pageno, $maxrow, $orderby, $orderorder, $search, $elements, 'FROM `fynx_orderitem`');
        $this->load->view('json', $data);
    }
    public function getsingleorderitem()
    {
        $id = $this->input->get_post('id');
        $data['message'] = $this->orderitem_model->getsingleorderitem($id);
        $this->load->view('json', $data);
    }
    public function getallnewsletter()
    {
        $elements = array();
        $elements[0] = new stdClass();
        $elements[0]->field = '`fynx_newsletter`.`id`';
        $elements[0]->sort = '1';
        $elements[0]->header = 'ID';
        $elements[0]->alias = 'id';

        $elements = array();
        $elements[1] = new stdClass();
        $elements[1]->field = '`fynx_newsletter`.`user`';
        $elements[1]->sort = '1';
        $elements[1]->header = 'User';
        $elements[1]->alias = 'user';

        $elements = array();
        $elements[2] = new stdClass();
        $elements[2]->field = '`fynx_newsletter`.`email`';
        $elements[2]->sort = '1';
        $elements[2]->header = 'Email Id';
        $elements[2]->alias = 'email';

        $elements = array();
        $elements[3] = new stdClass();
        $elements[3]->field = '`fynx_newsletter`.`status`';
        $elements[3]->sort = '1';
        $elements[3]->header = 'Status';
        $elements[3]->alias = 'status';

        $search = $this->input->get_post('search');
        $pageno = $this->input->get_post('pageno');
        $orderby = $this->input->get_post('orderby');
        $orderorder = $this->input->get_post('orderorder');
        $maxrow = $this->input->get_post('maxrow');
        if ($maxrow == '') {
        }
        if ($orderby == '') {
            $orderby = 'id';
            $orderorder = 'ASC';
        }
        $data['message'] = $this->chintantable->query($pageno, $maxrow, $orderby, $orderorder, $search, $elements, 'FROM `fynx_newsletter`');
        $this->load->view('json', $data);
    }
    public function getsinglenewsletter()
    {
        $id = $this->input->get_post('id');
        $data['message'] = $this->newsletter_model->getsinglenewsletter($id);
        $this->load->view('json', $data);
    }
    public function getallconfig()
    {
        $elements = array();
        $elements[0] = new stdClass();
        $elements[0]->field = '`fynx_config`.`id`';
        $elements[0]->sort = '1';
        $elements[0]->header = 'ID';
        $elements[0]->alias = 'id';

        $elements = array();
        $elements[1] = new stdClass();
        $elements[1]->field = '`fynx_config`.`text`';
        $elements[1]->sort = '1';
        $elements[1]->header = 'Text';
        $elements[1]->alias = 'text';

        $elements = array();
        $elements[2] = new stdClass();
        $elements[2]->field = '`fynx_config`.`content`';
        $elements[2]->sort = '1';
        $elements[2]->header = 'Content';
        $elements[2]->alias = 'content';

        $search = $this->input->get_post('search');
        $pageno = $this->input->get_post('pageno');
        $orderby = $this->input->get_post('orderby');
        $orderorder = $this->input->get_post('orderorder');
        $maxrow = $this->input->get_post('maxrow');
        if ($maxrow == '') {
        }
        if ($orderby == '') {
            $orderby = 'id';
            $orderorder = 'ASC';
        }
        $data['message'] = $this->chintantable->query($pageno, $maxrow, $orderby, $orderorder, $search, $elements, 'FROM `fynx_config`');
        $this->load->view('json', $data);
    }
    public function getsingleconfig()
    {
        $id = $this->input->get_post('id');
        $data['message'] = $this->config_model->getsingleconfig($id);
        $this->load->view('json', $data);
    }
//function getallsize()
//{
//$elements=array();
//$elements[0]=new stdClass();
//$elements[0]->field="`fynx_size`.`id`";
//$elements[0]->sort="1";
//$elements[0]->header="ID";
//$elements[0]->alias="id";
//
//$elements=array();
//$elements[1]=new stdClass();
//$elements[1]->field="`fynx_size`.`status`";
//$elements[1]->sort="1";
//$elements[1]->header="status";
//$elements[1]->alias="status";
//
//$elements=array();
//$elements[2]=new stdClass();
//$elements[2]->field="`fynx_size`.`name`";
//$elements[2]->sort="1";
//$elements[2]->header="Name";
//$elements[2]->alias="name";
//
//$search=$this->input->get_post("search");
//$pageno=$this->input->get_post("pageno");
//$orderby=$this->input->get_post("orderby");
//$orderorder=$this->input->get_post("orderorder");
//$maxrow=$this->input->get_post("maxrow");
//if($maxrow=="")
//{
//}
//if($orderby=="")
//{
//$orderby="id";
//$orderorder="ASC";
//}
//$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `fynx_size`");
//$this->load->view("json",$data);
//}
public function getsinglesize()
{
    $id = $this->input->get_post('id');
    $data['message'] = $this->size_model->getsinglesize($id);
    $this->load->view('json', $data);
}
    public function getallsizechart()
    {
        $elements = array();
        $elements[0] = new stdClass();
        $elements[0]->field = '`fynx_sizechart`.`id`';
        $elements[0]->sort = '1';
        $elements[0]->header = 'ID';
        $elements[0]->alias = 'id';

        $elements = array();
        $elements[1] = new stdClass();
        $elements[1]->field = '`fynx_sizechart`.`name`';
        $elements[1]->sort = '1';
        $elements[1]->header = 'Name';
        $elements[1]->alias = 'name';

        $elements = array();
        $elements[2] = new stdClass();
        $elements[2]->field = '`fynx_sizechart`.`image`';
        $elements[2]->sort = '1';
        $elements[2]->header = 'Image';
        $elements[2]->alias = 'image';

        $search = $this->input->get_post('search');
        $pageno = $this->input->get_post('pageno');
        $orderby = $this->input->get_post('orderby');
        $orderorder = $this->input->get_post('orderorder');
        $maxrow = $this->input->get_post('maxrow');
        if ($maxrow == '') {
        }
        if ($orderby == '') {
            $orderby = 'id';
            $orderorder = 'ASC';
        }
        $data['message'] = $this->chintantable->query($pageno, $maxrow, $orderby, $orderorder, $search, $elements, 'FROM `fynx_sizechart`');
        $this->load->view('json', $data);
    }
    public function getsinglesizechart()
    {
        $id = $this->input->get_post('id');
        $data['message'] = $this->sizechart_model->getsinglesizechart($id);
        $this->load->view('json', $data);
    }

    public function orderemail()
    {
        $email = $this->input->get('email');
        $orderid = $this->input->get('orderid');

        $table = $this->order_model->getorderitem($this->input->get('orderid'));
        $before = $this->order_model->beforeedit($this->input->get('orderid'));

        $todaydata = date('Y-m-d');
        $this->load->library('email');
        $this->email->from('info@magicmirror.in', 'Magicmirror');
        $this->email->to($email);
        $this->email->subject('Magicmirror Order');
        if ($before['order']->billingaddress == '') {
            $billingaddress = $before['order']->firstname.' '.$before['order']->lastname.'<br>'.$before['order']->shippingaddress.'<br>'.$before['order']->shippingcity.'<br>'.$before['order']->shippingstate.'<br>'.$before['order']->shippingpincode;
        } else {
            $billingaddress = $before['order']->firstname.' '.$before['order']->lastname.'<br>'.$before['order']->billingaddress.'<br>'.$before['order']->billingcity.'<br>'.$before['order']->billingstate.'<br>'.$before['order']->billingpincode;
        }
        if ($before['order']->shippingaddress == '') {
            $shippingaddress = $before['order']->firstname.' '.$before['order']->lastname.'<br>'.$before['order']->billingaddress.'<br>'.$before['order']->billingcity.'<br>'.$before['order']->billingstate.'<br>'.$before['order']->billingpincode;
        } else {
            $shippingaddress = $before['order']->firstname.' '.$before['order']->lastname.'<br>'.$before['order']->shippingaddress.'<br>'.$before['order']->shippingcity.'<br>'.$before['order']->shippingstate.'<br>'.$before['order']->shippingpincode;
        }

        $message = "<html><body style=\"background:url('http://magicmirror.in/emaildata/emailer.jpg')no-repeat center; background-size:cover;\">
    <div text-align: center; width: 60%; margin: 0 auto; padding-left: 65px;'>
        <img src='http://magicmirror.in/emaildata/email.png'>
    </div>
    <div style='text-align:center;   width: 50%; margin: 0 auto;'>
        <h2 style='padding-bottom: 5px;color: #e82a96;'>Orders Details</h2>
        <table align='center' border='1' cellpadding='2' cellspacing='0' width='100%' style='border: 0px solid black;padding-bottom: 40px;'>
            <tr align='right' style='border: 0px;'>
                <td width='70%' style='border: 0px;'>
&nbsp;
                </td>
                     <td width='30%' style='border: 0px;'>
                   Date :<span>$todaydata</span>
                </td>
                                                   </tr>
                                                   <tr align='right' style='border: 0px;'>
                                                  <td width='70%' style='border: 0px;'>
&nbsp;
                </td>
                                <td width='30%' style='border: 0px;'>
                  Invoice No.:<span>$orderid</span>
                </td>
            </tr>
        </table>

        <table align='center' border='1' cellpadding='0' cellspacing='0' width='100%' style='border: 0px solid black;padding-bottom: 40px;'>
           <tr>
    <th style='padding: 10px 0;'>Billing Address</th>
    <th style='padding: 10px 0;'>Shipping Address</th>
  </tr>
          <tr >
              <td width='50%' style='padding: 10px 15px;'>
<p>$billingaddress</p>
</td>
              <td width='50%' style='padding: 10px 15px;'>
<p>$shippingaddress</p>
 </td>
  </tr>
        </table>

                 <table align='center' border='1' cellpadding='0' cellspacing='0' width='100%' style='border: 0px solid black;padding-bottom: 30px;'>
  <tr>
    <th style='padding: 10px 0;'>Id</th>
    <th style='padding: 10px 0;'>Product</th>
    <th style='padding: 10px 0;'>Quantity</th>
    <th style='padding: 10px 0;'>Price</th>
    <th style='padding: 10px 0;'>Total Amount</th>
  </tr>";
        $count = 1;
        $finalpricetotal = 0;
        foreach ($table as $row) {
            $namesku = $row->name.'-'.$row->sku;
            $quantity = $row->quantity;
            $price = $row->price;
            $finalprice = $row->finalprice;
            $message .= "
            <tr>
                <td align='center' style='padding: 10px 0;'>$count</td>
                <td align='center' style='padding: 10px 0;'>$namesku</td>
                <td align='center' style='padding: 10px 0;'>$quantity</td>
                <td align='center' style='padding: 10px 0;'>$price</td>
                <td align='center' style='padding: 10px 0;'>$finalprice</td>
              </tr>";
            $finalpricetotal = $finalpricetotal + $value->finalprice;
            ++$counter;
        }
        $message .= "

        </table>
    </div>
    <div style='text-align:center;position: relative;'>
        <p style=' position: absolute; top: 8%;left: 50%; transform: translatex(-50%); font-size: 1em;margin: 0; letter-spacing:2px; font-weight: bold;'>
            Thank You Again
        </p>
        <img src='http://magicmirror.in/emaildata/magicfooter.png' style='height: 225px;'>
    </div>
</body>

</html>";
        $this->email->message($message);
        // $this->email->html('<b>hello</b>');
        $this->email->send();
        $data['message'] = $this->email->print_debugger();
        $this->load->view('json', $data);
    }

    public function placeOrder()
    {
      $data = json_decode(file_get_contents('php://input'), true);
      $user = $this->session->userdata('id');
      $firstname = $data['firstname'];
      $lastname = $data['lastname'];
      $email = $data['email'];

      $phone = $data['mobile'];
      $billingline1 = $data['billingline1'];
      $billingline2 = $data['billingline2'];
      $billingline3 = $data['billingline3'];
      $billingcity = $data['billingcity'];
      $billingstate = $data['billingstate'];
      $billingcountry = $data['billingcountry'];
      $billingpincode = $data['billingpincode'];
      $shippingcity = $data['shippingcity'];
      $shippingline1 = $data['shippingline1'];
      $shippingline2 = $data['shippingline2'];
      $shippingline3 = $data['shippingline3'];
      $shippingcountry = $data['shippingcountry'];
      $shippingstate = $data['shippingstate'];
      $shippingpincode = $data['shippingpincode'];
      $carts = $data['cart'];
      $paymentmode = $data['paymentmode'];

      $data['message'] = $this->order_model->placeOrder($user, $firstname, $lastname, $email, $phone, $billingline1, $billingline2, $billingline3, $billingcity, $billingstate, $billingcountry, $shippingcity, $shippingcountry, $shippingstate, $shippingpincode, $billingpincode, $carts, $shippingline1, $shippingline2, $shippingline3, $paymentmode);

        $this->load->view('json', $data);
    }
    public function getusercart()
    {
        $user = $this->input->get_post('user');
        $data['message'] = $this->order_model->getusercart($user);
        $this->load->view('json', $data);
    }
    public function addcartsession()
    {
        $cart = $this->input->get_post('cart');
        $data['message'] = $this->order_model->addcartsession($cart);
        $this->load->view('json', $data);
    }
    // public function addToCart()
    // {
    //     $product = $this->input->get_post('product');
    //     $quantity = $this->input->get_post('quantity');
    //     $design = $this->input->get_post('design');
    //     $json = $this->input->get_post('json');
    //     $data['message'] = $this->user_model->addToCart($product, $quantity, $design,$json);
    //     $this->load->view('json', $data);
    // }

    public function addToCart()
    {
        $data = json_decode(file_get_contents('php://input'), true);
        $product = $data['product'];
        $quantity = $data['quantity'];
        $json = $data['json'];
        $status = $data['status'];
        $data['message'] = $this->restapi_model->addToCart($product, $quantity, $json,$status);
        $this->load->view('json', $data);
    }

    public function removeFromCart()
    {
        $data = json_decode(file_get_contents('php://input'), true);
        $cart = $data['cart'];
          $status = $data['status'];
        $data['message'] = $this->restapi_model->removeFromCart($cart,$status);
        $this->load->view('json', $data);
    }

    public function destroycart()
    {
        $data['message'] = $this->user_model->destroycart();
        $this->load->view('json', $data);
    }

    public function totalcart()
    {
        $data['message'] = $this->cart->total();
        $this->load->view('json', $data);
    }
    public function totalitemcart()
    {
        $data['message'] =$this->user_model->totalitemcart();
        $this->load->view('json', $data);
    }
    public function searchbyname()
    {
        $search = $this->input->get_post('search');
        $data['message'] = $this->user_model->searchbyname($search);
        $this->load->view('json', $data);
    }
    public function showwishlist()
    {
        $user = $this->input->get('user');
        $elements = array();
        $elements[0] = new stdClass();
        $elements[0]->field = '`fynx_product`.`id`';
        $elements[0]->sort = '1';
        $elements[0]->header = 'ID';
        $elements[0]->alias = 'id';

        $elements[1] = new stdClass();
        $elements[1]->field = '`fynx_product`.`subcategory`';
        $elements[1]->sort = '1';
        $elements[1]->header = 'Subcategory';
        $elements[1]->alias = 'subcategory';

        $elements[2] = new stdClass();
        $elements[2]->field = '`fynx_product`.`quantity`';
        $elements[2]->sort = '1';
        $elements[2]->header = 'Quantity';
        $elements[2]->alias = 'quantity';

        $elements[3] = new stdClass();
        $elements[3]->field = '`fynx_product`.`name`';
        $elements[3]->sort = '1';
        $elements[3]->header = 'Name';
        $elements[3]->alias = 'name';

        $elements[4] = new stdClass();
        $elements[4]->field = '`fynx_product`.`type`';
        $elements[4]->sort = '1';
        $elements[4]->header = 'Type';
        $elements[4]->alias = 'type';

        $elements[5] = new stdClass();
        $elements[5]->field = '`fynx_product`.`description`';
        $elements[5]->sort = '1';
        $elements[5]->header = 'Description';
        $elements[5]->alias = 'description';

        $elements[6] = new stdClass();
        $elements[6]->field = '`fynx_product`.`visibility`';
        $elements[6]->sort = '1';
        $elements[6]->header = 'Visibility';
        $elements[6]->alias = 'visibility';

        $elements[7] = new stdClass();
        $elements[7]->field = '`fynx_product`.`price`';
        $elements[7]->sort = '1';
        $elements[7]->header = 'Price';
        $elements[7]->alias = 'price';

        $elements[8] = new stdClass();
        $elements[8]->field = '`fynx_product`.`category`';
        $elements[8]->sort = '1';
        $elements[8]->header = 'Category';
        $elements[8]->alias = 'category';

        $elements[9] = new stdClass();
        $elements[9]->field = '`fynx_product`.`color`';
        $elements[9]->sort = '1';
        $elements[9]->header = 'Color';
        $elements[9]->alias = 'color';

        $elements[10] = new stdClass();
        $elements[10]->field = '`fynx_product`.`size`';
        $elements[10]->sort = '1';
        $elements[10]->header = 'Size';
        $elements[10]->alias = 'size';

        $elements[11] = new stdClass();
        $elements[11]->field = '`fynx_product`.`sizechart`';
        $elements[11]->sort = '1';
        $elements[11]->header = 'Size Chart';
        $elements[11]->alias = 'sizechart';

        $elements[12] = new stdClass();
        $elements[12]->field = '`fynx_size`.`id`';
        $elements[12]->sort = '1';
        $elements[12]->header = 'sizeid';
        $elements[12]->alias = 'sizeid';

        $elements[13] = new stdClass();
        $elements[13]->field = '`fynx_size`.`name`';
        $elements[13]->sort = '1';
        $elements[13]->header = 'sizename';
        $elements[13]->alias = 'sizename';

        $elements[14] = new stdClass();
        $elements[14]->field = '`fynx_color`.`id`';
        $elements[14]->sort = '1';
        $elements[14]->header = 'colorid';
        $elements[14]->alias = 'colorid';

        $elements[15] = new stdClass();
        $elements[15]->field = '`fynx_color`.`name`';
        $elements[15]->sort = '1';
        $elements[15]->header = 'colorname';
        $elements[15]->alias = 'colorname';

        $elements[16] = new stdClass();
        $elements[16]->field = '`fynx_designs`.`id`';
        $elements[16]->sort = '1';
        $elements[16]->header = 'designId';
        $elements[16]->alias = 'designId';

        $elements[17] = new stdClass();
        $elements[17]->field = '`fynx_designs`.`image`';
        $elements[17]->sort = '1';
        $elements[17]->header = 'designImage';
        $elements[17]->alias = 'designImage';

        $search = $this->input->get_post('search');
        $pageno = $this->input->get_post('pageno');
        $orderby = $this->input->get_post('orderby');
        $orderorder = $this->input->get_post('orderorder');
        $maxrow = $this->input->get_post('maxrow');
        if ($maxrow == '') {
        }
        if ($orderby == '') {
            $orderby = 'id';
            $orderorder = 'ASC';
        }
        $data['message'] = $this->chintantable->query($pageno, $maxrow, $orderby, $orderorder, $search, $elements, '

        FROM `fynx_product`
        LEFT OUTER JOIN `fynx_size` ON `fynx_size`.`id`=`fynx_product`.`size`
        LEFT OUTER JOIN `fynx_color` ON `fynx_color`.`id`=`fynx_product`.`color`
        LEFT OUTER JOIN `fynx_wishlist` ON `fynx_wishlist`.`product`=`fynx_product`.`id`
        LEFT OUTER JOIN `fynx_designs` ON `fynx_designs`.`id`=`fynx_wishlist`.`design`

        ', "WHERE `fynx_product`.`status`=2 AND `fynx_wishlist`.`user`='$user'");
        $this->load->view('json', $data);
    }
    public function newsletter()
    {
        $id = $this->input->get_post('id');
        $email = $this->input->get_post('email');
        $status = $this->input->get_post('status');
        $data['message'] = $this->user_model->newsletter($id, $email, $status);
        $this->load->view('json', $data);
    }
    public function registeruser()
    {
        $data = json_decode(file_get_contents('php://input'), true);
        $firstname = $data['firstname'];
        $lastname = $data['lastname'];
        $email = $data['email'];
        $password = $data['password'];
//        $firstname = $this->input->get_post('firstname');
//        $lastname = $this->input->get_post('lastname');
//        $email = $this->input->get_post('email');
//        $password = $this->input->get_post('password');
        $data['message'] = $this->user_model->registeruser($firstname, $lastname, $email, $password);
        $this->load->view('json', $data);
    }
    public function registewholesaler()
    {
        $firstname = $this->input->get_post('firstname');
        $lastname = $this->input->get_post('lastname');
        $phone = $this->input->get_post('phone');
        $email = $this->input->get_post('email');
        $password = $this->input->get_post('password');
        $data['message'] = $this->user_model->registewholesaler($firstname, $lastname, $phone, $email, $password);
        $this->load->view('json', $data);
    }
    public function addtowishlist()
    {
        $data = json_decode(file_get_contents('php://input'), true);
        $user = $this->session->userdata('id');
        $product = $data['product'];
        $quantity = $data['quantity'];
        $design = $data['design'];
        $data['message'] = $this->product_model->addtowishlist($user, $product, $quantity, $design);
        $this->load->view('json', $data);
    }

    public function authenticate()
    {
        $data['message'] = $this->user_model->authenticate();
        $this->load->view('json', $data);
    }
    public function logout()
    {
        $this->session->sess_destroy();
        $object = new stdClass();
        $object->value = true;
        //return $object;
        $data['message'] = $object;
        $this->load->view('json', $data);
    }
    public function deletecart()
    {
        $id = intval($this->input->get_post('id'));
        $design = intval($this->input->get_post('design'));
        if($design == 0)
        {
          $design = "";
        }
        $user = $this->session->userdata('id');
        $this->user_model->deletecartfromdb($id, $user, $design);
        $cart = $this->cart->contents();
        $newcart = array();
        foreach ($cart as $item) {
            if ($item['id'] != $id) {
                array_push($newcart, $item);
            }
        }
        $this->cart->destroy();
        $this->cart->insert($newcart);
        $data['message'] = $newcart;
        $this->load->view('json', $data);
    }
    public function savequantity()
    {
        $product = $this->input->get_post('product');
        $quantity = $this->input->get_post('quantity');
        $data['message'] = $this->product_model->savequantity($product, $quantity);
        $this->load->view('json', $data);
    }
//    public function getSubscribe()
//    {
//        echo "in subscribe";
////         $email = $this->input->get_post('email');
////        $data['message'] = $this->restapi_model->getSubscribe($email);
////        $this->load->view('json', $data);
//    }
    public function getnavigation()
    {
        $data['message'] = $this->navigation_model->getnavigation();
        $this->load->view('json', $data);
    }
    public function getproductbycategoryold()
    {
        $color = $this->input->get_post('color');
        $price1 = $this->input->get_post('price1');
        $price2 = $this->input->get_post('price2');
        $category = $this->input->get_post('category');
        $data['message'] = $this->product_model->getproductbycategory($category, $color, $price1, $price2);
        $this->load->view('json', $data);
    }

    public function getallslider()
    {
        $data['message'] = $this->db->query('SELECT `id`, `name`, `link`, `target`, `status`, `image`, `template`, `class`, `text`, `centeralign` FROM `fynx_homeslide` WHERE 1')->result();
        $this->load->view('json', $data);
    }
    public function getdiscountcoupon()
    {
        $couponcode = $this->input->get_post('couponcode');
        $query = $this->db->query("SELECT * from `discountcoupon` WHERE `couponcode` LIKE '$couponcode' ");
        if ($query->num_rows() > 0) {
            $data['message'] = $query->row();
        } else {
            $data['message'] = false;
        }
        $this->load->view('json', $data);
    }
    public function addimagetoproduct()
    {
        $product = $this->input->get_post('product');
        $image = $this->input->get_post('image');
        $order = $this->input->get_post('order');
        $order = intval($order);
        --$order;
        $image = substr($image, 32);
        if ($order == '0') {
            $default = 1;
        } else {
            $default = 0;
        }
        $message = new stdClass();
        $querycheck = "INSERT INTO `productimage` (`product`, `image`, `is_default`, `order`, `status`) VALUES ('$product', '$image','$default', '$order', '0')";
        $this->db->query("INSERT INTO `productimage` (`product`, `image`, `is_default`, `order`, `status`) VALUES ('$product', '$image','$default', '$order', '0')");
        $message->product = $product;
        $message->querycheck = $querycheck;
        $message->id = $this->db->insert_id();
        $message->image = $image;
        $message->image = $image;
        $message->order = $order;
//        $data["message"]=$message;
//        $this->load->view("json", $data);
      //  echo 'Done';
    }
    public function addproductcsv()
    {
        $filepath = $this->input->get_post('filepath');
//        echo $filepath;
        $file = $this->csvreader->parse_file($filepath);
//        print_r($file);
        $id1 = $this->product_model->createbycsv($file);
//        echo "<br>".$id1;
        if ($id1 == 0) {
            $data['alerterror'] = 'New products could not be Uploaded.';
        } else {
            $data['alertsuccess'] = 'products Uploaded Successfully.';
        }
//        print_r($data);
        $data['redirect'] = 'site/viewproduct';
        $this->load->view('redirect', $data);

//        $image = $this->input->get_post("image");
//        $order = $this->input->get_post("order");
//        if ($order == "1") {
//            $default = 1;
//        } else {
//            $default = 0;
//        }
//        $filepath="http://magicmirror.in/servepublicother?name=$filename";
//echo $filepath;
//        $file = $this->csvreader->parse_file($filepath);
//        print_r($file);
//        $id1=$this->product_model->createbycsv($file);
//        echo "<br>".$id1."<br>";
//        if($id1==0)
//        $data['alerterror']="New Products could not be Uploaded.";
//		else
//		$data['alertsuccess']="Products Uploaded Successfully.";
//        print_r($data);
//        $data['redirect']="site/uploadproductcsv";
//        $this->load->view("redirect",$data);
    }
    public function getfile()
    {
        $filepath = 'http://magicmirror.in/servepublicother?name=product (11).csv';
      //  echo $filepath;
        $file = $this->csvreader->parse_file($filepath);
      //  ($file);
    }
    public function nextproduct()
    {
        $id = $this->input->get_post('id');
        $next = $this->input->get_post('next');
        $sign = '>';
        $orderby = 'ASC';
        if ($next == '0') {
            $sign = '<';
            $orderby = 'DESC';
        }
        $query = $this->db->query("SELECT `id` FROM `product` WHERE `id`$sign'$id' ORDER BY `id` $orderby  LIMIT 0,1");
        if ($query->num_rows() > 0) {
            $data['message'] = $query->row();
            //return $query;
        } else {
            $searchstring = substr($category, 1);
            $query2 = $this->db->query("SELECT `id` FROM `product` ORDER BY `id` $orderby  LIMIT 0,1");
            if ($query) {
                $data['message'] = $query2->id;
            } else {
                $data['message'] = false;
            }
        }
        $this->load->view('json', $data);
    }
    public function getconversionrates()
    {
        //$continent->name=geoip_continent_code_by_name($ip);
        $data['message'] = $this->currency_model->viewcurrency();
        $this->load->view('json', $data);
    }
    public function addproductwaitinglist()
    {
        $email = $this->input->get_post('email');
        $product = $this->input->get_post('product');
        $data['message'] = $this->product_model->addproductwaitinglist($email, $product);
        $this->load->view('json', $data);
    }
    public function emailcustomerdiscount()
    {
        $this->order_model->emailcustomerdiscount();
    }
    public function login()
    {
        $id = $this->input->get_post('id');
        $data['message'] = $this->user_model->loginuser($id);
        $this->load->view('json', $data);
    }
    public function createsessionbyid()
    {
        $id = $this->input->get_post('id');
        $endurl = $this->input->get_post('endurl');
        $data['message'] = $this->user_model->createsessionbyid($id);
        redirect($endurl);
//        		$this->load->view("json",$data);
    }
    public function updateorderstatusafterpayment()
    {
        $orderid = $_POST['orderid'];
        $email = $this->db->query("SELECT `email` FROM `order` WHERE `id`='$orderid'")->row();
        $email = $email->email;

//        $email = $this->input->get('email');
        $orderid = $this->input->get('orderid');

        $table = $this->order_model->getorderitem($this->input->get('orderid'));
        $before = $this->order_model->beforeedit($this->input->get('orderid'));

        $todaydata = date('Y-m-d');
        $this->load->library('email');
        $this->email->from('info@magicmirror.in', 'Magicmirror');
        $this->email->to($email);
        $this->email->subject('Magicmirror Order');
        if ($before['order']->billingaddress == '') {
            $billingaddress = $before['order']->firstname.' '.$before['order']->lastname.'<br>'.$before['order']->shippingaddress.'<br>'.$before['order']->shippingcity.'<br>'.$before['order']->shippingstate.'<br>'.$before['order']->shippingpincode;
        } else {
            $billingaddress = $before['order']->firstname.' '.$before['order']->lastname.'<br>'.$before['order']->billingaddress.'<br>'.$before['order']->billingcity.'<br>'.$before['order']->billingstate.'<br>'.$before['order']->billingpincode;
        }
        if ($before['order']->shippingaddress == '') {
            $shippingaddress = $before['order']->firstname.' '.$before['order']->lastname.'<br>'.$before['order']->billingaddress.'<br>'.$before['order']->billingcity.'<br>'.$before['order']->billingstate.'<br>'.$before['order']->billingpincode;
        } else {
            $shippingaddress = $before['order']->firstname.' '.$before['order']->lastname.'<br>'.$before['order']->shippingaddress.'<br>'.$before['order']->shippingcity.'<br>'.$before['order']->shippingstate.'<br>'.$before['order']->shippingpincode;
        }

        $message = "<html><body style=\"background:url('http://magicmirror.in/emaildata/emailer.jpg')no-repeat center; background-size:cover;\">
    <div text-align: center; width: 60%; margin: 0 auto; padding-left: 65px;'>
        <img src='http://magicmirror.in/emaildata/email.png'>
    </div>
    <div style='text-align:center;   width: 50%; margin: 0 auto;'>
        <h2 style='padding-bottom: 5px;color: #e82a96;'>Orders Details</h2>
        <table align='center' border='1' cellpadding='2' cellspacing='0' width='100%' style='border: 0px solid black;padding-bottom: 40px;'>
            <tr align='right' style='border: 0px;'>
                <td width='70%' style='border: 0px;'>
&nbsp;
                </td>
                     <td width='30%' style='border: 0px;'>
                   Date :<span>$todaydata</span>
                </td>
                                                   </tr>
                                                   <tr align='right' style='border: 0px;'>
                                                  <td width='70%' style='border: 0px;'>
&nbsp;
                </td>
                                <td width='30%' style='border: 0px;'>
                  Invoice No.:<span>$orderid</span>
                </td>
            </tr>
        </table>

        <table align='center' border='1' cellpadding='0' cellspacing='0' width='100%' style='border: 0px solid black;padding-bottom: 40px;'>
           <tr>
    <th style='padding: 10px 0;'>Billing Address</th>
    <th style='padding: 10px 0;'>Shipping Address</th>
  </tr>
          <tr >
              <td width='50%' style='padding: 10px 15px;'>
<p>$billingaddress</p>
</td>
              <td width='50%' style='padding: 10px 15px;'>
<p>$shippingaddress</p>
 </td>
  </tr>
        </table>

                 <table align='center' border='1' cellpadding='0' cellspacing='0' width='100%' style='border: 0px solid black;padding-bottom: 30px;'>
  <tr>
    <th style='padding: 10px 0;'>Id</th>
    <th style='padding: 10px 0;'>Product</th>
    <th style='padding: 10px 0;'>Quantity</th>
    <th style='padding: 10px 0;'>Price</th>
    <th style='padding: 10px 0;'>Total Amount</th>
  </tr>";
        $count = 1;
        $finalpricetotal = 0;
        foreach ($table as $row) {
            $namesku = $row->name.'-'.$row->sku;
            $quantity = $row->quantity;
            $price = $row->price;
            $finalprice = $row->finalprice;
            $message .= "
            <tr>
                <td align='center' style='padding: 10px 0;'>$count</td>
                <td align='center' style='padding: 10px 0;'>$namesku</td>
                <td align='center' style='padding: 10px 0;'>$quantity</td>
                <td align='center' style='padding: 10px 0;'>$price</td>
                <td align='center' style='padding: 10px 0;'>$finalprice</td>
              </tr>";
            $finalpricetotal = $finalpricetotal + $value->finalprice;
            ++$counter;
        }
        $message .= "

        </table>
    </div>
    <div style='text-align:center;position: relative;'>
        <p style=' position: absolute; top: 8%;left: 50%; transform: translatex(-50%); font-size: 1em;margin: 0; letter-spacing:2px; font-weight: bold;'>
            Thank You Again
        </p>
        <img src='http://magicmirror.in/emaildata/magicfooter.png' style='height: 225px;'>
    </div>
</body>

</html>";
        $this->email->message($message);
        // $this->email->html('<b>hello</b>');
        $this->email->send();
//        $data['message'] = $this->email->print_debugger();
//        $this->load->view('json', $data);

        $returnvalue = $this->order_model->updateorderstatusafterpayment($orderid);

        return $returnvalue;
    }
    public function socialcheck()
    {
        //print_r($_POST);
        $displayName = $_POST['displayName'];
        $email = $_POST['email'];
        $photoURL = $_POST['photoURL'];
        $identifier = $_POST['identifier'];
        $birthYear = $_POST['birthYear'];
        $birthMonth = $_POST['birthMonth'];
        $birthDay = $_POST['birthDay'];
        $address = $_POST['address'];
        $region = $_POST['region'];
        $city = $_POST['city'];
        $country = $_POST['country'];
        $provider = $_POST['provider'];
        $query = $this->db->query("SELECT * FROM `user` WHERE `user`.`socialid`='$identifier'");
        if ($query->num_rows == 0) {
            $googleid = '';
            $facebookid = '';
            $twitterid = '';
            switch ($provider) {
                case 'Google':
                    $googleid = $user_profile->identifier;
                break;
                case 'Facebook':
                    $facebookid = $user_profile->identifier;
                break;
                case 'Twitter':
                    $twitterid = $user_profile->identifier;
                break;
            }
            $query2 = $this->db->query("INSERT INTO `user` (`id`, `name`, `password`, `email`, `accesslevel`, `timestamp`, `status`, `image`, `username`, `socialid`, `logintype`, `json`, `dob`, `street`, `address`, `city`, `state`, `country`, `pincode`, `facebook`, `google`, `twitter`) VALUES (NULL, '$displayName', '', '$email', '3', CURRENT_TIMESTAMP, '1', '$photoURL', '', '$identifier', '$provider', '', '$birthYear-$birthMonth-$birthDay', '', '$address,$region', '$city', '', '$country', '', '$facebookid', '$googleid', '$twitterid')");
            $id = $this->db->insert_id();
          //  echo $id;
        } else {
            $query = $query->row();
            $id = $query->id;
          //  echo $id;
        }
    }
    public function reminderemail()
    {
        $query = $this->db->query('SELECT `usercart`.`user` AS `userid`,`user`.`email` AS `email` FROM `usercart` INNER JOIN `user` ON `user`.`id`=`usercart`.`user`')->result();
        foreach ($query as $row) {
            $email = $row->email;
            $this->load->library('email');
            $this->email->from('info@magicmirror.in', 'Magic Mirror');
            $this->email->to($email);
            $this->email->subject('Welcome to Magic Mirror');
            $message = "<html>

<body style=\"background:url('http://magicmirror.in/emaildata/emailer.jpg')no-repeat center; background-size:cover;\">
    <div style='text-align:center; padding-top: 40px;'>
        <img src='http://magicmirror.in/emaildata/email.png'>
    </div>
    <div style='text-align:center;   width: 50%; margin: 0 auto;'>
        <h4 style='font-size:1.5em;padding-bottom: 5px;color: #e82a96;'>Sparkling Greetings!</h4>
        <p style='font-size: 1em;padding-bottom: 10px;'>We noticed you put together beautiful jewellery in shopping cart on our site but didn't submit your order, wondering if you need any help or if you have any questions about the order before you submit it?</p>



        <p style='font-size: 1em;padding-bottom: 10px;'>If there's anything we can do, drop us a line & email us at <a>support@magicmirror</a>.in with any product or order queries.</p>
        <p style='font-size: 1em;text-align:left;'>
            Your shopping cart
        </p>
        <p style='font-size: 1em;text-align:left;'>
            List of your shopping cart contents below.
        </p>
        <p style='font-size: 1em;padding-bottom: 10px;text-align:left;'>

            <br> Keep Sparkling,
            <br>Team Magic Mirror
        </p>
    </div>
    <div style='text-align:center;position: relative;'>
        <p style=' position: absolute; top: 8%;left: 50%; transform: translatex(-50%); font-size: 1em;margin: 0; letter-spacing:2px; font-weight: bold;'>
            Thank You Again
        </p>
        <img src='http://magicmirror.in/emaildata/magicfooter.png '>
    </div>
</body>

</html>";
//            echo $message;
            $this->email->message($message);
            $this->email->send();
            $data['message'] = $this->email->print_debugger();
            $this->load->view('json', $data);
        }
    }

    public function forgotpassword()
    {
        $data = json_decode(file_get_contents('php://input'), true);
        $email = $data['email'];
        $userdetail = $this->user_model->getidbyemail($email);
        $userid = $userdetail->id;
        $username = $userdetail->firstname." ".$userdetail->lastname;

        if ($userid == '') {
            $data['message'] = new stdClass();
            $data['message']->value = 'noemail';
            $this->load->view('json', $data);
        } else {
            $hashvalue = base64_encode($userid.'&access');
            $link = "<a href='http://wohlig.co.in/selfcare/#/forgotpassword/$hashvalue'>Click here </a> To Reset Your Password.";


            $this->load->library('email');
    						 $this->email->from('vigwohlig@gmail.com', 'Selfcare');
    						 $this->email->to($email);
    						 $this->email->subject('Access Password Changed');

    						 $message = "<html><body><div id=':1fn' class='a3s adM' style='overflow: hidden;'><div class='HOEnZb'><div class='adm'><div id='q_152da6db6beee01c_0' class='ajR h4' data-tooltip='Hide expanded content' aria-label='Hide expanded content'><div class='ajT'></div></div></div><div class='im'><u></u>
    						 <div style='margin:0'>

    						 <u></u>
    						 <div style='margin:0 auto;width:90%'>
    						 <div style='margin:50px auto;width:80%'>
    						 <div style='text-align:center' align='center'>
    						  <img src='http://wohlig.co.in/selfcare/img/logo.png' alt='Selfcare' class='CToWUd'>
    						 </div>
    						 <p style='color:#000;font-family:Roboto;font-size:20px'>Dear <span style='color:#000;font-family:Roboto;font-size:20px'>$username</span>,</p>
    						 <p style='color:#000;font-family:Roboto;font-size:20px'>Kindly click on the link below to reset your SelfCare password.
</p>
    						 <p style='color:#000;font-family:Roboto;font-size:20px'>$link</p>

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
    						  <a href='https://www.facebook.com/selfcarebysuman' style='color:#ffd8ce;display:inline-block;font-family:Roboto;font-size:18px;margin:3px 5px 0 0' target='_blank'><img src='http://www.wohlig.co.in/selfcare/img/selfcare-facebook.png' alt='Facebook' width='20' class='CToWUd'></a>
    						  <a href='https://twitter.com/selfcarebysuman' style='color:#ffd8ce;display:inline-block;font-family:Roboto;font-size:18px;margin:3px 5px 0 0' target='_blank'><img src='http://www.wohlig.co.in/selfcare/img/selfcare-twitter.png' alt='Twitter' width='20' class='CToWUd'></a>
    						  <a href='https://www.instagram.com/selfcarebysuman' style='color:#ffd8ce;display:inline-block;font-family:Roboto;font-size:18px;margin:3px 5px 0 0' target='_blank'><img src='http://www.wohlig.co.in/selfcare/img/selfcare-insta.png' alt='Instagram' width='20' class='CToWUd'></a>
    						  <a href='https://www.youtube.com/channel/UCVqKgmC6eaMrgPyXoOcOz2A' style='color:#ffd8ce;display:inline-block;font-family:Roboto;font-size:18px;margin:3px 5px 0 0' target='_blank'><img src='http://www.wohlig.co.in/selfcare/img/selfcare-youtube.png' alt='Youtube' width='20' class='CToWUd'></a>
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

            $data['message'] = new stdClass();
            $data['message']->value = true;
       $this->load->view("json", $data);
        }
    }

    public function forgotpasswordsubmit()
    {
        $data = json_decode(file_get_contents('php://input'), true);
        $password = $data['password'];
        $hashcode = $data['hashcode'];
        $data['message'] = $this->user_model->forgotpasswordsubmit($hashcode, $password);
        $this->load->view('json', $data);
    }

    public function getuserorders()
    {
        $userid = $this->input->get_post('user');

        $elements = array();

        $elements[0] = new stdClass();
        $elements[0]->field = '`fynx_order`.`id`';
        $elements[0]->sort = '1';
        $elements[0]->header = 'ID';
        $elements[0]->alias = 'id';

        $elements[1] = new stdClass();
        $elements[1]->field = '`fynx_order`.`transactionid`';
        $elements[1]->sort = '1';
        $elements[1]->header = 'transactionid';
        $elements[1]->alias = 'transactionid';

        $elements[2] = new stdClass();
        $elements[2]->field = 'DATE(`fynx_order`.`timestamp`)';
        $elements[2]->sort = '1';
        $elements[2]->header = 'Date';
        $elements[2]->alias = 'date';

        $elements[3] = new stdClass();
        $elements[3]->field = '`fynx_order`.`orderstatus`';
        $elements[3]->sort = '1';
        $elements[3]->header = 'status';
        $elements[3]->alias = 'status';

        $elements[4] = new stdClass();
        $elements[4]->field = '`orderstatus`.`name`';
        $elements[4]->sort = '1';
        $elements[4]->header = 'orderstatusname';
        $elements[4]->alias = 'orderstatusname';

        $elements[5] = new stdClass();
        $elements[5]->field = '`orderstatus`.`name`';
        $elements[5]->sort = '1';
        $elements[5]->header = 'orderstatusname';
        $elements[5]->alias = 'orderstatusname';

        $search = $this->input->get_post('search');
        $pageno = $this->input->get_post('pageno');
        $orderby = $this->input->get_post('orderby');
        $orderorder = $this->input->get_post('orderorder');
        $maxrow = $this->input->get_post('maxrow');
        if ($maxrow == '') {
            $maxrow = 5;
        }
        if ($orderby == '') {
            $orderby = 'id';
            $orderorder = 'ASC';
        }
        $data['message'] = $this->chintantable->query($pageno, $maxrow, $orderby, $orderorder, $search, $elements, 'FROM `fynx_orderitem` INNER JOIN `fynx_order` ON `fynx_order`.`id`=`fynx_orderitem`.`order` LEFT OUTER JOIN `fynx_product` ON `fynx_product`.`id`=`fynx_orderitem`.`product` LEFT OUTER JOIN `orderstatus` ON `orderstatus`.`id`=`fynx_order`.`orderstatus`', "WHERE `fynx_order`.`user`='$userid'");

        foreach ($data['message']->queryresult as $row) {
            $orderid = $row->id;
            $row->totalamt = $this->db->query("SELECT SUM(`finalprice`) AS `totalsum` FROM `fynx_orderitem` WHERE `order`='$orderid'")->row();
        }
        $this->load->view('json', $data);
    }

    public function getordertrace()
    {
        $data = json_decode(file_get_contents('php://input'), true);
        $orderid = $data['order'];
        $data['message'] = $this->order_model->getstatusbyorderid($orderid);
        $this->load->view('json', $data);
    }

    public function getuserdetails()
    {
        $id = $this->input->get_post('id');
        $data['message'] = $this->restapi_model->getuserdetails($id);
        $this->load->view('json', $data);
    }
    public function updateuser()
    {
        $data = json_decode(file_get_contents('php://input'), true);
        $id = $data['id'];
        $firstname = $data['firstname'];
        $lastname = $data['lastname'];
        $billingaddress = $data['billingaddress'];
        $email = $data['email'];
        $phone = $data['phone'];
        $billingcity = $data['billingcity'];
        $billingpincode = $data['billingpincode'];
        $billingcountry = $data['billingcountry'];
        $billingstate = $data['billingstate'];
        $data['message'] = $this->user_model->updateuserfront($id, $firstname, $lastname, $billingaddress, $email, $phone, $billingcity, $billingpincode, $billingcountry, $billingstate);
        $this->load->view('json', $data);
    }
    public function getuserbyid()
    {
        $id = $this->session->userdata('id');
        $data['message'] = $this->user_model->beforeedit($id);
        $this->load->view('json', $data);
    }

    public function checkorderstatus()
    {
        $orderid = $this->input->get('orderid');
        $data['message'] = $this->order_model->checkorderstatus($orderid);
        $this->load->view('json', $data);
    }

    public function getorderforpayment()
    {
        $data['data'] = $_GET;
        $this->load->view('paymentpage', $data);
    }

    public function getsubscribe()
    {
        $email = $this->input->get('email');
        $data['message'] = $this->restapi_model->getsubscribe($email);
        $this->load->view('json', $data);
    }

    public function gethomecontent()
    {
        $data['message'] = $this->restapi_model->gethomecontent();
        $this->load->view('json', $data);
    }

    public function usercontact()
    {
        $name = $this->input->get_post('name');
        $email = $this->input->get_post('email');
        $phone = $this->input->get_post('phone');
        $comment = $this->input->get_post('comment');
        $data['message'] = $this->user_model->usercontact($id, $name, $email, $phone, $comment);
        $this->load->view('json', $data);
    }
    public function getproductbycategory()
    {
        $category = $this->input->get_post('category');
        $name = $this->input->get_post('name');
        $type = $this->input->get_post('type');
        $color = $this->input->get_post('color');
        $size = $this->input->get_post('size');
        $price = $this->input->get_post('price');
        $where = ' ';
        if ($type != '') {
            $where .= " AND `fynx_product`.`type` IN ($type) ";
        }
        if ($color != '') {
            $where .= " AND `fynx_product`.`color` IN ($color) ";
        }
        if ($size != '') {
            $where .= " AND `fynx_product`.`size` IN ($size) ";
        }
        if ($name != '') {
            $where .= " AND `fynx_product`.`name` LIKE '%$name%' ";
        }

        $this->chintantable->createelement('`productdesignimage`.`product`', '1', 'ID', 'id');
        $this->chintantable->createelement('`fynx_designs`.`name`', '1', 'name', 'name');
        $this->chintantable->createelement('`fynx_product`.`price`', '1', 'price', 'price');
        $this->chintantable->createelement('`productdesignimage`.`design`', '1', 'design', 'design');
        $this->chintantable->createelement('`productdesignimage`.`image`', '1', 'image', 'image');

        $search = $this->input->get_post('search');
        $pageno = $this->input->get_post('pageno');
        $orderby = 'price';
        if ($price == '2') {
            $orderorder = 'DESC';
        }
        else if($price == '1') {
            $orderorder = 'ASC';
        }

        $maxrow = $this->input->get_post('maxrow');
        $data['message'] = new stdClass();
        $data['message']->product = $this->chintantable->query($pageno, $maxrow, $orderby, $orderorder, $search, '', 'FROM `productdesignimage` INNER JOIN `fynx_product` ON `fynx_product`.`id`=`productdesignimage`.`product`
INNER JOIN `fynx_subcategory` ON `fynx_product`.`subcategory`  = `fynx_subcategory`.`id`
INNER JOIN `fynx_designs` ON `fynx_designs`.`id`  = `productdesignimage`.`design`
INNER JOIN `fynx_category` ON `fynx_subcategory`.`category`  = `fynx_category`.`id` ', "WHERE `fynx_category`.`name` LIKE '$category' $where ", 'GROUP BY `productdesignimage`.`product`,`productdesignimage`.`design`');
        //echo "";
        $data['message']->filter = $this->restapi_model->getFiltersLater($data['message']->product->querycomplete);

        $this->load->view('json', $data);
    }
    public function getFilters()
    {
        $categoryid = $this->input->get('category');
        $data['message'] = $this->restapi_model->getFilters($categoryid);
        $this->load->view('json', $data);
    }
    public function loginuser()
    {
        $data = json_decode(file_get_contents('php://input'), true);
        $email = $data['email'];
        $password = $data['password'];
        $data['message'] = $this->user_model->loginuser($email, $password);
        $this->load->view('json', $data);
    }
    public function getProductDetails()
    {
        $id = $this->input->get_post('id');
        $size = $this->input->get_post('size');
        $color = $this->input->get_post('color');
        $design = $this->input->get_post('design');
        $user = $this->session->userdata('id');
        $data['message'] = $this->product_model->getProductDetails($id, $user, $size, $color,$design);
        $this->load->view('json', $data);
    }
    public function showCart()
    {
        $userid = $this->session->userdata('id');

            if ($userid != '') {
            $data['message'] = $this->user_model->showCart($userid);
        }
        else
        {
            $cart = $this->cart->contents();
            $newcart = array();
            foreach ($cart as $item) {
                array_push($newcart, $item);
            }

            $data['message'] = $newcart;
            foreach($data['message'] as $key=>$element)
            {
              // print_r($data['message'][$key]["options"]);
                $proid=$element["id"];
                $data['message'][$key]["status"] = $data['message'][$key]["options"]["status"];
                $data['message'][$key]["plan"] = $data['message'][$key]["options"]["plan"];
                $data['message'][$key]["subtype"] = $data['message'][$key]["options"]["subtype"];
                $data['message'][$key]["months"] = $data['message'][$key]["options"]["months"];
            }
        }
        foreach($data['message'] as $key=>$element)
        {
            $proid=$element["id"];
            $data['message'][$key]["maxQuantity"]=$this->restapi_model->checkproductquantity($proid);
        }
        $this->load->view('json', $data);
    }

    function checkoutCheck() {
       $userid=$this->session->userdata("id");
       $newcart=array();
       if($userid!="")
       {
           $cart = $this->cart->contents();
           foreach ($cart as $item) {
               array_push($newcart, $item);
           }
       }
       else
       {
           $cart = $this->cart->contents();
           foreach ($cart as $item) {
               $quantity=$item->options->productquantity;
               $productid=$item->id;
               array_push($newcart, $item);
           }
       }
       $returnWhat=new stdClass();
       $returnWhat->value=true;
       $data["message"]=array();
       foreach($newcart as $element)
       {
           $proid=$element["id"];
           $element["maxQuantity"]=$this->restapi_model->checkproductquantity($proid);
           $maxQuantity = intval($element["maxQuantity"]);
           $cartQuantity = intval($element["qty"]);
             if($cartQuantity <= $maxQuantity) {
               //Enjoy
           }
           else
           {
                $returnWhat->value=false;
           }
       }
       $data["message"]=$returnWhat;
       $this->load->view("json", $data);
   }


    public function removeFromWishlist()
    {
        $data = json_decode(file_get_contents('php://input'), true);
        $user = $this->session->userdata('id');
        $product = $data['product'];
        $design = $data['design'];
        $data['message'] = $this->restapi_model->removeFromWishlist($user, $product, $design);
        $this->load->view('json', $data);
    }
    public function getAllSize()
    {
        $data['message'] = $this->restapi_model->getAllSize();
        $this->load->view('json', $data);
    }
//    public function getUserDetails()
//    {
//        $user = $this->session->userdata('id');
//        $data['message'] = $this->restapi_model->getUserDetails($user);
//        $this->load->view('json', $data);
//    }
    public function updateProfile()
    {
        $data = json_decode(file_get_contents('php://input'), true);
        $user = $data['id'];
        $firstname = $data['firstname'];
        $lastname = $data['lastname'];
        $email = $data['email'];
        $phone = $data['phone'];
        $billingline1 = $data['billingline1'];
        $billingline2 = $data['billingline2'];
        $billingline3 = $data['billingline3'];
        $billingcity = $data['billingcity'];
        $billingstate = $data['billingstate'];
        $billingcountry = $data['billingcountry'];
        $billingpincode = $data['billingpincode'];
        $shippingline1 = $data['shippingline1'];
        $shippingline2 = $data['shippingline2'];
        $shippingline3 = $data['shippingline3'];
        $shippingcity = $data['shippingcity'];
        $shippingstate = $data['shippingstate'];
        $shippingpincode = $data['shippingpincode'];
        $shippingcountry = $data['shippingcountry'];

        $data['message'] = $this->restapi_model->updateProfile($user, $firstname, $lastname, $email, $phone, $billingline1, $billingline2, $billingline3, $billingcity, $billingstate, $billingcountry, $billingpincode, $shippingline1, $shippingline2, $shippingline3, $shippingcity, $shippingstate, $shippingpincode, $shippingcountry);
        $this->load->view('json', $data);
    }
    public function changepassword()
    {
        $data = json_decode(file_get_contents('php://input'), true);
        $id = $data['id'];
        $oldpassword = $data['oldpassword'];
        $newpassword = $data['newpassword'];
        $confirmpassword = $data['confirmpassword'];
        $data['message'] = $this->restapi_model->changepassword($id, $oldpassword, $newpassword, $confirmpassword);
        $this->load->view('json', $data);
    }
    public function checkstatus()
    {
        $orderid = $this->input->get('orderid');
        $data['message'] = $this->restapi_model->checkstatus($orderid);
        $this->load->view('json', $data);
    }
    public function getorderbyorderid()
    {
        $orderid = $this->input->get('id');
        $data['message'] = $this->restapi_model->getorderbyorderid($orderid);
        $this->load->view('json', $data);
    }

    public function getorders()
    {
       $userid = $this->input->get('id');
        //$userid = $this->session->userdata('id');
        $data['message'] = $this->restapi_model->getorders($userid);
        $this->load->view('json', $data);
    }


    public function payumoneysuccess()
     {
       $workingKey='825cors0t20vgfolcm9adon2ixpz2qll';		//Working Key should be provided here.
       $encResponse=$_POST["encResponse"];	//This is the response sent by the CCAvenue Server
       $rcvdString=$this->aes->decrypt($encResponse,$workingKey);		//AES Decryption used as per the specified working key.
  echo $rcvdString;
     	$AuthDesc="";
     	$MerchantId="";
     	$OrderId="";
     	$Amount=0;
     	$Checksum=0;
     	$veriChecksum=false;

     	$decryptValues=explode('&', $rcvdString);
     	$dataSize=sizeof($decryptValues);
     	//******************************    Messages based on Checksum & AuthDesc   **********************************//
     	echo "<center>";


     	for($i = 0; $i < $dataSize; $i++)
     	{
     		$information=explode('=',$decryptValues[$i]);
     		if($i==0)	$MerchantId=$information[1];
     		if($i==1)	$OrderId=$information[1];
     		if($i==2)	$Amount=$information[1];
     		if($i==3)	$AuthDesc=$information[1];
     		if($i==4)	$Checksum=$information[1];
        if($i==22)$nb_bid=$information[1];
        if($i==23)$nb_order_no=$information[1];
     	}

     	$rcvdString=$MerchantId.'|'.$OrderId.'|'.$Amount.'|'.$AuthDesc.'|'.$workingKey;
     	$veriChecksum=$this->adler->verifyChecksum($this->adler->genchecksum($rcvdString), $Checksum);

     	if($veriChecksum==TRUE && $AuthDesc==="Y")
     	{
     		echo "<br>Thank you for shopping with us. Your credit card has been charged and your transaction is successful. We will be shipping your order to you soon.";
        $responsecode=2;
     		//Here you need to put in the routines for a successful
     		//transaction such as sending an email to customer,
     		//setting database status, informing logistics etc etc
     	}
     	else if($veriChecksum==TRUE && $AuthDesc==="B")
     	{
     		echo "<br>Thank you for shopping with us.We will keep you posted regarding the status of your order through e-mail";
        $responsecode=2;
     		//Here you need to put in the routines/e-mail for a  "Batch Processing" order
     		//This is only if payment for this transaction has been made by an American Express Card
     		//since American Express authorisation status is available only after 5-6 hours by mail from ccavenue and at the "View Pending Orders"
     	}
     	else if($veriChecksum==TRUE && $AuthDesc==="N")
     	{
     		echo "<br>Thank you for shopping with us.However,the transaction has been declined.";
        $responsecode=5;
     		//Here you need to put in the routines for a failed
     		//transaction such as sending an email to customer
     		//setting database status etc etc
     	}
     	else
     	{
     		echo "<br>Security Error. Illegal access detected";

     		//Here you need to simply ignore this and dont need
     		//to perform any operation in this condition
     	}
      $data['message'] = $this->restapi_model->updateorderstatusafterpayment($OrderId,$nb_bid, $nb_order_no, $responsecode,$Amount);

     }

    public function uploadImage()
    {
        $config['upload_path'] = './uploads/';
        $config['allowed_types'] = 'gif|jpg|png|jpeg';
        $this->load->library('upload', $config);
        $filename = 'image';
        $image = '';
        if ($this->upload->do_upload($filename)) {
            $uploaddata = $this->upload->data();
            $image = $uploaddata['file_name'];
            $imagename = $image;
        }
        $obj = new stdClass();
        $obj->value = $imagename;
        $data['message'] = $obj;
        $this->load->view('json', $data);
    }

    public function getImageForCustomize()
    {
        $type = $this->input->get('type');
        $color = $this->input->get('color');
        if ($color == '') {
            $color = '1';
        }
        $query = new stdClass();
        $query->image = $this->db->query("SELECT `id`, `subcategory`, `quantity`, `name`, `type`, `description`, `visibility`, `price`, `relatedproduct`, `category`, `color`, `size`, `sizechart`, `status`, `sku`, `image1`, `image2`, `baseproduct`, `discountprice` FROM `fynx_product` WHERE `type`='$type' AND `color`='$color'")->row();
        $query->size = $this->db->query("SELECT DISTINCT `fynx_size`.*,`fynx_product`.`id` as `product` ,`fynx_product`.`price` as `price`  FROM `fynx_product` INNER JOIN `fynx_size` ON `fynx_size`.`id` = `fynx_product`.`size`  WHERE `type`='$type' AND `color`='$color' GROUP BY `fynx_size`.`id`")->result();
        $query->color = $this->db->query("SELECT DISTINCT `fynx_color`.*,`fynx_product`.`id` as `product`,`fynx_product`.`price` as `price` FROM `fynx_product` INNER JOIN `fynx_color` ON `fynx_color`.`id` = `fynx_product`.`color`  WHERE `type`='$type' GROUP BY `fynx_color`.`id`")->result();
        $data['message'] = $query;
        $this->load->view('json', $data);
    }
}
