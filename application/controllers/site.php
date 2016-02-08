<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Site extends CI_Controller
{
	public function __construct( )
	{
		parent::__construct();

		$this->is_logged_in();
	}
	function is_logged_in( )
	{
		$is_logged_in = $this->session->userdata( 'logged_in' );
		if ( $is_logged_in !== 'true' || !isset( $is_logged_in ) ) {
			redirect( base_url() . 'index.php/login', 'refresh' );
		} //$is_logged_in !== 'true' || !isset( $is_logged_in )
	}
	function checkaccess($access)
	{
		$accesslevel=$this->session->userdata('accesslevel');
		if(!in_array($accesslevel,$access))
			redirect( base_url() . 'index.php/site?alerterror=You do not have access to this page. ', 'refresh' );
	}
    function getCategoryBySubCategory($id)
	{
        $id=$this->input->get_post('id');
		$data1=$this->subcategory_model->getCategoryBySubCategory($id);
          $data["message"] = $data1;
        $this->load->view("json", $data);
	}
    public function getOrderingDone()
    {
        $orderby=$this->input->get("orderby");
        $ids=$this->input->get("ids");
        $ids=explode(",",$ids);
        $tablename=$this->input->get("tablename");
        $where=$this->input->get("where");
        if($where == "" || $where=="undefined")
        {
            $where=1;
        }
        $access = array(
            '1',
        );
        $this->checkAccess($access);
        $i=1;
        foreach($ids as $id)
        {
            //echo "UPDATE `$tablename` SET `$orderby` = '$i' WHERE `id` = `$id` AND $where";
            $this->db->query("UPDATE `$tablename` SET `$orderby` = '$i' WHERE `id` = '$id' AND $where");
            $i++;
            //echo "/n";
        }
        $data["message"]=true;
        $this->load->view("json",$data);

    }
	public function index()
	{
		$access = array("1","2");
		$this->checkaccess($access);
		$data[ 'page' ] = 'dashboard';
		$data[ 'title' ] = 'Welcome';
		$this->load->view( 'template', $data );
	}
	public function createuser()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['accesslevel']=$this->user_model->getaccesslevels();
		$data[ 'status' ] =$this->user_model->getstatusdropdown();
		$data[ 'logintype' ] =$this->user_model->getlogintypedropdown();
        $data['gender']=$this->user_model->getgenderdropdown();
//        $data['category']=$this->category_model->getcategorydropdown();
		$data[ 'page' ] = 'createuser';
		$data[ 'title' ] = 'Create User';
		$this->load->view( 'template', $data );
	}
	function createusersubmit()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->form_validation->set_rules('name','Name','trim|required|max_length[30]');
		$this->form_validation->set_rules('email','Email','trim|required|valid_email|is_unique[user.email]');
		$this->form_validation->set_rules('password','Password','trim|required|min_length[6]|max_length[30]');
		$this->form_validation->set_rules('confirmpassword','Confirm Password','trim|required|matches[password]');
		$this->form_validation->set_rules('accessslevel','Accessslevel','trim');
		$this->form_validation->set_rules('status','status','trim|');
		$this->form_validation->set_rules('socialid','Socialid','trim');
		$this->form_validation->set_rules('logintype','logintype','trim');
		$this->form_validation->set_rules('json','json','trim');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
            $data['gender']=$this->user_model->getgenderdropdown();
			$data['accesslevel']=$this->user_model->getaccesslevels();
            $data[ 'status' ] =$this->user_model->getstatusdropdown();
            $data[ 'logintype' ] =$this->user_model->getlogintypedropdown();
            $data[ 'page' ] = 'createuser';
            $data[ 'title' ] = 'Create User';
            $this->load->view( 'template', $data );
		}
		else
		{
            $name=$this->input->post('name');
            $email=$this->input->post('email');
            $password=$this->input->post('password');
            $accesslevel=$this->input->post('accesslevel');
            $status=$this->input->post('status');
            $socialid=$this->input->post('socialid');
            $logintype=$this->input->post('logintype');
            $json=$this->input->post('json');
            $firstname=$this->input->post('firstname');
            $lastname=$this->input->post('lastname');
            $phone=$this->input->post('phone');
            $billingaddress=$this->input->post('billingaddress');
            $billingcity=$this->input->post('billingcity');
            $billingstate=$this->input->post('billingstate');
            $billingcountry=$this->input->post('billingcountry');
            $billingpincode=$this->input->post('billingpincode');
            $billingcontact=$this->input->post('billingcontact');

            $shippingaddress=$this->input->post('shippingaddress');
            $shippingcity=$this->input->post('shippingcity');
            $shippingstate=$this->input->post('shippingstate');
            $shippingcountry=$this->input->post('shippingcountry');
            $shippingpincode=$this->input->post('shippingpincode');
            $shippingcontact=$this->input->post('shippingcontact');
            $shippingname=$this->input->post('shippingname');
            $currency=$this->input->post('currency');
            $credit=$this->input->post('credit');
            $companyname=$this->input->post('companyname');
            $registrationno=$this->input->post('registrationno');
            $vatnumber=$this->input->post('vatnumber');
            $country=$this->input->post('country');
            $fax=$this->input->post('fax');
            $gender=$this->input->post('gender');
            $billingline1=$this->input->post('billingline1');
            $billingline2=$this->input->post('billingline2');
            $billingline3=$this->input->post('billingline3');
            $shippingline1=$this->input->post('shippingline1');
            $shippingline2=$this->input->post('shippingline2');
            $shippingline3=$this->input->post('shippingline3');

            $config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png|jpeg';
			$this->load->library('upload', $config);
			$filename="image";
			$image="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image=$uploaddata['file_name'];

                $config_r['source_image']   = './uploads/' . $uploaddata['file_name'];
                $config_r['maintain_ratio'] = TRUE;
                $config_t['create_thumb'] = FALSE;///add this
                $config_r['width']   = 800;
                $config_r['height'] = 800;
                $config_r['quality']    = 100;
                //end of configs

                $this->load->library('image_lib', $config_r);
                $this->image_lib->initialize($config_r);
                if(!$this->image_lib->resize())
                {
                    echo "Failed." . $this->image_lib->display_errors();
                    //return false;
                }
                else
                {
                    //print_r($this->image_lib->dest_image);
                    //dest_image
                    $image=$this->image_lib->dest_image;
                    //return false;
                }

			}

			if($this->user_model->create($name,$email,$password,$accesslevel,$status,$socialid,$logintype,$image,$json,$firstname,$lastname,$phone,$billingaddress,$billingcity,$billingstate,$billingcountry,$billingpincode,$billingcontact,$shippingaddress,$shippingcity,$shippingstate,$shippingcountry,$shippingpincode,$shippingcontact,$shippingname,$currency,$credit,$companyname,$registrationno,$vatnumber,$country,$fax,$gender,$billingline1,$billingline2,$billingline3,$shippingline1,$shippingline2,$shippingline3)==0)
			$data['alerterror']="New user could not be created.";
			else
			$data['alertsuccess']="User created Successfully.";
			$data['redirect']="site/viewusers";
			$this->load->view("redirect",$data);
		}
	}
    function viewusers()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['page']='viewusers';
        $data['base_url'] = site_url("site/viewusersjson");

		$data['title']='View Users';
		$this->load->view('template',$data);
	}
    function viewusersjson()
	{
		$access = array("1");
		$this->checkaccess($access);


        $elements=array();
        $elements[0]=new stdClass();
        $elements[0]->field="`user`.`id`";
        $elements[0]->sort="1";
        $elements[0]->header="ID";
        $elements[0]->alias="id";


        $elements[1]=new stdClass();
        $elements[1]->field="`user`.`name`";
        $elements[1]->sort="1";
        $elements[1]->header="Name";
        $elements[1]->alias="name";

        $elements[2]=new stdClass();
        $elements[2]->field="`user`.`email`";
        $elements[2]->sort="1";
        $elements[2]->header="Email";
        $elements[2]->alias="email";

        $elements[3]=new stdClass();
        $elements[3]->field="`user`.`socialid`";
        $elements[3]->sort="1";
        $elements[3]->header="SocialId";
        $elements[3]->alias="socialid";

        $elements[4]=new stdClass();
        $elements[4]->field="`user`.`logintype`";
        $elements[4]->sort="1";
        $elements[4]->header="Logintype";
        $elements[4]->alias="logintype";

        $elements[5]=new stdClass();
        $elements[5]->field="`user`.`json`";
        $elements[5]->sort="1";
        $elements[5]->header="Json";
        $elements[5]->alias="json";

        $elements[6]=new stdClass();
        $elements[6]->field="`accesslevel`.`name`";
        $elements[6]->sort="1";
        $elements[6]->header="Accesslevel";
        $elements[6]->alias="accesslevelname";

        $elements[7]=new stdClass();
        $elements[7]->field="`statuses`.`name`";
        $elements[7]->sort="1";
        $elements[7]->header="Status";
        $elements[7]->alias="status";


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

        $data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `user` LEFT OUTER JOIN `logintype` ON `logintype`.`id`=`user`.`logintype` LEFT OUTER JOIN `accesslevel` ON `accesslevel`.`id`=`user`.`accesslevel` LEFT OUTER JOIN `statuses` ON `statuses`.`id`=`user`.`status`");

		$this->load->view("json",$data);
	}


	function edituser()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data[ 'status' ] =$this->user_model->getstatusdropdown();
        $data["before1"]=$this->input->get('id');
        $data["before2"]=$this->input->get('id');
        $data["before3"]=$this->input->get('id');
        $data["before4"]=$this->input->get('id');
        $data["before5"]=$this->input->get('id');
		$data['accesslevel']=$this->user_model->getaccesslevels();
		$data['gender']=$this->user_model->getgenderdropdown();
		$data[ 'logintype' ] =$this->user_model->getlogintypedropdown();
		$data['before']=$this->user_model->beforeedit($this->input->get('id'));
		$data['page']='edituser';
		$data['page2']='block/userblock';
		$data['title']='Edit User';
		$this->load->view('templatewith2',$data);
	}
	function editusersubmit()
	{
		$access = array("1");
		$this->checkaccess($access);

		$this->form_validation->set_rules('name','Name','trim|required|max_length[30]');
		$this->form_validation->set_rules('email','Email','trim|required|valid_email');
		$this->form_validation->set_rules('password','Password','trim|min_length[6]|max_length[30]');
		$this->form_validation->set_rules('confirmpassword','Confirm Password','trim|matches[password]');
		$this->form_validation->set_rules('accessslevel','Accessslevel','trim');
		$this->form_validation->set_rules('status','status','trim|');
		$this->form_validation->set_rules('socialid','Socialid','trim');
		$this->form_validation->set_rules('logintype','logintype','trim');
		$this->form_validation->set_rules('json','json','trim');
		if($this->form_validation->run() == FALSE)
		{
			$data['alerterror'] = validation_errors();
			$data[ 'status' ] =$this->user_model->getstatusdropdown();
            $data['gender']=$this->user_model->getgenderdropdown();
			$data['accesslevel']=$this->user_model->getaccesslevels();
            $data[ 'logintype' ] =$this->user_model->getlogintypedropdown();
			$data['before']=$this->user_model->beforeedit($this->input->post('id'));
			$data['page']='edituser';
//			$data['page2']='block/userblock';
			$data['title']='Edit User';
			$this->load->view('template',$data);
		}
		else
		{

            $id=$this->input->get_post('id');
            $name=$this->input->get_post('name');
            $email=$this->input->get_post('email');
            $password=$this->input->get_post('password');
            $accesslevel=$this->input->get_post('accesslevel');
            $status=$this->input->get_post('status');
            $socialid=$this->input->get_post('socialid');
            $logintype=$this->input->get_post('logintype');
            $json=$this->input->get_post('json');
//            $category=$this->input->get_post('category');
            $firstname=$this->input->post('firstname');
            $lastname=$this->input->post('lastname');
            $phone=$this->input->post('phone');
            $billingaddress=$this->input->post('billingaddress');
            $billingcity=$this->input->post('billingcity');
            $billingstate=$this->input->post('billingstate');
            $billingcountry=$this->input->post('billingcountry');
            $billingpincode=$this->input->post('billingpincode');
            $billingcontact=$this->input->post('billingcontact');

            $shippingaddress=$this->input->post('shippingaddress');
            $shippingcity=$this->input->post('shippingcity');
            $shippingstate=$this->input->post('shippingstate');
            $shippingcountry=$this->input->post('shippingcountry');
            $shippingpincode=$this->input->post('shippingpincode');
            $shippingcontact=$this->input->post('shippingcontact');
            $shippingname=$this->input->post('shippingname');
            $currency=$this->input->post('currency');
            $credit=$this->input->post('credit');
            $companyname=$this->input->post('companyname');
            $registrationno=$this->input->post('registrationno');
            $vatnumber=$this->input->post('vatnumber');
            $country=$this->input->post('country');
            $fax=$this->input->post('fax');
            $gender=$this->input->post('gender');
            $billingline1=$this->input->post('billingline1');
            $billingline2=$this->input->post('billingline2');
            $billingline3=$this->input->post('billingline3');
            $shippingline1=$this->input->post('shippingline1');
            $shippingline2=$this->input->post('shippingline2');
            $shippingline3=$this->input->post('shippingline3');
            $config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png|jpeg';
			$this->load->library('upload', $config);
			$filename="image";
			$image="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image=$uploaddata['file_name'];

                $config_r['source_image']   = './uploads/' . $uploaddata['file_name'];
                $config_r['maintain_ratio'] = TRUE;
                $config_t['create_thumb'] = FALSE;///add this
                $config_r['width']   = 800;
                $config_r['height'] = 800;
                $config_r['quality']    = 100;
                //end of configs

                $this->load->library('image_lib', $config_r);
                $this->image_lib->initialize($config_r);
                if(!$this->image_lib->resize())
                {
                    echo "Failed." . $this->image_lib->display_errors();
                    //return false;
                }
                else
                {
                    //print_r($this->image_lib->dest_image);
                    //dest_image
                    $image=$this->image_lib->dest_image;
                    //return false;
                }

			}

            if($image=="")
            {
            $image=$this->user_model->getuserimagebyid($id);
               // print_r($image);
                $image=$image->image;
            }

			if($this->user_model->edit($id,$name,$email,$password,$accesslevel,$status,$socialid,$logintype,$image,$json,$firstname,$lastname,$phone,$billingaddress,$billingcity,$billingstate,$billingcountry,$billingpincode,$billingcontact,$shippingaddress,$shippingcity,$shippingstate,$shippingcountry,$shippingpincode,$shippingcontact,$shippingname,$currency,$credit,$companyname,$registrationno,$vatnumber,$country,$fax,$gender,$billingline1,$billingline2,$billingline3,$shippingline1,$shippingline2,$shippingline3)==0)
			$data['alerterror']="User Editing was unsuccesful";
			else
			$data['alertsuccess']="User edited Successfully.";

			$data['redirect']="site/viewusers";
			//$data['other']="template=$template";
			$this->load->view("redirect",$data);

		}
	}

	function deleteuser()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->user_model->deleteuser($this->input->get('id'));
//		$data['table']=$this->user_model->viewusers();
		$data['alertsuccess']="User Deleted Successfully";
		$data['redirect']="site/viewusers";
			//$data['other']="template=$template";
		$this->load->view("redirect",$data);
	}
	function changeuserstatus()
	{
		$access = array("1");
		$this->checkaccess($access);
		$this->user_model->changestatus($this->input->get('id'));
		$data['table']=$this->user_model->viewusers();
		$data['alertsuccess']="Status Changed Successfully";
		$data['redirect']="site/viewusers";
        $data['other']="template=$template";
        $this->load->view("redirect",$data);
	}



    public function viewuseraddress()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewuseraddress";
$data["base_url"]=site_url("site/viewuseraddressjson");
$data["title"]="View useraddress";
$this->load->view("template",$data);
}
function viewuseraddressjson()
{
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`fynx_useraddress`.`id`";
$elements[0]->sort="1";
$elements[0]->header="ID";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`fynx_useraddress`.`user`";
$elements[1]->sort="1";
$elements[1]->header="User";
$elements[1]->alias="user";
$elements[2]=new stdClass();
$elements[2]->field="`fynx_useraddress`.`name`";
$elements[2]->sort="1";
$elements[2]->header="Name";
$elements[2]->alias="name";
$elements[3]=new stdClass();
$elements[3]->field="`fynx_useraddress`.`billingcity`";
$elements[3]->sort="1";
$elements[3]->header="Billing City";
$elements[3]->alias="billingcity";
$elements[4]=new stdClass();
$elements[4]->field="`fynx_useraddress`.`billingstate`";
$elements[4]->sort="1";
$elements[4]->header="Billing State";
$elements[4]->alias="billingstate";
$elements[5]=new stdClass();
$elements[5]->field="`fynx_useraddress`.`billingcountry`";
$elements[5]->sort="1";
$elements[5]->header="Billing Country";
$elements[5]->alias="billingcountry";
$elements[6]=new stdClass();
$elements[6]->field="`fynx_useraddress`.`shippingcity`";
$elements[6]->sort="1";
$elements[6]->header="Shipping City";
$elements[6]->alias="shippingcity";
$elements[7]=new stdClass();
$elements[7]->field="`fynx_useraddress`.`shippingstate`";
$elements[7]->sort="1";
$elements[7]->header="Shipping State";
$elements[7]->alias="shippingstate";
$elements[8]=new stdClass();
$elements[8]->field="`fynx_useraddress`.`shippingcountry`";
$elements[8]->sort="1";
$elements[8]->header="Shipping Country";
$elements[8]->alias="shippingcountry";
$elements[9]=new stdClass();
$elements[9]->field="`fynx_useraddress`.`shippingpincode`";
$elements[9]->sort="1";
$elements[9]->header="Shipping Pincode";
$elements[9]->alias="shippingpincode";
$elements[10]=new stdClass();
$elements[10]->field="`fynx_useraddress`.`billingaddress`";
$elements[10]->sort="1";
$elements[10]->header="Billing Address";
$elements[10]->alias="billingaddress";
$elements[11]=new stdClass();
$elements[11]->field="`fynx_useraddress`.`shippingaddress`";
$elements[11]->sort="1";
$elements[11]->header="Shipping Address";
$elements[11]->alias="shippingaddress";
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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `fynx_useraddress`");
$this->load->view("json",$data);
}

public function createuseraddress()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="createuseraddress";
$data["title"]="Create useraddress";
$this->load->view("template",$data);
}
public function createuseraddresssubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("user","User","trim");
$this->form_validation->set_rules("name","Name","trim");
$this->form_validation->set_rules("billingcity","Billing City","trim");
$this->form_validation->set_rules("billingstate","Billing State","trim");
$this->form_validation->set_rules("billingcountry","Billing Country","trim");
$this->form_validation->set_rules("shippingcity","Shipping City","trim");
$this->form_validation->set_rules("shippingstate","Shipping State","trim");
$this->form_validation->set_rules("shippingcountry","Shipping Country","trim");
$this->form_validation->set_rules("shippingpincode","Shipping Pincode","trim");
$this->form_validation->set_rules("billingaddress","Billing Address","trim");
$this->form_validation->set_rules("shippingaddress","Shipping Address","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="createuseraddress";
$data["title"]="Create useraddress";
$this->load->view("template",$data);
}
else
{
$user=$this->input->get_post("user");
$name=$this->input->get_post("name");
$billingcity=$this->input->get_post("billingcity");
$billingstate=$this->input->get_post("billingstate");
$billingcountry=$this->input->get_post("billingcountry");
$shippingcity=$this->input->get_post("shippingcity");
$shippingstate=$this->input->get_post("shippingstate");
$shippingcountry=$this->input->get_post("shippingcountry");
$shippingpincode=$this->input->get_post("shippingpincode");
$billingaddress=$this->input->get_post("billingaddress");
$shippingaddress=$this->input->get_post("shippingaddress");
if($this->useraddress_model->create($user,$name,$billingcity,$billingstate,$billingcountry,$shippingcity,$shippingstate,$shippingcountry,$shippingpincode,$billingaddress,$shippingaddress)==0)
$data["alerterror"]="New useraddress could not be created.";
else
$data["alertsuccess"]="useraddress created Successfully.";
$data["redirect"]="site/viewuseraddress";
$this->load->view("redirect",$data);
}
}
public function edituseraddress()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="edituseraddress";
$data["title"]="Edit useraddress";
$data["before"]=$this->useraddress_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
public function edituseraddresssubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("id","ID","trim");
$this->form_validation->set_rules("user","User","trim");
$this->form_validation->set_rules("name","Name","trim");
$this->form_validation->set_rules("billingcity","Billing City","trim");
$this->form_validation->set_rules("billingstate","Billing State","trim");
$this->form_validation->set_rules("billingcountry","Billing Country","trim");
$this->form_validation->set_rules("shippingcity","Shipping City","trim");
$this->form_validation->set_rules("shippingstate","Shipping State","trim");
$this->form_validation->set_rules("shippingcountry","Shipping Country","trim");
$this->form_validation->set_rules("shippingpincode","Shipping Pincode","trim");
$this->form_validation->set_rules("billingaddress","Billing Address","trim");
$this->form_validation->set_rules("shippingaddress","Shipping Address","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="edituseraddress";
$data["title"]="Edit useraddress";
$data["before"]=$this->useraddress_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$user=$this->input->get_post("user");
$name=$this->input->get_post("name");
$billingcity=$this->input->get_post("billingcity");
$billingstate=$this->input->get_post("billingstate");
$billingcountry=$this->input->get_post("billingcountry");
$shippingcity=$this->input->get_post("shippingcity");
$shippingstate=$this->input->get_post("shippingstate");
$shippingcountry=$this->input->get_post("shippingcountry");
$shippingpincode=$this->input->get_post("shippingpincode");
$billingaddress=$this->input->get_post("billingaddress");
$shippingaddress=$this->input->get_post("shippingaddress");
if($this->useraddress_model->edit($id,$user,$name,$billingcity,$billingstate,$billingcountry,$shippingcity,$shippingstate,$shippingcountry,$shippingpincode,$billingaddress,$shippingaddress)==0)
$data["alerterror"]="New useraddress could not be Updated.";
else
$data["alertsuccess"]="useraddress Updated Successfully.";
$data["redirect"]="site/viewuseraddress";
$this->load->view("redirect",$data);
}
}
public function deleteuseraddress()
{
$access=array("1");
$this->checkaccess($access);
$this->useraddress_model->delete($this->input->get("id"));
$data["redirect"]="site/viewuseraddress";
$this->load->view("redirect",$data);
}
public function viewcart()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewcart";
    $data["before1"]=$this->input->get('id');
        $data["before2"]=$this->input->get('id');
        $data["before3"]=$this->input->get('id');
        $data["before4"]=$this->input->get('id');
        $data["before5"]=$this->input->get('id');
$data['page2']='block/userblock';
$data["base_url"]=site_url("site/viewcartjson?id=").$this->input->get('id');
$data["title"]="View cart";
$this->load->view("templatewith2",$data);
}
function viewcartjson()
{
    $id=$this->input->get('id');
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`fynx_cart`.`id`";
$elements[0]->sort="1";
$elements[0]->header="ID";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`fynx_cart`.`user`";
$elements[1]->sort="1";
$elements[1]->header="User";
$elements[1]->alias="user";
$elements[2]=new stdClass();
$elements[2]->field="`fynx_cart`.`quantity`";
$elements[2]->sort="1";
$elements[2]->header="Quantity";
$elements[2]->alias="quantity";
$elements[3]=new stdClass();
$elements[3]->field="`fynx_cart`.`product`";
$elements[3]->sort="1";
$elements[3]->header="Product";
$elements[3]->alias="product";
$elements[4]=new stdClass();
$elements[4]->field="`fynx_cart`.`timestamp`";
$elements[4]->sort="1";
$elements[4]->header="Timestamp";
$elements[4]->alias="timestamp";

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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `fynx_cart`","WHERE `fynx_cart`.`user`='$id'");
$this->load->view("json",$data);
}

public function createcart()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="createcart";
$data["title"]="Create cart";
$this->load->view("template",$data);
}
public function createcartsubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("user","User","trim");
$this->form_validation->set_rules("quantity","Quantity","trim");
$this->form_validation->set_rules("product","Product","trim");
$this->form_validation->set_rules("timestamp","Timestamp","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="createcart";
$data["title"]="Create cart";
$this->load->view("template",$data);
}
else
{
$user=$this->input->get_post("user");
$quantity=$this->input->get_post("quantity");
$product=$this->input->get_post("product");
$timestamp=$this->input->get_post("timestamp");
if($this->cart_model->create($user,$quantity,$product,$timestamp)==0)
$data["alerterror"]="New cart could not be created.";
else
$data["alertsuccess"]="cart created Successfully.";
$data["redirect"]="site/viewcart";
$this->load->view("redirect",$data);
}
}
public function editcart()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="editcart";
$data["title"]="Edit cart";
$data["before"]=$this->cart_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
public function editcartsubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("id","ID","trim");
$this->form_validation->set_rules("user","User","trim");
$this->form_validation->set_rules("quantity","Quantity","trim");
$this->form_validation->set_rules("product","Product","trim");
$this->form_validation->set_rules("timestamp","Timestamp","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="editcart";
$data["title"]="Edit cart";
$data["before"]=$this->cart_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$user=$this->input->get_post("user");
$quantity=$this->input->get_post("quantity");
$product=$this->input->get_post("product");
$timestamp=$this->input->get_post("timestamp");
if($this->cart_model->edit($id,$user,$quantity,$product,$timestamp)==0)
$data["alerterror"]="New cart could not be Updated.";
else
$data["alertsuccess"]="cart Updated Successfully.";
$data["redirect"]="site/viewcart";
$this->load->view("redirect",$data);
}
}
public function deletecart()
{
$access=array("1");
$this->checkaccess($access);
$this->cart_model->delete($this->input->get("id"));
$data["redirect"]="site/viewcart";
$this->load->view("redirect",$data);
}
public function viewwishlist()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewwishlist";
    $data["before1"]=$this->input->get('id');
        $data["before2"]=$this->input->get('id');
        $data["before3"]=$this->input->get('id');
        $data["before4"]=$this->input->get('id');
        $data["before5"]=$this->input->get('id');
$data['page2']='block/userblock';
$data["base_url"]=site_url("site/viewwishlistjson?id=".$this->input->get('id'));
$data["title"]="View wishlist";
$this->load->view("templatewith2",$data);
}
function viewwishlistjson()
{
    $user=$this->input->get('id');
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`fynx_wishlist`.`id`";
$elements[0]->sort="1";
$elements[0]->header="ID";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`fynx_wishlist`.`user`";
$elements[1]->sort="1";
$elements[1]->header="User";
$elements[1]->alias="user";
$elements[2]=new stdClass();
$elements[2]->field="`fynx_wishlist`.`product`";
$elements[2]->sort="1";
$elements[2]->header="Product";
$elements[2]->alias="product";
$elements[3]=new stdClass();
$elements[3]->field="`fynx_wishlist`.`timestamp`";
$elements[3]->sort="1";
$elements[3]->header="Timestamp";
$elements[3]->alias="timestamp";

$elements[4]=new stdClass();
$elements[4]->field="`fynx_product`.`name`";
$elements[4]->sort="1";
$elements[4]->header="Product Name";
$elements[4]->alias="productname";
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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `fynx_wishlist` LEFT OUTER JOIN `fynx_product` ON `fynx_product`.`id`=`fynx_wishlist`.`product`","WHERE `fynx_wishlist`.`user`='$user'");
$this->load->view("json",$data);
}

public function createwishlist()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="createwishlist";
$data["title"]="Create wishlist";
$this->load->view("template",$data);
}
public function createwishlistsubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("user","User","trim");
$this->form_validation->set_rules("product","Product","trim");
$this->form_validation->set_rules("timestamp","Timestamp","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="createwishlist";
$data["title"]="Create wishlist";
$this->load->view("template",$data);
}
else
{
$user=$this->input->get_post("user");
$product=$this->input->get_post("product");
$timestamp=$this->input->get_post("timestamp");
if($this->wishlist_model->create($user,$product,$timestamp)==0)
$data["alerterror"]="New wishlist could not be created.";
else
$data["alertsuccess"]="wishlist created Successfully.";
$data["redirect"]="site/viewwishlist";
$this->load->view("redirect",$data);
}
}
public function editwishlist()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="editwishlist";
$data["title"]="Edit wishlist";
$data["before"]=$this->wishlist_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
public function editwishlistsubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("id","ID","trim");
$this->form_validation->set_rules("user","User","trim");
$this->form_validation->set_rules("product","Product","trim");
$this->form_validation->set_rules("timestamp","Timestamp","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="editwishlist";
$data["title"]="Edit wishlist";
$data["before"]=$this->wishlist_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$user=$this->input->get_post("user");
$product=$this->input->get_post("product");
$timestamp=$this->input->get_post("timestamp");
if($this->wishlist_model->edit($id,$user,$product,$timestamp)==0)
$data["alerterror"]="New wishlist could not be Updated.";
else
$data["alertsuccess"]="wishlist Updated Successfully.";
$data["redirect"]="site/viewwishlist";
$this->load->view("redirect",$data);
}
}
public function deletewishlist()
{
$access=array("1");
$this->checkaccess($access);
$this->wishlist_model->delete($this->input->get("id"));
$data["redirect"]="site/viewwishlist";
$this->load->view("redirect",$data);
}
public function viewcredit()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewcredit";
$data["base_url"]=site_url("site/viewcreditjson");
$data["title"]="View credit";
$this->load->view("template",$data);
}
function viewcreditjson()
{
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`fynx_credit`.`id`";
$elements[0]->sort="1";
$elements[0]->header="ID";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`fynx_credit`.`user`";
$elements[1]->sort="1";
$elements[1]->header="User";
$elements[1]->alias="user";
$elements[2]=new stdClass();
$elements[2]->field="`fynx_credit`.`credit`";
$elements[2]->sort="1";
$elements[2]->header="Credit";
$elements[2]->alias="credit";
$elements[3]=new stdClass();
$elements[3]->field="`fynx_credit`.`addcredit`";
$elements[3]->sort="1";
$elements[3]->header="Add Credit";
$elements[3]->alias="addcredit";
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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `fynx_credit`");
$this->load->view("json",$data);
}

public function createcredit()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="createcredit";
$data["title"]="Create credit";
$this->load->view("template",$data);
}
public function createcreditsubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("user","User","trim");
$this->form_validation->set_rules("credit","Credit","trim");
$this->form_validation->set_rules("addcredit","Add Credit","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="createcredit";
$data["title"]="Create credit";
$this->load->view("template",$data);
}
else
{
$user=$this->input->get_post("user");
$credit=$this->input->get_post("credit");
$addcredit=$this->input->get_post("addcredit");
if($this->credit_model->create($user,$credit,$addcredit)==0)
$data["alerterror"]="New credit could not be created.";
else
$data["alertsuccess"]="credit created Successfully.";
$data["redirect"]="site/viewcredit";
$this->load->view("redirect",$data);
}
}
public function editcredit()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="editcredit";
$data["title"]="Edit credit";
$data["before"]=$this->credit_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
public function editcreditsubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("id","ID","trim");
$this->form_validation->set_rules("user","User","trim");
$this->form_validation->set_rules("credit","Credit","trim");
$this->form_validation->set_rules("addcredit","Add Credit","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="editcredit";
$data["title"]="Edit credit";
$data["before"]=$this->credit_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$user=$this->input->get_post("user");
$credit=$this->input->get_post("credit");
$addcredit=$this->input->get_post("addcredit");
if($this->credit_model->edit($id,$user,$credit,$addcredit)==0)
$data["alerterror"]="New credit could not be Updated.";
else
$data["alertsuccess"]="credit Updated Successfully.";
$data["redirect"]="site/viewcredit";
$this->load->view("redirect",$data);
}
}
public function deletecredit()
{
$access=array("1");
$this->checkaccess($access);
$this->credit_model->delete($this->input->get("id"));
$data["redirect"]="site/viewcredit";
$this->load->view("redirect",$data);
}
public function viewproduct()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewproduct";
$data["base_url"]=site_url("site/viewproductjson");
$data["title"]="View product";
$this->load->view("template",$data);
}
function viewproductjson()
{
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`fynx_product`.`id`";
$elements[0]->sort="1";
$elements[0]->header="ID";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`fynx_product`.`subcategory`";
$elements[1]->sort="1";
$elements[1]->header="Subcategory";
$elements[1]->alias="subcategory";
$elements[2]=new stdClass();
$elements[2]->field="`fynx_product`.`quantity`";
$elements[2]->sort="1";
$elements[2]->header="Quantity";
$elements[2]->alias="quantity";
$elements[3]=new stdClass();
$elements[3]->field="`fynx_product`.`name`";
$elements[3]->sort="1";
$elements[3]->header="Name";
$elements[3]->alias="name";
$elements[4]=new stdClass();
$elements[4]->field="`fynx_product`.`type`";
$elements[4]->sort="1";
$elements[4]->header="Type";
$elements[4]->alias="type";
$elements[5]=new stdClass();
$elements[5]->field="`fynx_product`.`about`";
$elements[5]->sort="1";
$elements[5]->header="Description";
$elements[5]->alias="description";
$elements[6]=new stdClass();
$elements[6]->field="`fynx_product`.`visibility`";
$elements[6]->sort="1";
$elements[6]->header="Visibility";
$elements[6]->alias="visibility";
$elements[7]=new stdClass();
$elements[7]->field="`fynx_product`.`price`";
$elements[7]->sort="1";
$elements[7]->header="Price";
$elements[7]->alias="price";
$elements[8]=new stdClass();
$elements[8]->field="`fynx_product`.`relatedproduct`";
$elements[8]->sort="1";
$elements[8]->header="Related Product";
$elements[8]->alias="relatedproduct";
$elements[9]=new stdClass();
$elements[9]->field="`fynx_product`.`category`";
$elements[9]->sort="1";
$elements[9]->header="Category";
$elements[9]->alias="category";
$elements[10]=new stdClass();
$elements[10]->field="`fynx_product`.`color`";
$elements[10]->sort="1";
$elements[10]->header="Color";
$elements[10]->alias="color";
$elements[11]=new stdClass();
$elements[11]->field="`fynx_product`.`size`";
$elements[11]->sort="1";
$elements[11]->header="Size";
$elements[11]->alias="size";
$elements[12]=new stdClass();
$elements[12]->field="`fynx_product`.`sizechart`";
$elements[12]->sort="1";
$elements[12]->header="Size Chart";
$elements[12]->alias="sizechart";
$elements[13]=new stdClass();
$elements[13]->field="`fynx_product`.`status`";
$elements[13]->sort="1";
$elements[13]->header="Status";
$elements[13]->alias="status";

$elements[14]=new stdClass();
$elements[14]->field="`fynx_product`.`sku`";
$elements[14]->sort="1";
$elements[14]->header="sku";
$elements[14]->alias="sku";
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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `fynx_product`");
$this->load->view("json",$data);
}

public function createproduct()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="createproduct";

		$data['category']=$this->category_model->getcategorydropdown();
		$data['subcategory']=$this->subcategory_model->getsubcategorydropdown();
		$data['visibility']=$this->product_model->getvisibility();
        $data['type']=$this->type_model->gettypedropdown();
        $data['size']=$this->size_model->getsizedropdown();
        $data['color']=$this->color_model->getcolordropdown();
        $data['sizechart']=$this->sizechart_model->getsizechartdropdown();
        $data['relatedproduct']=$this->product_model->getproductdropdown();
    $data['status']=$this->user_model->getstatusdropdown();
$data["title"]="Create product";
$this->load->view("template",$data);
}
public function createproductsubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("subcategory","Subcategory","trim");
$this->form_validation->set_rules("quantity","Quantity","trim");
$this->form_validation->set_rules("name","Name","trim");
$this->form_validation->set_rules("type","Type","trim");
$this->form_validation->set_rules("about","Description","trim");
$this->form_validation->set_rules("visibility","Visibility","trim");
$this->form_validation->set_rules("price","Price","trim");
$this->form_validation->set_rules("category","Category","trim");
// $this->form_validation->set_rules("color","Color","trim");
// $this->form_validation->set_rules("size","Size","trim");
// $this->form_validation->set_rules("sizechart","Size Chart","trim");
$this->form_validation->set_rules("status","Status","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="createproduct";
    $data['relatedproduct']=$this->product_model->getproductdropdown();
		$data['category']=$this->category_model->getcategorydropdown();
		$data['subcategory']=$this->subcategory_model->getsubcategorydropdown();
		$data['visibility']=$this->product_model->getvisibility();

        // $data['type']=$this->type_model->gettypedropdown();
        // $data['size']=$this->size_model->getsizedropdown();
        // $data['color']=$this->color_model->getcolordropdown();
        // $data['sizechart']=$this->sizechart_model->getsizechartdropdown();
  $data['status']=$this->user_model->getstatusdropdown();
$data["title"]="Create product";
$this->load->view("template",$data);
}
else
{
$subcategory=$this->input->get_post("subcategory");
$quantity=$this->input->get_post("quantity");
$weight=$this->input->get_post("weight");
$name=$this->input->get_post("name");
$type=$this->input->get_post("type");
$about=$this->input->get_post("about");
$nutritionalvalue=$this->input->get_post("nutritionalvalue");
$visibility=$this->input->get_post("visibility");
$price=$this->input->get_post("price");
$relatedproduct=$this->input->get_post("relatedproduct");
$category=$this->input->get_post("category");
// $color=$this->input->get_post("color");
// $size=$this->input->get_post("size");
// $sizechart=$this->input->get_post("sizechart");
$status=$this->input->get_post("status");
$baseproduct=$this->input->get_post("baseproduct");
    $sku=$this->input->get_post("sku");
    $discountprice=$this->input->get_post("discountprice");
     $config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png';
			$this->load->library('upload', $config);
			$filename="image1";
			$image1="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image1=$uploaddata['file_name'];
			}
			$filename="image2";
			$image2="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image2=$uploaddata['file_name'];
			}
    $filename="image3";
			$image3="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image3=$uploaddata['file_name'];
			}
    $filename="image4";
			$image4="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image4=$uploaddata['file_name'];
			}
    $filename="image5";
			$image5="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image5=$uploaddata['file_name'];
			}

if($this->product_model->create($subcategory,$quantity,$weight,$name,$type,$about,$nutritionalvalue,$visibility,$price,$relatedproduct,$category,$color,$size,$sizechart,$status,$sku,$image1,$image2,$image3,$image4,$image5,$baseproduct,$discountprice)==0)
$data["alerterror"]="New product could not be created.";
else
$data["alertsuccess"]="product created Successfully.";
$data["redirect"]="site/viewproduct";
$this->load->view("redirect",$data);
}
}
public function editproduct()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="editproduct";
$data["page2"]="block/productblock";
$data["before1"]=$this->input->get('id');
$data["before2"]=$this->input->get('id');
$productid=$this->input->get('id');
$data['relatedproduct']=$this->product_model->getproductdropdown();
$data['selectedrelatedproduct']=$this->product_model->getrelatedproductcount($productid);
$data['category']=$this->category_model->getcategorydropdown();
$data['subcategory']=$this->subcategory_model->getsubcategorydropdown();
$data['visibility']=$this->product_model->getvisibility();
$data['type']=$this->type_model->gettypedropdown();
$data['size']=$this->size_model->getsizedropdown();
$data['color']=$this->color_model->getcolordropdown();
$data['sizechart']=$this->sizechart_model->getsizechartdropdown();
$data['status']=$this->user_model->getstatusdropdown();
$data["title"]="Edit product";
$data["before"]=$this->product_model->beforeedit($this->input->get("id"));
$this->load->view("templatewith2",$data);
}
public function editproductsubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("id","ID","trim");
$this->form_validation->set_rules("subcategory","Subcategory","trim");
$this->form_validation->set_rules("quantity","Quantity","trim");
$this->form_validation->set_rules("name","Name","trim");
// $this->form_validation->set_rules("type","Type","trim");
// $this->form_validation->set_rules("description","Description","trim");
$this->form_validation->set_rules("visibility","Visibility","trim");
$this->form_validation->set_rules("price","Price","trim");
$this->form_validation->set_rules("category","Category","trim");
// $this->form_validation->set_rules("color","Color","trim");
// $this->form_validation->set_rules("size","Size","trim");
// $this->form_validation->set_rules("sizechart","Size Chart","trim");
$this->form_validation->set_rules("status","Status","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="editproduct";
    $data['type']=$this->type_model->gettypedropdown();
    $data['relatedproduct']=$this->product_model->getproductdropdown();
		$data['category']=$this->category_model->getcategorydropdown();
		$data['subcategory']=$this->subcategory_model->getsubcategorydropdown();
		$data['visibility']=$this->product_model->getvisibility();
        // $data['size']=$this->size_model->getsizedropdown();
        // $data['color']=$this->color_model->getcolordropdown();
        // $data['sizechart']=$this->sizechart_model->getsizechartdropdown();
  $data['status']=$this->user_model->getstatusdropdown();
$data["title"]="Edit product";
$data["before"]=$this->product_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$subcategory=$this->input->get_post("subcategory");
$quantity=$this->input->get_post("quantity");
$weigth=$this->input->get_post("weight");
$name=$this->input->get_post("name");
$type=$this->input->get_post("type");
$about=$this->input->get_post("about");
$nutritionalvalue=$this->input->get_post("nutritionalvalue");
$visibility=$this->input->get_post("visibility");
$price=$this->input->get_post("price");
$relatedproduct=$this->input->get_post("relatedproduct");
$category=$this->input->get_post("category");
// $color=$this->input->get_post("color");
// $size=$this->input->get_post("size");
// $sizechart=$this->input->get_post("sizechart");
$status=$this->input->get_post("status");
$sku=$this->input->get_post("sku");
$baseproduct=$this->input->get_post("baseproduct");
$discountprice=$this->input->get_post("discountprice");
     $config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png';
			$this->load->library('upload', $config);
			$filename="image1";
			$image1="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image1=$uploaddata['file_name'];
			}
     if($image1=="")
            {
            $image1=$this->product_model->getimage1byid($id);
               // print_r($image);
                $image1=$image1->image1;
            }
			$filename="image2";
			$image2="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image2=$uploaddata['file_name'];
			}
    if($image2=="")
            {
            $image2=$this->product_model->getimage2byid($id);
               // print_r($image);
                $image2=$image2->image2;
            }
    $filename="image3";
			$image3="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image3=$uploaddata['file_name'];
			}
     if($image3=="")
            {
            $image3=$this->product_model->getimage3byid($id);
               // print_r($image);
                $image3=$image3->image3;
            }
    $filename="image4";
			$image4="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image4=$uploaddata['file_name'];
			}
    if($image4=="")
            {
            $image4=$this->product_model->getimage4byid($id);
               // print_r($image);
                $image4=$image4->image4;
            }
    $filename="image5";
			$image5="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image5=$uploaddata['file_name'];
			}
     if($image5=="")
            {
            $image5=$this->product_model->getimage5byid($id);
               // print_r($image);
                $image5=$image5->image5;
            }
if($this->product_model->edit($id,$subcategory,$quantity,$weigth,$name,$type,$about,$nutritionalvalue,$visibility,$price,$relatedproduct,$category,$color,$size,$sizechart,$status,$sku,$image1,$image2,$image3,$image4,$image5,$baseproduct,$discountprice)==0)
$data["alerterror"]="New product could not be Updated.";
else
$data["alertsuccess"]="product Updated Successfully.";
$data["redirect"]="site/viewproduct";
$this->load->view("redirect",$data);
}
}
public function deleteproduct()
{
$access=array("1");
$this->checkaccess($access);
$this->product_model->delete($this->input->get("id"));
$data["redirect"]="site/viewproduct";
$this->load->view("redirect",$data);
}
public function viewproductimage()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewproductimage";
$data["page2"]="block/productblock";
$data["before1"]=$this->input->get('id');
$data["before2"]=$this->input->get('id');
$data["base_url"]=site_url("site/viewproductimagejson?id=").$this->input->get('id');
$data["title"]="View productimage";
$this->load->view("templatewith2",$data);
}
function viewproductimagejson()
{
$id=$this->input->get('id');
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`relatedproduct`.`id`";
$elements[0]->sort="1";
$elements[0]->header="ID";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`fynx_product`.`name`";
$elements[1]->sort="1";
$elements[1]->header="Related Product";
$elements[1]->alias="relatedproduct";
// $elements[2]=new stdClass();
// $elements[2]->field="`fynx_designs`.`image`";
// $elements[2]->sort="1";
// $elements[2]->header="Design";
// $elements[2]->alias="image";

$elements[3]=new stdClass();
$elements[3]->field="`relatedproduct`.`product`";
$elements[3]->sort="1";
$elements[3]->header="productid";
$elements[3]->alias="productid";
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

public function createproductimage()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="createproductimage";
$data["page2"]="block/productblock";
$data["before1"]=$this->input->get("id");
$data['design']=$this->designs_model->getdesignsdropdown();
$data["before2"]=$this->input->get("id");
$data[ 'status' ] =$this->user_model->getstatusdropdown();
$data['relatedproduct']=$this->product_model->getproductdropdown();
$data['product']=$this->product_model->getproductdropdown();
$data["title"]="Create productimage";
$this->load->view("templatewith2",$data);
}
public function createproductimagesubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("product","Product","trim");
$this->form_validation->set_rules("order","Order","trim");
$this->form_validation->set_rules("image","Image","trim");
$this->form_validation->set_rules("status","Status","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="createproductimage";
$data['design']=$this->designs_model->getdesignsdropdown();
$data['status'] =$this->user_model->getstatusdropdown();
$data['relatedproduct']=$this->product_model->getproductdropdown();
$data['product']=$this->product_model->getproductdropdown();
$data["title"]="Create productimage";
$this->load->view("template",$data);
}
else
{
$relatedproduct=$this->input->get_post("relatedproduct");
    $product=$this->input->get_post("product");
$design=$this->input->get_post("design");

if($this->productimage_model->create($relatedproduct,$design,$product)==0)
$data["alerterror"]="New productimage could not be created.";
else
$data["alertsuccess"]="productimage created Successfully.";
$data["redirect"]="site/viewproductimage?id=".$product;
$this->load->view("redirect2",$data);
}
}
public function editproductimage()
{
$access=array("1");
$this->checkaccess($access);
$data['relatedproduct']=$this->product_model->getproductdropdown();
$data['product']=$this->product_model->getproductdropdown();
$data["page"]="editproductimage";
$data["page2"]="block/productblock";
$data["before1"]=$this->input->get("id");
$data["before2"]=$this->input->get("id");
$data['design']=$this->designs_model->getdesignsdropdown();
$data["title"]="Edit productimage";
$data["before"]=$this->productimage_model->beforeedit($this->input->get("id"));
$this->load->view("templatewith2",$data);
}
public function editproductimagesubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("id","ID","trim");
$this->form_validation->set_rules("product","Product","trim");
$this->form_validation->set_rules("order","Order","trim");
$this->form_validation->set_rules("image","Image","trim");
$this->form_validation->set_rules("status","Status","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="editproductimage";
$data['status' ] =$this->user_model->getstatusdropdown();
$data['product']=$this->product_model->getproductdropdown();
    $data['design']=$this->designs_model->getdesignsdropdown();
$data['relatedproduct']=$this->product_model->getproductdropdown();
$data["title"]="Edit productimage";
$data["before"]=$this->productimage_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$relatedproduct=$this->input->get_post("relatedproduct");
$product=$this->input->get_post("product");
$design=$this->input->get_post("design");

if($this->productimage_model->edit($id,$relatedproduct,$design,$product)==0)
$data["alerterror"]="New productimage could not be Updated.";
else
$data["alertsuccess"]="productimage Updated Successfully.";
$data["redirect"]="site/viewproductimage?id=".$product;
$this->load->view("redirect2",$data);
}
}
public function deleteproductimage()
{
$access=array("1");
$this->checkaccess($access);
$this->productimage_model->delete($this->input->get("id"));
$data["redirect"]="site/viewproductimage?id=".$this->input->get("productid");
$this->load->view("redirect2",$data);
}
public function viewdesigner()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewdesigner";
$data["base_url"]=site_url("site/viewdesignerjson");
$data["title"]="View designer";
$this->load->view("template",$data);
}
function viewdesignerjson()
{
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`fynx_designer`.`id`";
$elements[0]->sort="1";
$elements[0]->header="ID";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`fynx_designer`.`email`";
$elements[1]->sort="1";
$elements[1]->header="Email Id";
$elements[1]->alias="email";
$elements[2]=new stdClass();
$elements[2]->field="`fynx_designer`.`noofdesigns`";
$elements[2]->sort="1";
$elements[2]->header="No of Designs";
$elements[2]->alias="noofdesigns";
$elements[3]=new stdClass();
$elements[3]->field="`fynx_designer`.`designerid`";
$elements[3]->sort="1";
$elements[3]->header="Designer Id";
$elements[3]->alias="designerid";
$elements[4]=new stdClass();
$elements[4]->field="`fynx_designer`.`name`";
$elements[4]->sort="1";
$elements[4]->header="Name";
$elements[4]->alias="name";
$elements[5]=new stdClass();
$elements[5]->field="`fynx_designer`.`contact`";
$elements[5]->sort="1";
$elements[5]->header="Contact";
$elements[5]->alias="contact";
$elements[6]=new stdClass();
$elements[6]->field="`fynx_designer`.`commission`";
$elements[6]->sort="1";
$elements[6]->header="Commission in %";
$elements[6]->alias="commission";
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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `fynx_designer`");
$this->load->view("json",$data);
}

public function createdesigner()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="createdesigner";
$data["title"]="Create designer";
$this->load->view("template",$data);
}
public function createdesignersubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("email","Email Id","trim");
$this->form_validation->set_rules("noofdesigns","No of Designs","trim");
$this->form_validation->set_rules("designerid","Designer Id","trim");
$this->form_validation->set_rules("name","Name","trim");
$this->form_validation->set_rules("contact","Contact","trim");
$this->form_validation->set_rules("commission","Commission in %","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="createdesigner";
$data["title"]="Create designer";
$this->load->view("template",$data);
}
else
{
$email=$this->input->get_post("email");
$noofdesigns=$this->input->get_post("noofdesigns");
$designerid=$this->input->get_post("designerid");
$name=$this->input->get_post("name");
$contact=$this->input->get_post("contact");
$commission=$this->input->get_post("commission");
if($this->designer_model->create($email,$noofdesigns,$designerid,$name,$contact,$commission)==0)
$data["alerterror"]="New designer could not be created.";
else
$data["alertsuccess"]="designer created Successfully.";
$data["redirect"]="site/viewdesigner";
$this->load->view("redirect",$data);
}
}
public function editdesigner()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="editdesigner";
$data["page2"]="block/designblock";
$data["before1"]=$this->input->get("id");
$data["before2"]=$this->input->get("id");
$data["title"]="Edit designer";
$data["before"]=$this->designer_model->beforeedit($this->input->get("id"));
$this->load->view("templatewith2",$data);
}
public function editdesignersubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("id","ID","trim");
$this->form_validation->set_rules("email","Email Id","trim");
$this->form_validation->set_rules("noofdesigns","No of Designs","trim");
$this->form_validation->set_rules("designerid","Designer Id","trim");
$this->form_validation->set_rules("name","Name","trim");
$this->form_validation->set_rules("contact","Contact","trim");
$this->form_validation->set_rules("commission","Commission in %","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="editdesigner";
$data["title"]="Edit designer";
$data["before"]=$this->designer_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$email=$this->input->get_post("email");
$noofdesigns=$this->input->get_post("noofdesigns");
$designerid=$this->input->get_post("designerid");
$name=$this->input->get_post("name");
$contact=$this->input->get_post("contact");
$commission=$this->input->get_post("commission");
if($this->designer_model->edit($id,$email,$noofdesigns,$designerid,$name,$contact,$commission)==0)
$data["alerterror"]="New designer could not be Updated.";
else
$data["alertsuccess"]="designer Updated Successfully.";
$data["redirect"]="site/viewdesigner";
$this->load->view("redirect",$data);
}
}
public function deletedesigner()
{
$access=array("1");
$this->checkaccess($access);
$this->designer_model->delete($this->input->get("id"));
$data["redirect"]="site/viewdesigner";
$this->load->view("redirect",$data);
}
public function viewdesigns()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewdesigns";
$data["page2"]="block/designblock";
$data["before1"]=$this->input->get("id");
$data["before2"]=$this->input->get("id");
$data["base_url"]=site_url("site/viewdesignsjson?id=").$this->input->get("id");
$data["title"]="View designs";
$this->load->view("templatewith2",$data);
}
function viewdesignsjson()
{
$id=$this->input->get("id");
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`fynx_designs`.`id`";
$elements[0]->sort="1";
$elements[0]->header="ID";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`fynx_designs`.`designer`";
$elements[1]->sort="1";
$elements[1]->header="Designer";
$elements[1]->alias="designer";
$elements[2]=new stdClass();
$elements[2]->field="`fynx_designs`.`image`";
$elements[2]->sort="1";
$elements[2]->header="Image";
$elements[2]->alias="image";
$elements[3]=new stdClass();
$elements[3]->field="`fynx_designs`.`name`";
$elements[3]->sort="1";
$elements[3]->header="Name";
$elements[3]->alias="name";
$elements[4]=new stdClass();
$elements[4]->field="`fynx_designs`.`timestamp`";
$elements[4]->sort="1";
$elements[4]->header="Timestamp";
$elements[4]->alias="timestamp";
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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `fynx_designs`","WHERE `fynx_designs`.`designer`='$id'");
$this->load->view("json",$data);
}

public function createdesigns()
{
$access=array("1");
$this->checkaccess($access);
       $data['status']=$this->user_model->getstatusdropdown();
$data["page"]="createdesigns";
$data["page2"]="block/designblock";
$data["before1"]=$this->input->get("id");
$data["before2"]=$this->input->get("id");
    $data[ 'status' ] =$this->designs_model->getstatusdropdown();
$data[ 'designer' ] =$this->designer_model->getdesignerdropdown();
$data["title"]="Create designs";
$this->load->view("templatewith2",$data);
}
public function createdesignssubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("designer","Designer","trim");
$this->form_validation->set_rules("image","Image","trim");
$this->form_validation->set_rules("status","Status","trim");
$this->form_validation->set_rules("timestamp","Timestamp","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
    $data[ 'status' ] =$this->designs_model->getstatusdropdown();
$data["page"]="createdesigns";
       $data['status']=$this->user_model->getstatusdropdown();
$data[ 'designer' ] =$this->designer_model->getdesignerdropdown();
$data["title"]="Create designs";
$this->load->view("template",$data);
}
else
{
$designer=$this->input->get_post("designer");
$name=$this->input->get_post("name");
$status=$this->input->get_post("status");
$name=$this->input->get_post("name");
$timestamp=$this->input->get_post("timestamp");
  $config['upload_path'] = './uploads/';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $this->load->library('upload', $config);
            $filename = 'image';
            $image = '';
            if ($this->upload->do_upload($filename)) {
                $uploaddata = $this->upload->data();
                $image = $uploaddata['file_name'];
                $config_r['source_image'] = './uploads/'.$uploaddata['file_name'];
                $config_r['maintain_ratio'] = true;
                $config_t['create_thumb'] = false; ///add this
                $config_r['width'] = 800;
                $config_r['height'] = 800;
                $config_r['quality'] = 100;

                // end of configs

                $this->load->library('image_lib', $config_r);
                $this->image_lib->initialize($config_r);
                if (!$this->image_lib->resize()) {
                    $data['alerterror'] = 'Failed.'.$this->image_lib->display_errors();

                    // return false;
                } else {

                    // print_r($this->image_lib->dest_image);
                    // dest_image

                    $image = $this->image_lib->dest_image;

                    // return false;
                }
            }
if($this->designs_model->create($designer,$image,$status,$timestamp,$name)==0)
$data["alerterror"]="New designs could not be created.";
else
$data["alertsuccess"]="designs created Successfully.";
$data["redirect"]="site/viewdesigns?id=".$designer;
$this->load->view("redirect2",$data);
}
}
public function editdesigns()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="editdesigns";
$data["page2"]="block/designblock";
$data["before1"]=$this->input->get("id");
    $data[ 'status' ] =$this->designs_model->getstatusdropdown();
$data["before2"]=$this->input->get("id");
$data[ 'designer' ] =$this->designer_model->getdesignerdropdown();
$data["title"]="Edit designs";
$data["before"]=$this->designs_model->beforeedit($this->input->get("id"));
$this->load->view("templatewith2",$data);
}
public function editdesignssubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("id","ID","trim");
$this->form_validation->set_rules("designer","Designer","trim");
$this->form_validation->set_rules("image","Image","trim");
$this->form_validation->set_rules("status","Status","trim");
$this->form_validation->set_rules("timestamp","Timestamp","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
    $data[ 'status' ] =$this->designs_model->getstatusdropdown();
$data["page"]="editdesigns";
$data[ 'designer' ] =$this->designer_model->getdesignerdropdown();
$data["title"]="Edit designs";
$data["before"]=$this->designs_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$designer=$this->input->get_post("designer");
$image=$this->input->get_post("image");
$status=$this->input->get_post("status");
$name=$this->input->get_post("name");
$timestamp=$this->input->get_post("timestamp");
     $config['upload_path'] = './uploads/';
						$config['allowed_types'] = 'gif|jpg|png|jpeg';
						$this->load->library('upload', $config);
						$filename="image";
						$image="";
						if (  $this->upload->do_upload($filename))
						{
							$uploaddata = $this->upload->data();
							$image=$uploaddata['file_name'];
						}

						if($image=="")
						{
						$image=$this->designs_model->getimagebyid($id);
						   // print_r($image);
							$image=$image->image;
						}
if($this->designs_model->edit($id,$designer,$image,$status,$timestamp,$name)==0)
$data["alerterror"]="New designs could not be Updated.";
else
$data["alertsuccess"]="designs Updated Successfully.";
$data["redirect"]="site/viewdesigns?id=".$designer;
$this->load->view("redirect2",$data);
}
}
public function deletedesigns()
{
$access=array("1");
$this->checkaccess($access);
$this->designs_model->delete($this->input->get("id"));
$designer=$this->input->get("designer");
$data["redirect"]="site/viewdesigns?id=".$designer;
$this->load->view("redirect2",$data);
}
public function viewhomeslide()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewhomeslide";
$data["base_url"]=site_url("site/viewhomeslidejson");
$data["title"]="View homeslide";
$this->load->view("template",$data);
}
function viewhomeslidejson()
{
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`fynx_homeslide`.`id`";
$elements[0]->sort="1";
$elements[0]->header="ID";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`fynx_homeslide`.`name`";
$elements[1]->sort="1";
$elements[1]->header="Name";
$elements[1]->alias="name";
$elements[2]=new stdClass();
$elements[2]->field="`fynx_homeslide`.`link`";
$elements[2]->sort="1";
$elements[2]->header="Link";
$elements[2]->alias="link";
$elements[3]=new stdClass();
$elements[3]->field="`fynx_homeslide`.`sorder`";
$elements[3]->sort="1";
$elements[3]->header="Order";
$elements[3]->alias="sorder";
$elements[4]=new stdClass();
$elements[4]->field="`fynx_homeslide`.`status`";
$elements[4]->sort="1";
$elements[4]->header="Status";
$elements[4]->alias="status";
$elements[5]=new stdClass();
$elements[5]->field="`fynx_homeslide`.`image`";
$elements[5]->sort="1";
$elements[5]->header="Image";
$elements[5]->alias="image";
$elements[6]=new stdClass();
$elements[6]->field="`fynx_homeslide`.`template`";
$elements[6]->sort="1";
$elements[6]->header="Template";
$elements[6]->alias="template";
$elements[7]=new stdClass();
$elements[7]->field="`fynx_homeslide`.`class`";
$elements[7]->sort="1";
$elements[7]->header="Class";
$elements[7]->alias="class";
$elements[8]=new stdClass();
$elements[8]->field="`fynx_homeslide`.`text`";
$elements[8]->sort="1";
$elements[8]->header="Text";
$elements[8]->alias="text";
$elements[9]=new stdClass();
$elements[9]->field="`fynx_homeslide`.`centeralign`";
$elements[9]->sort="1";
$elements[9]->header="Center Align";
$elements[9]->alias="centeralign";
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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `fynx_homeslide`");
$this->load->view("json",$data);
}

public function createhomeslide()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="createhomeslide";
$data['status']=$this->user_model->getstatusdropdown();
$data["title"]="Create homeslide";
$this->load->view("template",$data);
}
public function createhomeslidesubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("name","Name","trim");
$this->form_validation->set_rules("link","Link","trim");
$data['status']=$this->user_model->getstatusdropdown();
$this->form_validation->set_rules("target","Target","trim");
$this->form_validation->set_rules("status","Status","trim");
$this->form_validation->set_rules("image","Image","trim");
$this->form_validation->set_rules("template","Template","trim");
$this->form_validation->set_rules("class","Class","trim");
$this->form_validation->set_rules("text","Text","trim");
$this->form_validation->set_rules("centeralign","Center Align","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="createhomeslide";
$data['status']=$this->user_model->getstatusdropdown();
$data["title"]="Create homeslide";
$this->load->view("template",$data);
}
else
{
$name=$this->input->get_post("name");
$description=$this->input->get_post("description");
$link=$this->input->get_post("link");
$sorder=$this->input->get_post("sorder");
$target=$this->input->get_post("target");
$status=$this->input->get_post("status");
$image=$this->input->get_post("image");
$template=$this->input->get_post("template");
$class=$this->input->get_post("class");
$text=$this->input->get_post("text");
$centeralign=$this->input->get_post("centeralign");
$image=$this->user_model->uploadImage();

$config['upload_path'] = './uploads/';
$config['allowed_types'] = 'gif|jpg|png|jpeg';
$this->load->library('upload', $config);
$filename="image";
$image="";
if (  $this->upload->do_upload($filename))
{
$uploaddata = $this->upload->data();
$image=$uploaddata['file_name'];

		$config_r['source_image']   = './uploads/' . $uploaddata['file_name'];
		$config_r['maintain_ratio'] = TRUE;
		$config_t['create_thumb'] = FALSE;///add this
		$config_r['width']   = 800;
		$config_r['height'] = 800;
		$config_r['quality']    = 100;
		//end of configs

		$this->load->library('image_lib', $config_r);
		$this->image_lib->initialize($config_r);
		if(!$this->image_lib->resize())
		{
				echo "Failed." . $this->image_lib->display_errors();
				//return false;
		}
		else
		{
				//print_r($this->image_lib->dest_image);
				//dest_image
				$image=$this->image_lib->dest_image;
				//return false;
		}

}

if($this->homeslide_model->create($name,$description,$link,$sorder,$target,$status,$image,$template,$class,$text,$centeralign)==0)
$data["alerterror"]="New homeslide could not be created.";
else
$data["alertsuccess"]="homeslide created Successfully.";
$data["redirect"]="site/viewhomeslide";
$this->load->view("redirect",$data);
}
}
public function edithomeslide()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="edithomeslide";
$data['status']=$this->user_model->getstatusdropdown();
$data["title"]="Edit homeslide";
$data["before"]=$this->homeslide_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
public function edithomeslidesubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("id","ID","trim");
$this->form_validation->set_rules("name","Name","trim");
$this->form_validation->set_rules("link","Link","trim");
$this->form_validation->set_rules("target","Target","trim");
$this->form_validation->set_rules("status","Status","trim");
$this->form_validation->set_rules("image","Image","trim");
$this->form_validation->set_rules("template","Template","trim");
$this->form_validation->set_rules("class","Class","trim");
$this->form_validation->set_rules("text","Text","trim");
$this->form_validation->set_rules("centeralign","Center Align","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="edithomeslide";
$data['status']=$this->user_model->getstatusdropdown();
$data["title"]="Edit homeslide";
$data["before"]=$this->homeslide_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$name=$this->input->get_post("name");
$description=$this->input->get_post("description");
$link=$this->input->get_post("link");
$sorder=$this->input->get_post("sorder");
$target=$this->input->get_post("target");
$status=$this->input->get_post("status");
$image=$this->input->get_post("image");
$template=$this->input->get_post("template");
$class=$this->input->get_post("class");
$text=$this->input->get_post("text");
$centeralign=$this->input->get_post("centeralign");
    $image=$this->user_model->uploadImage();
// $config['upload_path'] = './uploads/';
//						$config['allowed_types'] = 'gif|jpg|png|jpeg';
//						$this->load->library('upload', $config);
//						$filename="image";
//						$image="";
//						if (  $this->upload->do_upload($filename))
//						{
//							$uploaddata = $this->upload->data();
//							$image=$uploaddata['file_name'];
//						}
//
//						if($image=="")
//						{
//						$image=$this->homeslide_model->getimagebyid($id);
//						   // print_r($image);
//							$image=$image->image;
//						}
if($this->homeslide_model->edit($id,$name,$description,$link,$sorder,$target,$status,$image,$template,$class,$text,$centeralign)==0)
$data["alerterror"]="New homeslide could not be Updated.";
else
$data["alertsuccess"]="homeslide Updated Successfully.";
$data["redirect"]="site/viewhomeslide";
$this->load->view("redirect",$data);
}
}
public function deletehomeslide()
{
$access=array("1");
$this->checkaccess($access);
$this->homeslide_model->delete($this->input->get("id"));
$data["redirect"]="site/viewhomeslide";
$this->load->view("redirect",$data);
}
public function viewtype()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewtype";
$data["base_url"]=site_url("site/viewtypejson");
$data["title"]="View type";
$this->load->view("template",$data);
}
function viewtypejson()
{
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`fynx_type`.`id`";
$elements[0]->sort="1";
$elements[0]->header="ID";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`fynx_type`.`name`";
$elements[1]->sort="1";
$elements[1]->header="Name";
$elements[1]->alias="name";
$elements[2]=new stdClass();
$elements[2]->field="`fynx_type`.`status`";
$elements[2]->sort="1";
$elements[2]->header="Status";
$elements[2]->alias="status";
$elements[3]=new stdClass();
$elements[3]->field="`fynx_type`.`timestamp`";
$elements[3]->sort="1";
$elements[3]->header="Timestamp";
$elements[3]->alias="timestamp";
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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `fynx_type`");
$this->load->view("json",$data);
}

public function createtype()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="createtype";
    $data['subcategory']=$this->subcategory_model->getsubcategorydropdown();
   $data['status']=$this->user_model->getstatusdropdown();
$data["title"]="Create type";
$this->load->view("template",$data);
}
public function createtypesubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("name","Name","trim");
$this->form_validation->set_rules("status","Status","trim");
$this->form_validation->set_rules("timestamp","Timestamp","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="createtype";
    $data['subcategory']=$this->subcategory_model->getsubcategorydropdown();
   $data['status']=$this->user_model->getstatusdropdown();
$data["title"]="Create type";
$this->load->view("template",$data);
}
else
{
$name=$this->input->get_post("name");
$status=$this->input->get_post("status");
$timestamp=$this->input->get_post("timestamp");
$subcategory=$this->input->get_post("subcategory");
if($this->type_model->create($name,$status,$timestamp,$subcategory)==0)
$data["alerterror"]="New type could not be created.";
else
$data["alertsuccess"]="type created Successfully.";
$data["redirect"]="site/viewtype";
$this->load->view("redirect",$data);
}
}
public function edittype()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="edittype";
   $data['status']=$this->user_model->getstatusdropdown();
$data['subcategory']=$this->subcategory_model->getsubcategorydropdown();
$data["title"]="Edit type";
$data["before"]=$this->type_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
public function edittypesubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("id","ID","trim");
$this->form_validation->set_rules("name","Name","trim");
$this->form_validation->set_rules("status","Status","trim");
$this->form_validation->set_rules("timestamp","Timestamp","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="edittype";
   $data['status']=$this->user_model->getstatusdropdown();
$data['subcategory']=$this->subcategory_model->getsubcategorydropdown();
$data["title"]="Edit type";
$data["before"]=$this->type_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$name=$this->input->get_post("name");
$status=$this->input->get_post("status");
$timestamp=$this->input->get_post("timestamp");
    $subcategory=$this->input->get_post("subcategory");
if($this->type_model->edit($id,$name,$status,$timestamp,$subcategory)==0)
$data["alerterror"]="New type could not be Updated.";
else
$data["alertsuccess"]="type Updated Successfully.";
$data["redirect"]="site/viewtype";
$this->load->view("redirect",$data);
}
}
public function deletetype()
{
$access=array("1");
$this->checkaccess($access);
$this->type_model->delete($this->input->get("id"));
$data["redirect"]="site/viewtype";
$this->load->view("redirect",$data);
}
public function viewcategory()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewcategory";
$data["base_url"]=site_url("site/viewcategoryjson");
$data["title"]="View category";
$this->load->view("template",$data);
}
function viewcategoryjson()
{
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`fynx_category`.`id`";
$elements[0]->sort="1";
$elements[0]->header="ID";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`fynx_category`.`order`";
$elements[1]->sort="1";
$elements[1]->header="Order";
$elements[1]->alias="order";
$elements[2]=new stdClass();
$elements[2]->field="`fynx_category`.`name`";
$elements[2]->sort="1";
$elements[2]->header="Name";
$elements[2]->alias="name";
$elements[3]=new stdClass();
$elements[3]->field="`fynx_category`.`parent`";
$elements[3]->sort="1";
$elements[3]->header="Parent";
$elements[3]->alias="parent";
$elements[4]=new stdClass();
$elements[4]->field="`fynx_category`.`status`";
$elements[4]->sort="1";
$elements[4]->header="Status";
$elements[4]->alias="status";
$elements[5]=new stdClass();
$elements[5]->field="`fynx_category`.`image1`";
$elements[5]->sort="1";
$elements[5]->header="Image1";
$elements[5]->alias="image1";
$elements[6]=new stdClass();
$elements[6]->field="`fynx_category`.`image2`";
$elements[6]->sort="1";
$elements[6]->header="Image2";
$elements[6]->alias="image2";
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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `fynx_category`");
$this->load->view("json",$data);
}

public function createcategory()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="createcategory";
   $data['status']=$this->user_model->getstatusdropdown();
$data["title"]="Create category";
$this->load->view("template",$data);
}
public function createcategorysubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("order","Order","trim");
$this->form_validation->set_rules("name","Name","trim");
$this->form_validation->set_rules("description","description","trim");
$this->form_validation->set_rules("parent","Parent","trim");
$this->form_validation->set_rules("status","Status","trim");
$this->form_validation->set_rules("image1","Image1","trim");
$this->form_validation->set_rules("image2","Image2","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="createcategory";
   $data['status']=$this->user_model->getstatusdropdown();
$data["title"]="Create category";
$this->load->view("template",$data);
}
else
{
$order=$this->input->get_post("order");
$name=$this->input->get_post("name");
$parent=$this->input->get_post("parent");
$status=$this->input->get_post("status");
$description=$this->input->get_post("description");
//$image1=$this->input->get_post("image1");
//$image2=$this->input->get_post("image2");
    $config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png';
			$this->load->library('upload', $config);
			$filename="image1";
			$image1="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image1=$uploaddata['file_name'];
			}
			$filename="image2";
			$image2="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image2=$uploaddata['file_name'];
			}
if($this->category_model->create($order,$name,$description,$parent,$status,$image1,$image2)==0)
$data["alerterror"]="New category could not be created.";
else
$data["alertsuccess"]="category created Successfully.";
$data["redirect"]="site/viewcategory";
$this->load->view("redirect",$data);
}
}
public function editcategory()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="editcategory";
$data["title"]="Edit category";
   $data['status']=$this->user_model->getstatusdropdown();
$data["before"]=$this->category_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
public function editcategorysubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("id","ID","trim");
$this->form_validation->set_rules("order","Order","trim");
$this->form_validation->set_rules("name","Name","trim");
$this->form_validation->set_rules("parent","Parent","trim");
$this->form_validation->set_rules("status","Status","trim");
$this->form_validation->set_rules("image1","Image1","trim");
$this->form_validation->set_rules("image2","Image2","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="editcategory";
   $data['status']=$this->user_model->getstatusdropdown();
$data["title"]="Edit category";
$data["before"]=$this->category_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$order=$this->input->get_post("order");
$name=$this->input->get_post("name");
$parent=$this->input->get_post("parent");
$status=$this->input->get_post("status");
$description=$this->input->get_post("description");

// $image1=$this->input->get_post("image1");
// $image2=$this->input->get_post("image2");
$config['upload_path'] = './uploads/';
 $config['allowed_types'] = 'gif|jpg|png';
 $this->load->library('upload', $config);
 $filename="image1";
 $image1="";
 if (  $this->upload->do_upload($filename))
 {
	 $uploaddata = $this->upload->data();
	 $image1=$uploaddata['file_name'];
 }
if($image1=="")
			 {
			 $image1=$this->product_model->getimage1byid($id);
					// print_r($image);
					 $image1=$image1->image1;
			 }
 $filename="image2";
 $image2="";
 if (  $this->upload->do_upload($filename))
 {
	 $uploaddata = $this->upload->data();
	 $image2=$uploaddata['file_name'];
 }
if($image2=="")
			 {
			 $image2=$this->product_model->getimage2byid($id);
					// print_r($image);
					 $image2=$image2->image2;
			 }

if($this->category_model->edit($id,$order,$name,$description,$parent,$status,$image1,$image2)==0)
$data["alerterror"]="New category could not be Updated.";
else
$data["alertsuccess"]="category Updated Successfully.";
$data["redirect"]="site/viewcategory";
$this->load->view("redirect",$data);
}
}
public function deletecategory()
{
$access=array("1");
$this->checkaccess($access);
$this->category_model->delete($this->input->get("id"));
$data["redirect"]="site/viewcategory";
$this->load->view("redirect",$data);
}
public function viewcolor()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewcolor";
$data["base_url"]=site_url("site/viewcolorjson");
$data["title"]="View color";
$this->load->view("template",$data);
}
function viewcolorjson()
{
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`fynx_color`.`id`";
$elements[0]->sort="1";
$elements[0]->header="ID";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`fynx_color`.`name`";
$elements[1]->sort="1";
$elements[1]->header="Name";
$elements[1]->alias="name";
$elements[2]=new stdClass();
$elements[2]->field="`fynx_color`.`status`";
$elements[2]->sort="1";
$elements[2]->header="Status";
$elements[2]->alias="status";
$elements[3]=new stdClass();
$elements[3]->field="`fynx_color`.`timestamp`";
$elements[3]->sort="1";
$elements[3]->header="Timestamp";
$elements[3]->alias="timestamp";
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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `fynx_color`");
$this->load->view("json",$data);
}

public function createcolor()
{
$access=array("1");
$this->checkaccess($access);
   $data['status']=$this->user_model->getstatusdropdown();
$data["page"]="createcolor";
$data["title"]="Create color";
$this->load->view("template",$data);
}
public function createcolorsubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("name","Name","trim");
$this->form_validation->set_rules("status","Status","trim");
$this->form_validation->set_rules("timestamp","Timestamp","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="createcolor";
   $data['status']=$this->user_model->getstatusdropdown();
$data["title"]="Create color";
$this->load->view("template",$data);
}
else
{
$name=$this->input->get_post("name");
$status=$this->input->get_post("status");
$timestamp=$this->input->get_post("timestamp");
if($this->color_model->create($name,$status,$timestamp)==0)
$data["alerterror"]="New color could not be created.";
else
$data["alertsuccess"]="color created Successfully.";
$data["redirect"]="site/viewcolor";
$this->load->view("redirect",$data);
}
}
public function editcolor()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="editcolor";
   $data['status']=$this->user_model->getstatusdropdown();
$data["title"]="Edit color";
$data["before"]=$this->color_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
public function editcolorsubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("id","ID","trim");
$this->form_validation->set_rules("name","Name","trim");
$this->form_validation->set_rules("status","Status","trim");
$this->form_validation->set_rules("timestamp","Timestamp","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="editcolor";
   $data['status']=$this->user_model->getstatusdropdown();
$data["title"]="Edit color";
$data["before"]=$this->color_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$name=$this->input->get_post("name");
$status=$this->input->get_post("status");
$timestamp=$this->input->get_post("timestamp");
if($this->color_model->edit($id,$name,$status,$timestamp)==0)
$data["alerterror"]="New color could not be Updated.";
else
$data["alertsuccess"]="color Updated Successfully.";
$data["redirect"]="site/viewcolor";
$this->load->view("redirect",$data);
}
}
public function deletecolor()
{
$access=array("1");
$this->checkaccess($access);
$this->color_model->delete($this->input->get("id"));
$data["redirect"]="site/viewcolor";
$this->load->view("redirect",$data);
}
public function viewoffer()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewoffer";
$data["base_url"]=site_url("site/viewofferjson");
$data["title"]="View offer";
$this->load->view("template",$data);
}
function viewofferjson()
{
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`fynx_offer`.`id`";
$elements[0]->sort="1";
$elements[0]->header="ID";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`fynx_offer`.`title`";
$elements[1]->sort="1";
$elements[1]->header="Title";
$elements[1]->alias="title";
$elements[2]=new stdClass();
$elements[2]->field="`fynx_offer`.`description`";
$elements[2]->sort="1";
$elements[2]->header="Description";
$elements[2]->alias="description";
$elements[3]=new stdClass();
$elements[3]->field="`fynx_offer`.`price`";
$elements[3]->sort="1";
$elements[3]->header="Price";
$elements[3]->alias="price";
$elements[4]=new stdClass();
$elements[4]->field="`fynx_offer`.`status`";
$elements[4]->sort="1";
$elements[4]->header="Status";
$elements[4]->alias="status";
$elements[5]=new stdClass();
$elements[5]->field="`fynx_offer`.`image`";
$elements[5]->sort="1";
$elements[5]->header="Image";
$elements[5]->alias="image";
$elements[6]=new stdClass();
$elements[6]->field="`fynx_offer`.`fromdate`";
$elements[6]->sort="1";
$elements[6]->header="From Date";
$elements[6]->alias="fromdate";
$elements[7]=new stdClass();
$elements[7]->field="`fynx_offer`.`todate`";
$elements[7]->sort="1";
$elements[7]->header="To Date";
$elements[7]->alias="todate";
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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `fynx_offer`");
$this->load->view("json",$data);
}

public function createoffer()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="createoffer";
$data["title"]="Create offer";
$this->load->view("template",$data);
}
public function createoffersubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("title","Title","trim");
$this->form_validation->set_rules("description","Description","trim");
$this->form_validation->set_rules("price","Price","trim");
$this->form_validation->set_rules("status","Status","trim");
$this->form_validation->set_rules("image","Image","trim");
$this->form_validation->set_rules("fromdate","From Date","trim");
$this->form_validation->set_rules("todate","To Date","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="createoffer";
$data["title"]="Create offer";
$this->load->view("template",$data);
}
else
{
$title=$this->input->get_post("title");
$description=$this->input->get_post("description");
$price=$this->input->get_post("price");
$status=$this->input->get_post("status");
$image=$this->input->get_post("image");
$fromdate=$this->input->get_post("fromdate");
$todate=$this->input->get_post("todate");
if($this->offer_model->create($title,$description,$price,$status,$image,$fromdate,$todate)==0)
$data["alerterror"]="New offer could not be created.";
else
$data["alertsuccess"]="offer created Successfully.";
$data["redirect"]="site/viewoffer";
$this->load->view("redirect",$data);
}
}
public function editoffer()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="editoffer";
$data["title"]="Edit offer";
$data["before"]=$this->offer_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
public function editoffersubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("id","ID","trim");
$this->form_validation->set_rules("title","Title","trim");
$this->form_validation->set_rules("description","Description","trim");
$this->form_validation->set_rules("price","Price","trim");
$this->form_validation->set_rules("status","Status","trim");
$this->form_validation->set_rules("image","Image","trim");
$this->form_validation->set_rules("fromdate","From Date","trim");
$this->form_validation->set_rules("todate","To Date","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="editoffer";
$data["title"]="Edit offer";
$data["before"]=$this->offer_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$title=$this->input->get_post("title");
$description=$this->input->get_post("description");
$price=$this->input->get_post("price");
$status=$this->input->get_post("status");
$image=$this->input->get_post("image");
$fromdate=$this->input->get_post("fromdate");
$todate=$this->input->get_post("todate");
if($this->offer_model->edit($id,$title,$description,$price,$status,$image,$fromdate,$todate)==0)
$data["alerterror"]="New offer could not be Updated.";
else
$data["alertsuccess"]="offer Updated Successfully.";
$data["redirect"]="site/viewoffer";
$this->load->view("redirect",$data);
}
}
public function deleteoffer()
{
$access=array("1");
$this->checkaccess($access);
$this->offer_model->delete($this->input->get("id"));
$data["redirect"]="site/viewoffer";
$this->load->view("redirect",$data);
}
public function viewofferproduct()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewofferproduct";
$data["base_url"]=site_url("site/viewofferproductjson");
$data["title"]="View offerproduct";
$this->load->view("template",$data);
}
function viewofferproductjson()
{
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`fynx_offerproduct`.`id`";
$elements[0]->sort="1";
$elements[0]->header="ID";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`fynx_offerproduct`.`offer`";
$elements[1]->sort="1";
$elements[1]->header="Offer";
$elements[1]->alias="offer";
$elements[2]=new stdClass();
$elements[2]->field="`fynx_offerproduct`.`product`";
$elements[2]->sort="1";
$elements[2]->header="Product";
$elements[2]->alias="product";
$elements[3]=new stdClass();
$elements[3]->field="`fynx_offerproduct`.`quantity`";
$elements[3]->sort="1";
$elements[3]->header="Quantity";
$elements[3]->alias="quantity";
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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `fynx_offerproduct`");
$this->load->view("json",$data);
}

public function createofferproduct()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="createofferproduct";
$data["title"]="Create offerproduct";
$this->load->view("template",$data);
}
public function createofferproductsubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("offer","Offer","trim");
$this->form_validation->set_rules("product","Product","trim");
$this->form_validation->set_rules("quantity","Quantity","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="createofferproduct";
$data["title"]="Create offerproduct";
$this->load->view("template",$data);
}
else
{
$offer=$this->input->get_post("offer");
$product=$this->input->get_post("product");
$quantity=$this->input->get_post("quantity");
if($this->offerproduct_model->create($offer,$product,$quantity)==0)
$data["alerterror"]="New offerproduct could not be created.";
else
$data["alertsuccess"]="offerproduct created Successfully.";
$data["redirect"]="site/viewofferproduct";
$this->load->view("redirect",$data);
}
}
public function editofferproduct()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="editofferproduct";
$data["title"]="Edit offerproduct";
$data["before"]=$this->offerproduct_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
public function editofferproductsubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("id","ID","trim");
$this->form_validation->set_rules("offer","Offer","trim");
$this->form_validation->set_rules("product","Product","trim");
$this->form_validation->set_rules("quantity","Quantity","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="editofferproduct";
$data["title"]="Edit offerproduct";
$data["before"]=$this->offerproduct_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$offer=$this->input->get_post("offer");
$product=$this->input->get_post("product");
$quantity=$this->input->get_post("quantity");
if($this->offerproduct_model->edit($id,$offer,$product,$quantity)==0)
$data["alerterror"]="New offerproduct could not be Updated.";
else
$data["alertsuccess"]="offerproduct Updated Successfully.";
$data["redirect"]="site/viewofferproduct";
$this->load->view("redirect",$data);
}
}
public function deleteofferproduct()
{
$access=array("1");
$this->checkaccess($access);
$this->offerproduct_model->delete($this->input->get("id"));
$data["redirect"]="site/viewofferproduct";
$this->load->view("redirect",$data);
}
public function viewsubcategory()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewsubcategory";
$data["base_url"]=site_url("site/viewsubcategoryjson");
$data["title"]="View subcategory";
$this->load->view("template",$data);
}
function viewsubcategoryjson()
{
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`fynx_subcategory`.`id`";
$elements[0]->sort="1";
$elements[0]->header="ID";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`fynx_subcategory`.`category`";
$elements[1]->sort="1";
$elements[1]->header="Category";
$elements[1]->alias="category";
$elements[2]=new stdClass();
$elements[2]->field="`fynx_subcategory`.`name`";
$elements[2]->sort="1";
$elements[2]->header="Name";
$elements[2]->alias="name";
$elements[3]=new stdClass();
$elements[3]->field="`fynx_subcategory`.`order`";
$elements[3]->sort="1";
$elements[3]->header="Order";
$elements[3]->alias="order";
$elements[4]=new stdClass();
$elements[4]->field="`fynx_subcategory`.`status`";
$elements[4]->sort="1";
$elements[4]->header="Status";
$elements[4]->alias="status";
$elements[5]=new stdClass();
$elements[5]->field="`fynx_subcategory`.`image1`";
$elements[5]->sort="1";
$elements[5]->header="Image1";
$elements[5]->alias="image1";
$elements[6]=new stdClass();
$elements[6]->field="`fynx_subcategory`.`image2`";
$elements[6]->sort="1";
$elements[6]->header="Image2";
$elements[6]->alias="image2";
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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `fynx_subcategory`");
$this->load->view("json",$data);
}

public function createsubcategory()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="createsubcategory";
   $data['status']=$this->user_model->getstatusdropdown();
$data['category']=$this->product_model->getcategorydropdown();
$data["title"]="Create subcategory";
$this->load->view("template",$data);
}
public function createsubcategorysubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("category","Category","trim");
$this->form_validation->set_rules("name","Name","trim");
$this->form_validation->set_rules("order","Order","trim");
$this->form_validation->set_rules("status","Status","trim");
$this->form_validation->set_rules("image1","Image1","trim");
$this->form_validation->set_rules("image2","Image2","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="createsubcategory";
   $data['status']=$this->user_model->getstatusdropdown();
$data['category']=$this->product_model->getcategorydropdown();
$data["title"]="Create subcategory";
$this->load->view("template",$data);
}
else
{
$category=$this->input->get_post("category");
$name=$this->input->get_post("name");
$order=$this->input->get_post("order");
$status=$this->input->get_post("status");
//$image1=$this->input->get_post("image1");
//$image2=$this->input->get_post("image2");
    $config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png';
			$this->load->library('upload', $config);
			$filename="image1";
			$image1="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image1=$uploaddata['file_name'];
			}
			$filename="image2";
			$image2="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image2=$uploaddata['file_name'];
			}
if($this->subcategory_model->create($category,$name,$order,$status,$image1,$image2)==0)
$data["alerterror"]="New subcategory could not be created.";
else
$data["alertsuccess"]="subcategory created Successfully.";
$data["redirect"]="site/viewsubcategory";
$this->load->view("redirect",$data);
}
}
public function editsubcategory()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="editsubcategory";
   $data['status']=$this->user_model->getstatusdropdown();
$data['category']=$this->product_model->getcategorydropdown();
$data["title"]="Edit subcategory";
$data["before"]=$this->subcategory_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
public function editsubcategorysubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("id","ID","trim");
$this->form_validation->set_rules("category","Category","trim");
$this->form_validation->set_rules("name","Name","trim");
$this->form_validation->set_rules("order","Order","trim");
$this->form_validation->set_rules("status","Status","trim");
$this->form_validation->set_rules("image1","Image1","trim");
$this->form_validation->set_rules("image2","Image2","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="editsubcategory";
   $data['status']=$this->user_model->getstatusdropdown();
$data['category']=$this->product_model->getcategorydropdown();
$data["title"]="Edit subcategory";
$data["before"]=$this->subcategory_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$category=$this->input->get_post("category");
$name=$this->input->get_post("name");
$order=$this->input->get_post("order");
$status=$this->input->get_post("status");
$image1=$this->input->get_post("image1");
$image2=$this->input->get_post("image2");
$config['upload_path'] = './uploads/';
 $config['allowed_types'] = 'gif|jpg|png';
 $this->load->library('upload', $config);
 $filename="image1";
 $image1="";
 if (  $this->upload->do_upload($filename))
 {
	 $uploaddata = $this->upload->data();
	 $image1=$uploaddata['file_name'];
 }
if($image1=="")
			 {
			 $image1=$this->product_model->getimage1byid($id);
					// print_r($image);
					 $image1=$image1->image1;
			 }
 $filename="image2";
 $image2="";
 if (  $this->upload->do_upload($filename))
 {
	 $uploaddata = $this->upload->data();
	 $image2=$uploaddata['file_name'];
 }
if($image2=="")
			 {
			 $image2=$this->product_model->getimage2byid($id);
					// print_r($image);
					 $image2=$image2->image2;
			 }
if($this->subcategory_model->edit($id,$category,$name,$order,$status,$image1,$image2)==0)
$data["alerterror"]="New subcategory could not be Updated.";
else
$data["alertsuccess"]="subcategory Updated Successfully.";
$data["redirect"]="site/viewsubcategory";
$this->load->view("redirect",$data);
}
}
public function deletesubcategory()
{
$access=array("1");
$this->checkaccess($access);
$this->subcategory_model->delete($this->input->get("id"));
$data["redirect"]="site/viewsubcategory";
$this->load->view("redirect",$data);
}
public function vieworder()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="vieworder";
$data["base_url"]=site_url("site/vieworderjson");
$data["tablename"] = 'fynx_order';
$data["orderfield"] = 'id';
    $data["where"] = '';
$data["title"]="View order";
$this->load->view("template",$data);
}
function vieworderjson()
{
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`fynx_order`.`id`";
$elements[0]->sort="1";
$elements[0]->header="ID";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`fynx_order`.`user`";
$elements[1]->sort="1";
$elements[1]->header="User";
$elements[1]->alias="user";
$elements[2]=new stdClass();
$elements[2]->field="`fynx_order`.`firstname`";
$elements[2]->sort="1";
$elements[2]->header="First Name";
$elements[2]->alias="firstname";
$elements[3]=new stdClass();
$elements[3]->field="`fynx_order`.`lastname`";
$elements[3]->sort="1";
$elements[3]->header="Last Name";
$elements[3]->alias="lastname";
$elements[4]=new stdClass();
$elements[4]->field="`fynx_order`.`email`";
$elements[4]->sort="1";
$elements[4]->header="Email Id";
$elements[4]->alias="email";
$elements[5]=new stdClass();
$elements[5]->field="`fynx_order`.`billingaddress`";
$elements[5]->sort="1";
$elements[5]->header="Billing Address";
$elements[5]->alias="billingaddress";
$elements[6]=new stdClass();
$elements[6]->field="`fynx_order`.`billingcontact`";
$elements[6]->sort="1";
$elements[6]->header="Billing Contact";
$elements[6]->alias="billingcontact";
$elements[7]=new stdClass();
$elements[7]->field="`fynx_order`.`billingcity`";
$elements[7]->sort="1";
$elements[7]->header="Billing City";
$elements[7]->alias="billingcity";
$elements[8]=new stdClass();
$elements[8]->field="`fynx_order`.`billingstate`";
$elements[8]->sort="1";
$elements[8]->header="Billing State";
$elements[8]->alias="billingstate";
$elements[9]=new stdClass();
$elements[9]->field="`fynx_order`.`billingpincode`";
$elements[9]->sort="1";
$elements[9]->header="Billing Pincode";
$elements[9]->alias="billingpincode";
$elements[10]=new stdClass();
$elements[10]->field="`fynx_order`.`billingcountry`";
$elements[10]->sort="1";
$elements[10]->header="Billing Country";
$elements[10]->alias="billingcountry";
$elements[11]=new stdClass();
$elements[11]->field="`fynx_order`.`shippingcity`";
$elements[11]->sort="1";
$elements[11]->header="Shipping City";
$elements[11]->alias="shippingcity";
$elements[12]=new stdClass();
$elements[12]->field="`fynx_order`.`shippingaddress`";
$elements[12]->sort="1";
$elements[12]->header="Shipping Address";
$elements[12]->alias="shippingaddress";
$elements[13]=new stdClass();
$elements[13]->field="`fynx_order`.`shippingname`";
$elements[13]->sort="1";
$elements[13]->header="Shipping Name";
$elements[13]->alias="shippingname";
$elements[14]=new stdClass();
$elements[14]->field="`fynx_order`.`shippingcountry`";
$elements[14]->sort="1";
$elements[14]->header="Shipping Country";
$elements[14]->alias="shippingcountry";
$elements[15]=new stdClass();
$elements[15]->field="`fynx_order`.`shippingcontact`";
$elements[15]->sort="1";
$elements[15]->header="Shipping Contact";
$elements[15]->alias="shippingcontact";
$elements[16]=new stdClass();
$elements[16]->field="`fynx_order`.`shippingstate`";
$elements[16]->sort="1";
$elements[16]->header="shippingstate";
$elements[16]->alias="shippingstate";
$elements[17]=new stdClass();
$elements[17]->field="`fynx_order`.`shippingpincode`";
$elements[17]->sort="1";
$elements[17]->header="Shipping Pincode";
$elements[17]->alias="shippingpincode";
$elements[18]=new stdClass();
$elements[18]->field="`fynx_order`.`trackingcode`";
$elements[18]->sort="1";
$elements[18]->header="Tracking Code";
$elements[18]->alias="trackingcode";
$elements[19]=new stdClass();
$elements[19]->field="`fynx_order`.`defaultcurrency`";
$elements[19]->sort="1";
$elements[19]->header="Default Currency";
$elements[19]->alias="defaultcurrency";
$elements[20]=new stdClass();
$elements[20]->field="`fynx_order`.`shippingmethod`";
$elements[20]->sort="1";
$elements[20]->header="Shipping Method";
$elements[20]->alias="shippingmethod";
$elements[21]=new stdClass();
$elements[21]->field="`fynx_order`.`orderstatus`";
$elements[21]->sort="1";
$elements[21]->header="Order Status";
$elements[21]->alias="orderstatus";

$elements[22]=new stdClass();
$elements[22]->field="`user`.`name`";
$elements[22]->sort="1";
$elements[22]->header="username";
$elements[22]->alias="username";

$elements[23]=new stdClass();
$elements[23]->field="`fynx_order`.`timestamp`";
$elements[23]->sort="1";
$elements[23]->header="Timestamp";
$elements[23]->alias="timestamp";

$elements[24]=new stdClass();
$elements[24]->field="`orderstatus`.`name`";
$elements[24]->sort="1";
$elements[24]->header="orderstatusname";
$elements[24]->alias="orderstatusname";
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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `fynx_order` LEFT OUTER JOIN `user` ON `user`.`id`=`fynx_order`.`user` LEFT OUTER JOIN `orderstatus` ON `orderstatus`.`id`=`fynx_order`.`orderstatus`");
$queryarray = $data["message"]->queryresult;

    foreach($queryarray as $row)
    {
        $row->orderproduct = $this->db->query("SELECT * FROM `fynx_orderitem` WHERE `order` = '$row->id'")->result();
        $row->orderproduct = $this->db->query("SELECT `fynx_orderitem`.`id`, `fynx_orderitem`.`discount`, `fynx_orderitem`.`order`, `fynx_orderitem`.`product`,`fynx_product`.`name` as `productname`, `fynx_orderitem`.`quantity`, `fynx_orderitem`.`price`, `fynx_orderitem`.`finalprice` FROM `fynx_orderitem`
LEFT OUTER JOIN `fynx_product` ON `fynx_product`.`id`=`fynx_orderitem`.`product`
WHERE `fynx_orderitem`.`order`=$row->id")->result();
    }

$this->load->view("json",$data);
}

public function createorder()
{
$access=array("1");
$this->checkaccess($access);
$data[ 'user' ] =$this->user_model->getuserdropdown();
    $data[ 'orderstatus' ] =$this->order_model->getorderstatus();
    $data[ 'paymentmode' ] =$this->order_model->getpaymentmodedropdown();
$data["page"]="createorder";
$data["title"]="Create order";
$this->load->view("template",$data);
}
public function createordersubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("user","User","trim");
$this->form_validation->set_rules("firstname","First Name","trim");
$this->form_validation->set_rules("lastname","Last Name","trim");
$this->form_validation->set_rules("email","Email Id","trim");
$this->form_validation->set_rules("billingaddress","Billing Address","trim");
$this->form_validation->set_rules("billingcontact","Billing Contact","trim");
$this->form_validation->set_rules("billingcity","Billing City","trim");
$this->form_validation->set_rules("billingstate","Billing State","trim");
$this->form_validation->set_rules("billingpincode","Billing Pincode","trim");
$this->form_validation->set_rules("billingcountry","Billing Country","trim");
$this->form_validation->set_rules("shippingcity","Shipping City","trim");
$this->form_validation->set_rules("shippingaddress","Shipping Address","trim");
$this->form_validation->set_rules("shippingname","Shipping Name","trim");
$this->form_validation->set_rules("shippingcountry","Shipping Country","trim");
$this->form_validation->set_rules("shippingcontact","Shipping Contact","trim");
$this->form_validation->set_rules("shippingstate","shippingstate","trim");
$this->form_validation->set_rules("shippingpincode","Shipping Pincode","trim");
$this->form_validation->set_rules("trackingcode","Tracking Code","trim");
$this->form_validation->set_rules("defaultcurrency","Default Currency","trim");
$this->form_validation->set_rules("shippingmethod","Shipping Method","trim");
$this->form_validation->set_rules("orderstatus","Order Status","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
 $data[ 'user' ] =$this->user_model->getuserdropdown();
$data[ 'orderstatus' ] =$this->order_model->getorderstatus();
     $data[ 'paymentmode' ] =$this->order_model->getpaymentmodedropdown();
$data["page"]="createorder";
$data["title"]="Create order";
$this->load->view("template",$data);
}
else
{
$user=$this->input->get_post("user");
$firstname=$this->input->get_post("firstname");
$lastname=$this->input->get_post("lastname");
$email=$this->input->get_post("email");
$billingaddress=$this->input->get_post("billingaddress");
$billingcontact=$this->input->get_post("billingcontact");
$billingcity=$this->input->get_post("billingcity");
$billingstate=$this->input->get_post("billingstate");
$billingpincode=$this->input->get_post("billingpincode");
$billingcountry=$this->input->get_post("billingcountry");
$shippingcity=$this->input->get_post("shippingcity");
$shippingaddress=$this->input->get_post("shippingaddress");
$shippingname=$this->input->get_post("shippingname");
$shippingcountry=$this->input->get_post("shippingcountry");
$shippingcontact=$this->input->get_post("shippingcontact");
$shippingstate=$this->input->get_post("shippingstate");
$shippingpincode=$this->input->get_post("shippingpincode");
$trackingcode=$this->input->get_post("trackingcode");
$defaultcurrency=$this->input->get_post("defaultcurrency");
$shippingmethod=$this->input->get_post("shippingmethod");
$orderstatus=$this->input->get_post("orderstatus");
    $billingline1=$this->input->post('billingline1');
            $billingline2=$this->input->post('billingline2');
            $billingline3=$this->input->post('billingline3');
            $shippingline1=$this->input->post('shippingline1');
            $shippingline2=$this->input->post('shippingline2');
            $shippingline3=$this->input->post('shippingline3');
            $transactionid=$this->input->post('transactionid');
            $paymentmode=$this->input->post('paymentmode');
if($this->order_model->create($user,$firstname,$lastname,$email,$billingaddress,$billingcontact,$billingcity,$billingstate,$billingpincode,$billingcountry,$shippingcity,$shippingaddress,$shippingname,$shippingcountry,$shippingcontact,$shippingstate,$shippingpincode,$trackingcode,$defaultcurrency,$shippingmethod,$orderstatus,$billingline1,$billingline2,$billingline3,$shippingline1,$shippingline2,$shippingline3,$transactionid,$paymentmode)==0)
$data["alerterror"]="New order could not be created.";
else
$data["alertsuccess"]="order created Successfully.";
$data["redirect"]="site/vieworder";
$this->load->view("redirect",$data);
}
}
public function editorder()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="editorder";
//$data["page2"]="block/orderblock";
$data["before1"]=$this->input->get("id");
$data["before2"]=$this->input->get("id");
     $data[ 'paymentmode' ] =$this->order_model->getpaymentmodedropdown();
$data["title"]="Edit order";
$data[ 'orderstatus' ] =$this->order_model->getorderstatus();
$data[ 'user' ] =$this->user_model->getuserdropdown();
$data["before"]=$this->order_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
public function editordersubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("id","ID","trim");
$this->form_validation->set_rules("user","User","trim");
$this->form_validation->set_rules("firstname","First Name","trim");
$this->form_validation->set_rules("lastname","Last Name","trim");
$this->form_validation->set_rules("email","Email Id","trim");
$this->form_validation->set_rules("billingaddress","Billing Address","trim");
$this->form_validation->set_rules("billingcontact","Billing Contact","trim");
$this->form_validation->set_rules("billingcity","Billing City","trim");
$this->form_validation->set_rules("billingstate","Billing State","trim");
$this->form_validation->set_rules("billingpincode","Billing Pincode","trim");
$this->form_validation->set_rules("billingcountry","Billing Country","trim");
$this->form_validation->set_rules("shippingcity","Shipping City","trim");
$this->form_validation->set_rules("shippingaddress","Shipping Address","trim");
$this->form_validation->set_rules("shippingname","Shipping Name","trim");
$this->form_validation->set_rules("shippingcountry","Shipping Country","trim");
$this->form_validation->set_rules("shippingcontact","Shipping Contact","trim");
$this->form_validation->set_rules("shippingstate","shippingstate","trim");
$this->form_validation->set_rules("shippingpincode","Shipping Pincode","trim");
$this->form_validation->set_rules("trackingcode","Tracking Code","trim");
$this->form_validation->set_rules("defaultcurrency","Default Currency","trim");
$this->form_validation->set_rules("shippingmethod","Shipping Method","trim");
$this->form_validation->set_rules("orderstatus","Order Status","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="editorder";
$data[ 'orderstatus' ] =$this->order_model->getorderstatus();
     $data[ 'paymentmode' ] =$this->order_model->getpaymentmodedropdown();
$data[ 'user' ] =$this->user_model->getuserdropdown();
$data["title"]="Edit order";
$data["before"]=$this->order_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$user=$this->input->get_post("user");
$firstname=$this->input->get_post("firstname");
$lastname=$this->input->get_post("lastname");
$email=$this->input->get_post("email");
$billingaddress=$this->input->get_post("billingaddress");
$billingcontact=$this->input->get_post("billingcontact");
$billingcity=$this->input->get_post("billingcity");
$billingstate=$this->input->get_post("billingstate");
$billingpincode=$this->input->get_post("billingpincode");
$billingcountry=$this->input->get_post("billingcountry");
$shippingcity=$this->input->get_post("shippingcity");
$shippingaddress=$this->input->get_post("shippingaddress");
$shippingname=$this->input->get_post("shippingname");
$shippingcountry=$this->input->get_post("shippingcountry");
$shippingcontact=$this->input->get_post("shippingcontact");
$shippingstate=$this->input->get_post("shippingstate");
$shippingpincode=$this->input->get_post("shippingpincode");
$trackingcode=$this->input->get_post("trackingcode");
$defaultcurrency=$this->input->get_post("defaultcurrency");
$shippingmethod=$this->input->get_post("shippingmethod");
$orderstatus=$this->input->get_post("orderstatus");
    $billingline1=$this->input->post('billingline1');
            $billingline2=$this->input->post('billingline2');
            $billingline3=$this->input->post('billingline3');
            $shippingline1=$this->input->post('shippingline1');
            $shippingline2=$this->input->post('shippingline2');
            $shippingline3=$this->input->post('shippingline3');
    $transactionid=$this->input->post('transactionid');
     $paymentmode=$this->input->post('paymentmode');
if($this->order_model->edit($id,$user,$firstname,$lastname,$email,$billingaddress,$billingcontact,$billingcity,$billingstate,$billingpincode,$billingcountry,$shippingcity,$shippingaddress,$shippingname,$shippingcountry,$shippingcontact,$shippingstate,$shippingpincode,$trackingcode,$defaultcurrency,$shippingmethod,$orderstatus,$billingline1,$billingline2,$billingline3,$shippingline1,$shippingline2,$shippingline3,$transactionid,$paymentmode)==0)
$data["alerterror"]="New order could not be Updated.";
else
$data["alertsuccess"]="order Updated Successfully.";
$data["redirect"]="site/vieworder";
$this->load->view("redirect",$data);
}
}
public function deleteorder()
{
$access=array("1");
$this->checkaccess($access);
$this->order_model->delete($this->input->get("id"));
$data["redirect"]="site/vieworder";
$this->load->view("redirect",$data);
}
public function vieworderitem()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="vieworderitem";
//$data["page2"]="block/orderblock";
$data["before1"]=$this->input->get("id");
$data["before2"]=$this->input->get("id");
$data["base_url"]=site_url("site/vieworderitemjson?id=").$this->input->get("id");
$data["title"]="View orderitem";
$this->load->view("template",$data);
}
function vieworderitemjson()
{
$id=$this->input->get("id");
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`fynx_orderitem`.`id`";
$elements[0]->sort="1";
$elements[0]->header="ID";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`fynx_orderitem`.`discount`";
$elements[1]->sort="1";
$elements[1]->header="Discount";
$elements[1]->alias="discount";
$elements[2]=new stdClass();
$elements[2]->field="`fynx_orderitem`.`order`";
$elements[2]->sort="1";
$elements[2]->header="Order";
$elements[2]->alias="order";
$elements[3]=new stdClass();
$elements[3]->field="`fynx_orderitem`.`product`";
$elements[3]->sort="1";
$elements[3]->header="Product";
$elements[3]->alias="product";
$elements[4]=new stdClass();
$elements[4]->field="`fynx_orderitem`.`quantity`";
$elements[4]->sort="1";
$elements[4]->header="Quantity";
$elements[4]->alias="quantity";
$elements[5]=new stdClass();
$elements[5]->field="`fynx_orderitem`.`price`";
$elements[5]->sort="1";
$elements[5]->header="Price";
$elements[5]->alias="price";
$elements[6]=new stdClass();
$elements[6]->field="`fynx_orderitem`.`finalprice`";
$elements[6]->sort="1";
$elements[6]->header="Final Price";
$elements[6]->alias="finalprice";

$elements[7]=new stdClass();
$elements[7]->field="`fynx_product`.`name`";
$elements[7]->sort="1";
$elements[7]->header="productname";
$elements[7]->alias="productname";
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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `fynx_orderitem` LEFT OUTER JOIN `fynx_product` ON `fynx_product`.`id`=`fynx_orderitem`.`product`","WHERE `fynx_orderitem`.`order`=$id");
$this->load->view("json",$data);
}

public function createorderitem()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="createorderitem";
//$data["page2"]="block/orderblock";
$data["before1"]=$this->input->get("id");
$data['product']=$this->product_model->getproductdropdown();
$data["before2"]=$this->input->get("id");
$data['order']=$this->order_model->getorderdropdown();
$data["title"]="Create orderitem";
$this->load->view("template",$data);
}
public function createorderitemsubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("discount","Discount","trim");
$this->form_validation->set_rules("order","Order","trim");
$this->form_validation->set_rules("product","Product","trim");
$this->form_validation->set_rules("quantity","Quantity","trim");
$this->form_validation->set_rules("price","Price","trim");
$this->form_validation->set_rules("finalprice","Final Price","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="createorderitem";
$data['product']=$this->product_model->getproductdropdown();
$data['order']=$this->order_model->getorderdropdown();
$data["title"]="Create orderitem";
$this->load->view("template",$data);
}
else
{
$discount=$this->input->get_post("discount");
$order=$this->input->get_post("order");
$product=$this->input->get_post("product");
$quantity=$this->input->get_post("quantity");
$price=$this->input->get_post("price");
$finalprice=$this->input->get_post("finalprice");
if($this->orderitem_model->create($discount,$order,$product,$quantity,$price,$finalprice)==0)
$data["alerterror"]="New orderitem could not be created.";
else
$data["alertsuccess"]="orderitem created Successfully.";
$data["redirect"]="site/vieworderitem";
$this->load->view("redirect",$data);
}
}
public function editorderitem()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="editorderitem";
//$data["page2"]="block/orderblock";
$data['product']=$this->product_model->getproductdropdown();
$data["before1"]=$this->input->get("orderid");
$data["before2"]=$this->input->get("orderid");
$data['order']=$this->order_model->getorderdropdown();
$data["title"]="Edit orderitem";
$data["before"]=$this->orderitem_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
public function editorderitemsubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("id","ID","trim");
$this->form_validation->set_rules("discount","Discount","trim");
$this->form_validation->set_rules("order","Order","trim");
$this->form_validation->set_rules("product","Product","trim");
$this->form_validation->set_rules("quantity","Quantity","trim");
$this->form_validation->set_rules("price","Price","trim");
$this->form_validation->set_rules("finalprice","Final Price","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="editorderitem";
$data['product']=$this->product_model->getproductdropdown();
$data['order']=$this->order_model->getorderdropdown();
$data["title"]="Edit orderitem";
$data["before"]=$this->orderitem_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$discount=$this->input->get_post("discount");
$order=$this->input->get_post("order");
$product=$this->input->get_post("product");
$quantity=$this->input->get_post("quantity");
$price=$this->input->get_post("price");
$finalprice=$this->input->get_post("finalprice");
if($this->orderitem_model->edit($id,$discount,$order,$product,$quantity,$price,$finalprice)==0)
$data["alerterror"]="New orderitem could not be Updated.";
else
$data["alertsuccess"]="orderitem Updated Successfully.";
$data["redirect"]="site/vieworderitem";
$this->load->view("redirect",$data);
}
}
public function deleteorderitem()
{
$access=array("1");
$this->checkaccess($access);
$this->orderitem_model->delete($this->input->get("id"));
$data["redirect"]="site/vieworderitem";
$this->load->view("redirect",$data);
}


public function viewasksuman()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewasksuman";
$data["base_url"]=site_url("site/viewasksumanjson");
$data["title"]="View newsletter";
$this->load->view("template",$data);
}
function viewasksumanjson()
{
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`asksuman`.`id`";
$elements[0]->sort="1";
$elements[0]->header="ID";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`asksuman`.`category`";
$elements[1]->sort="1";
$elements[1]->header="Category";
$elements[1]->alias="category";
$elements[2]=new stdClass();
$elements[2]->field="`asksuman`.`name`";
$elements[2]->sort="1";
$elements[2]->header="Name";
$elements[2]->alias="name";
$elements[3]=new stdClass();
$elements[3]->field="`asksuman`.`email`";
$elements[3]->sort="1";
$elements[3]->header="Email Id";
$elements[3]->alias="email";

// $elements[4]=new stdClass();
// $elements[4]->field="`user`.`name`";
// $elements[4]->sort="1";
// $elements[4]->header="username";
// $elements[4]->alias="username";
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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `asksuman`");
$this->load->view("json",$data);
}

public function editasksuman()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="editasksuman";
$data[ 'category' ] =$this->user_model->getcategorydropdown();
$data["title"]="Edit newsletter";
$data["before"]=$this->newsletter_model->beforeeditasksuman($this->input->get("id"));
$this->load->view("template",$data);
}
public function editasksumansubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("id","ID","trim");
$this->form_validation->set_rules("email","Email Id","trim");
$this->form_validation->set_rules("category","Category","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="editnewsletter";
$data[ 'category' ] =$this->user_model->getcategorydropdown();
$data["title"]="Edit Ask Suman";
$data["before"]=$this->newsletter_model->beforeeditasksuman($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$category=$this->input->get_post("category");
$email=$this->input->get_post("email");
$name=$this->input->get_post("name");
$question=$this->input->get_post("question");
if($this->newsletter_model->editasksuman($id,$category,$email,$name,$question)==0)
$data["alerterror"]="New Ask Suman could not be Updated.";
else
$data["alertsuccess"]="Ask Suman Updated Successfully.";
$data["redirect"]="site/viewasksuman";
$this->load->view("redirect",$data);
}
}



public function viewnewsletter()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewnewsletter";
$data["base_url"]=site_url("site/viewnewsletterjson");
$data["title"]="View newsletter";
$this->load->view("template",$data);
}
function viewnewsletterjson()
{
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`fynx_newsletter`.`id`";
$elements[0]->sort="1";
$elements[0]->header="ID";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`fynx_newsletter`.`user`";
$elements[1]->sort="1";
$elements[1]->header="User";
$elements[1]->alias="user";
$elements[2]=new stdClass();
$elements[2]->field="`fynx_newsletter`.`email`";
$elements[2]->sort="1";
$elements[2]->header="Email Id";
$elements[2]->alias="email";
$elements[3]=new stdClass();
$elements[3]->field="`fynx_newsletter`.`status`";
$elements[3]->sort="1";
$elements[3]->header="Status";
$elements[3]->alias="status";

$elements[4]=new stdClass();
$elements[4]->field="`user`.`name`";
$elements[4]->sort="1";
$elements[4]->header="username";
$elements[4]->alias="username";
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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `fynx_newsletter` LEFT OUTER JOIN `user` ON `user`.`id`=`fynx_newsletter`.`user`");
$this->load->view("json",$data);
}

public function createnewsletter()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="createnewsletter";
$data[ 'user' ] =$this->user_model->getuserdropdown();
$data[ 'status' ] =$this->user_model->getstatusdropdown();
$data["title"]="Create newsletter";
$this->load->view("template",$data);
}
public function createnewslettersubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("user","User","trim");
$this->form_validation->set_rules("email","Email Id","trim");
$this->form_validation->set_rules("status","Status","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="createnewsletter";
$data[ 'user' ] =$this->user_model->getuserdropdown();
$data[ 'status' ] =$this->user_model->getstatusdropdown();
$data["title"]="Create newsletter";
$this->load->view("template",$data);
}
else
{
$user=$this->input->get_post("user");
$email=$this->input->get_post("email");
$status=$this->input->get_post("status");
if($this->newsletter_model->create($user,$email,$status)==0)
$data["alerterror"]="New newsletter could not be created.";
else
$data["alertsuccess"]="newsletter created Successfully.";
$data["redirect"]="site/viewnewsletter";
$this->load->view("redirect",$data);
}
}
public function editnewsletter()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="editnewsletter";
$data[ 'user' ] =$this->user_model->getuserdropdown();
$data[ 'status' ] =$this->user_model->getstatusdropdown();
$data["title"]="Edit newsletter";
$data["before"]=$this->newsletter_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
public function editnewslettersubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("id","ID","trim");
$this->form_validation->set_rules("user","User","trim");
$this->form_validation->set_rules("email","Email Id","trim");
$this->form_validation->set_rules("status","Status","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="editnewsletter";
$data[ 'user' ] =$this->user_model->getuserdropdown();
$data[ 'status' ] =$this->user_model->getstatusdropdown();
$data["title"]="Edit newsletter";
$data["before"]=$this->newsletter_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$user=$this->input->get_post("user");
$email=$this->input->get_post("email");
$status=$this->input->get_post("status");
if($this->newsletter_model->edit($id,$user,$email,$status)==0)
$data["alerterror"]="New newsletter could not be Updated.";
else
$data["alertsuccess"]="newsletter Updated Successfully.";
$data["redirect"]="site/viewnewsletter";
$this->load->view("redirect",$data);
}
}
public function deletenewsletter()
{
$access=array("1");
$this->checkaccess($access);
$this->newsletter_model->delete($this->input->get("id"));
$data["redirect"]="site/viewnewsletter";
$this->load->view("redirect",$data);
}
public function viewconfig()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewconfig";
$data["base_url"]=site_url("site/viewconfigjson");
$data["title"]="View config";
$this->load->view("template",$data);
}
function viewconfigjson()
{
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`fynx_config`.`id`";
$elements[0]->sort="1";
$elements[0]->header="ID";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`fynx_config`.`text`";
$elements[1]->sort="1";
$elements[1]->header="Text";
$elements[1]->alias="text";
$elements[2]=new stdClass();
$elements[2]->field="`fynx_config`.`content`";
$elements[2]->sort="1";
$elements[2]->header="Content";
$elements[2]->alias="content";
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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `fynx_config`");
$this->load->view("json",$data);
}

public function createconfig()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="createconfig";
$data["title"]="Create config";
$this->load->view("template",$data);
}
public function createconfigsubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("text","Text","trim");
$this->form_validation->set_rules("content","Content","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="createconfig";
$data["title"]="Create config";
$this->load->view("template",$data);
}
else
{
$text=$this->input->get_post("text");
$content=$this->input->get_post("content");
if($this->config_model->create($text,$content)==0)
$data["alerterror"]="New config could not be created.";
else
$data["alertsuccess"]="config created Successfully.";
$data["redirect"]="site/viewconfig";
$this->load->view("redirect",$data);
}
}
public function editconfig()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="editconfig";
$data["title"]="Edit config";
$data["before"]=$this->config_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
public function editconfigsubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("id","ID","trim");
$this->form_validation->set_rules("text","Text","trim");
$this->form_validation->set_rules("content","Content","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="editconfig";
$data["title"]="Edit config";
$data["before"]=$this->config_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$text=$this->input->get_post("text");
$content=$this->input->get_post("content");
if($this->config_model->edit($id,$text,$content)==0)
$data["alerterror"]="New config could not be Updated.";
else
$data["alertsuccess"]="config Updated Successfully.";
$data["redirect"]="site/viewconfig";
$this->load->view("redirect",$data);
}
}
public function deleteconfig()
{
$access=array("1");
$this->checkaccess($access);
$this->config_model->delete($this->input->get("id"));
$data["redirect"]="site/viewconfig";
$this->load->view("redirect",$data);
}
public function viewsize()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewsize";
$data["base_url"]=site_url("site/viewsizejson");
$data["title"]="View size";
$this->load->view("template",$data);
}
function viewsizejson()
{
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`fynx_size`.`id`";
$elements[0]->sort="1";
$elements[0]->header="ID";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`fynx_size`.`status`";
$elements[1]->sort="1";
$elements[1]->header="status";
$elements[1]->alias="status";
$elements[2]=new stdClass();
$elements[2]->field="`fynx_size`.`name`";
$elements[2]->sort="1";
$elements[2]->header="Name";
$elements[2]->alias="name";
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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `fynx_size`");
$this->load->view("json",$data);
}

public function createsize()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="createsize";
 $data['status']=$this->user_model->getstatusdropdown();
$data["title"]="Create size";
$this->load->view("template",$data);
}
public function createsizesubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("status","status","trim");
$this->form_validation->set_rules("name","Name","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="createsize";
 $data['status']=$this->user_model->getstatusdropdown();
$data["title"]="Create size";
$this->load->view("template",$data);
}
else
{
$status=$this->input->get_post("status");
$name=$this->input->get_post("name");
if($this->size_model->create($status,$name)==0)
$data["alerterror"]="New size could not be created.";
else
$data["alertsuccess"]="size created Successfully.";
$data["redirect"]="site/viewsize";
$this->load->view("redirect",$data);
}
}
public function editsize()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="editsize";
$data["title"]="Edit size";
 $data['status']=$this->user_model->getstatusdropdown();
$data["before"]=$this->size_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
public function editsizesubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("id","ID","trim");
$this->form_validation->set_rules("status","status","trim");
$this->form_validation->set_rules("name","Name","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="editsize";
 $data['status']=$this->user_model->getstatusdropdown();
$data["title"]="Edit size";
$data["before"]=$this->size_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$status=$this->input->get_post("status");
$name=$this->input->get_post("name");
if($this->size_model->edit($id,$status,$name)==0)
$data["alerterror"]="New size could not be Updated.";
else
$data["alertsuccess"]="size Updated Successfully.";
$data["redirect"]="site/viewsize";
$this->load->view("redirect",$data);
}
}
public function deletesize()
{
$access=array("1");
$this->checkaccess($access);
$this->size_model->delete($this->input->get("id"));
$data["redirect"]="site/viewsize";
$this->load->view("redirect",$data);
}
public function viewsizechart()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewsizechart";
$data["base_url"]=site_url("site/viewsizechartjson");
$data["title"]="View sizechart";
$this->load->view("template",$data);
}
function viewsizechartjson()
{
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`fynx_sizechart`.`id`";
$elements[0]->sort="1";
$elements[0]->header="ID";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`fynx_sizechart`.`name`";
$elements[1]->sort="1";
$elements[1]->header="Name";
$elements[1]->alias="name";
$elements[2]=new stdClass();
$elements[2]->field="`fynx_sizechart`.`image`";
$elements[2]->sort="1";
$elements[2]->header="Image";
$elements[2]->alias="image";
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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `fynx_sizechart`");
$this->load->view("json",$data);
}

public function createsizechart()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="createsizechart";
$data["title"]="Create sizechart";
$this->load->view("template",$data);
}
public function createsizechartsubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("name","Name","trim");
$this->form_validation->set_rules("image","Image","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="createsizechart";
$data["title"]="Create sizechart";
$this->load->view("template",$data);
}
else
{
$name=$this->input->get_post("name");
//$image=$this->input->get_post("image");
     $config['upload_path'] = './uploads/';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $this->load->library('upload', $config);
            $filename = 'image';
            $image = '';
            if ($this->upload->do_upload($filename)) {
                $uploaddata = $this->upload->data();
                $image = $uploaddata['file_name'];
                $config_r['source_image'] = './uploads/'.$uploaddata['file_name'];
                $config_r['maintain_ratio'] = true;
                $config_t['create_thumb'] = false; ///add this
                $config_r['width'] = 800;
                $config_r['height'] = 800;
                $config_r['quality'] = 100;

                // end of configs

                $this->load->library('image_lib', $config_r);
                $this->image_lib->initialize($config_r);
                if (!$this->image_lib->resize()) {
                    $data['alerterror'] = 'Failed.'.$this->image_lib->display_errors();

                    // return false;
                } else {

                    // print_r($this->image_lib->dest_image);
                    // dest_image

                    $image = $this->image_lib->dest_image;

                    // return false;
                }
            }
if($this->sizechart_model->create($name,$image)==0)
$data["alerterror"]="New sizechart could not be created.";
else
$data["alertsuccess"]="sizechart created Successfully.";
$data["redirect"]="site/viewsizechart";
$this->load->view("redirect",$data);
}
}
public function editsizechart()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="editsizechart";
$data["title"]="Edit sizechart";
$data["before"]=$this->sizechart_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
public function editsizechartsubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("id","ID","trim");
$this->form_validation->set_rules("name","Name","trim");
$this->form_validation->set_rules("image","Image","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="editsizechart";
$data["title"]="Edit sizechart";
$data["before"]=$this->sizechart_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$name=$this->input->get_post("name");
//$image=$this->input->get_post("image");
      $config['upload_path'] = './uploads/';
						$config['allowed_types'] = 'gif|jpg|png|jpeg';
						$this->load->library('upload', $config);
						$filename="image";
						$image="";
						if (  $this->upload->do_upload($filename))
						{
							$uploaddata = $this->upload->data();
							$image=$uploaddata['file_name'];
						}

						if($image=="")
						{
						$image=$this->sizechart_model->getimagebyid($id);
						   // print_r($image);
							$image=$image->image;
						}
if($this->sizechart_model->edit($id,$name,$image)==0)
$data["alerterror"]="New sizechart could not be Updated.";
else
$data["alertsuccess"]="sizechart Updated Successfully.";
$data["redirect"]="site/viewsizechart";
$this->load->view("redirect",$data);
}
}
public function deletesizechart()
{
$access=array("1");
$this->checkaccess($access);
$this->sizechart_model->delete($this->input->get("id"));
$data["redirect"]="site/viewsizechart";
$this->load->view("redirect",$data);
}




	  // contact

    function viewcontact()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['page']='viewcontact';
        $data["base_url"]=site_url("site/viewcontactjson");
		$data['title']='View Contact';
		$this->load->view('template',$data);
	}
    public function editcontact()
{
    $access=array("1");
    $this->checkaccess($access);
    $data["page"]="editcontact";
    $data["title"]="Edit Contact";
    $data["before"]=$this->newsletter_model->beforeeditcontact($this->input->get("id"));
    $this->load->view("template",$data);
}
    function viewcontactjson()
{
    $elements=array();
    $elements[0]=new stdClass();
    $elements[0]->field="`contact`.`id`";
    $elements[0]->sort="1";
    $elements[0]->header="ID";
    $elements[0]->alias="id";
		$elements[1]=new stdClass();
		$elements[1]->field="`contact`.`firstname`";
		$elements[1]->sort="1";
		$elements[1]->header="First Name";
		$elements[1]->alias="firstname";
		$elements[2]=new stdClass();
		$elements[2]->field="`contact`.`lastname`";
		$elements[2]->sort="1";
		$elements[2]->header="Last Name";
		$elements[2]->alias="lastname";
    $elements[3]=new stdClass();
    $elements[3]->field="`contact`.`email`";
    $elements[3]->sort="1";
    $elements[3]->header="Email Id";
    $elements[3]->alias="email";
    $elements[4]=new stdClass();
    $elements[4]->field="`contact`.`telephone`";
    $elements[4]->sort="1";
    $elements[4]->header="Contact";
    $elements[4]->alias="telephone";
    $elements[5]=new stdClass();
    $elements[5]->field="`contact`.`comment`";
    $elements[5]->sort="1";
    $elements[5]->header="Comment";
    $elements[5]->alias="comment";

    $elements[6]=new stdClass();
    $elements[6]->field="`contact`.`name`";
    $elements[6]->sort="1";
    $elements[6]->header="Name";
    $elements[6]->alias="name";
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
    $data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `contact`");
    $this->load->view("json",$data);
}
    function printorderinvoice()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data[ 'category' ] =$this->category_model->getcategorydropdown();
		$data[ 'table' ] =$this->order_model->getorderitem($this->input->get('id'));
		$data['before']=$this->order_model->beforeedit($this->input->get('id'));
        $data['id']=$this->input->get('id');
		$data['page']='orderinvoice';
		$this->load->view('templateinvoice',$data);
	}
    function printorderlabel()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data[ 'category' ] =$this->category_model->getcategorydropdown();
		$data[ 'table' ] =$this->order_model->getorderitem($this->input->get('id'));
		$data['before']=$this->order_model->beforeedit($this->input->get('id'));
        $data['id']=$this->input->get('id');
		$data['page']='templatelabel';
		$data['title']='Edit order items';
		$this->load->view('templatelabel',$data);
	}
    function uploadproductcsv()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data[ 'page' ] = 'uploadproductcsv';
		$data[ 'title' ] = 'Upload product';
		$this->load->view( 'template', $data );
	}

    function uploadproductcsvsubmit()
	{
        $access = array("1");
		$this->checkaccess($access);
        $config['upload_path'] = './uploads/';
        $config['allowed_types'] = '*';
        $this->load->library('upload', $config);
        $filename="file";
        $file="";
        if (  $this->upload->do_upload($filename))
        {
            $uploaddata = $this->upload->data();
            $file=$uploaddata['file_name'];
            $filepath=$uploaddata['file_path'];
        }
        $fullfilepath=$filepath."".$file;
        $file = $this->csvreader->parse_file($fullfilepath);
        $id1=$this->product_model->createbycsv($file);
//        echo $id1;

        if($id1==0)
        $data['alerterror']="New products could not be Uploaded.";
		else
		$data['alertsuccess']="products Uploaded Successfully.";

        $data['redirect']="site/viewproduct";
        $this->load->view("redirect",$data);
    }
    function viewsubscribe()
	{
		$access = array("1");
		$this->checkaccess($access);
		$data['page']='viewsubscribe';
        $data["base_url"]=site_url("site/viewsubscribejson");
		$data['title']='View Subscribe';
		$this->load->view('template',$data);
	}
    function viewsubscribejson()
{
    $elements=array();
    $elements[0]=new stdClass();
    $elements[0]->field="`subscribe`.`id`";
    $elements[0]->sort="1";
    $elements[0]->header="ID";
    $elements[0]->alias="id";
    $elements[1]=new stdClass();
    $elements[1]->field="`subscribe`.`email`";
    $elements[1]->sort="1";
    $elements[1]->header="Email";
    $elements[1]->alias="email";
    $elements[2]=new stdClass();
    $elements[2]->field="`subscribe`.`timestamp`";
    $elements[2]->sort="1";
    $elements[2]->header="timestamp";
    $elements[2]->alias="timestamp";
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
    $data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `subscribe`");
    $this->load->view("json",$data);
}
// PRODUCT DESIGN IMAGE

    public function viewproductdesignimage()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewproductdesignimage";
$data["base_url"]=site_url("site/viewproductdesignimagejson?id=".$this->input->get('id'));
$data["title"]="View Subcategory";
$this->load->view("template",$data);
}
function viewproductdesignimagejson()
{
$id=$this->input->get('id');
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`productcategory`.`id`";
$elements[0]->sort="0";
$elements[0]->header="ID";
$elements[0]->alias="id";

$elements[2]=new stdClass();
$elements[2]->field="`productcategory`.`product`";
$elements[2]->sort="0";
$elements[2]->header="ProductID";
$elements[2]->alias="product";

$elements[3]=new stdClass();
$elements[3]->field="`fynx_product`.`name`";
$elements[3]->sort="0";
$elements[3]->header="Product";
$elements[3]->alias="productname";

$elements[4]=new stdClass();
$elements[4]->field="`fynx_subcategory`.`name`";
$elements[4]->sort="1";
$elements[4]->header="subcategory";
$elements[4]->alias="subcategory";
$search=$this->input->get_post("search");
$pageno=$this->input->get_post("pageno");
$orderby=$this->input->get_post("orderby");
$orderorder=$this->input->get_post("orderorder");
$maxrow=$this->input->get_post("maxrow");
if($maxrow=="")
{
$maxrow=20;
}
$data["message"]=$this->chintantable->query($pageno,$maxrow,' `productcategory`.`product` ASC,`productcategory`.`subcategory ASC` ','',$search,$elements,"FROM `productcategory` LEFT OUTER JOIN `fynx_product` ON `fynx_product`.`id`=`productcategory`.`product` LEFT OUTER JOIN `fynx_subcategory` ON `fynx_subcategory`.`id`=`productcategory`.`subcategory`","WHERE `productcategory`.`product`='$id'");
$this->load->view("json",$data);
}

public function createproductdesignimage()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="createproductdesignimage";
 $data['product']=$this->product_model->getproductdropdown();
$data['subcategory']=$this->subcategory_model->getsubcategorydropdown();
$data["title"]="Create Subcategory";
$this->load->view("template",$data);
}
public function createproductdesignimagesubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("name","Name","trim");
$this->form_validation->set_rules("image","Image","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="createproductdesignimage";
 $data['product']=$this->product_model->getproductdropdown();
$data['subcategory']=$this->subcategory_model->getsubcategorydropdown();
$data["title"]="Create Subcategory";
$this->load->view("template",$data);
}
else
{
$product=$this->input->get_post("product");
$subcategory=$this->input->get_post("subcategory");
//$image=$this->input->get_post("image");
    //  $config['upload_path'] = './uploads/';
    //         $config['allowed_types'] = 'gif|jpg|png|jpeg';
    //         $this->load->library('upload', $config);
    //         $filename = 'image';
    //         $image = '';
    //         if ($this->upload->do_upload($filename)) {
    //             $uploaddata = $this->upload->data();
    //             $image = $uploaddata['file_name'];
    //             $config_r['source_image'] = './uploads/'.$uploaddata['file_name'];
    //             $config_r['maintain_ratio'] = true;
    //             $config_t['create_thumb'] = false; ///add this
    //             $config_r['width'] = 800;
    //             $config_r['height'] = 800;
    //             $config_r['quality'] = 100;
		 //
    //             // end of configs
		 //
    //             $this->load->library('image_lib', $config_r);
    //             $this->image_lib->initialize($config_r);
    //             if (!$this->image_lib->resize()) {
    //                 $data['alerterror'] = 'Failed.'.$this->image_lib->display_errors();
		 //
    //                 // return false;
    //             } else {
		 //
    //                 // print_r($this->image_lib->dest_image);
    //                 // dest_image
		 //
    //                 $image = $this->image_lib->dest_image;
		 //
    //                 // return false;
    //             }
    //         }
if($this->productdesignimage_model->create($product,$subcategory)==0)
$data["alerterror"]="New Subcategory could not be created.";
else
$data["alertsuccess"]="Subcategory created Successfully.";
$data["redirect"]="site/viewproductdesignimage?id=".$product;
$this->load->view("redirect2",$data);
}
}
public function editproductdesignimage()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="editproductdesignimage";
$data["title"]="Edit productdesignimage";
 $data['product']=$this->product_model->getproductdropdown();
$data['subcategory']=$this->subcategory_model->getsubcategorydropdown();
$data["before"]=$this->productdesignimage_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
public function editproductdesignimagesubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("id","ID","trim");
$this->form_validation->set_rules("name","Name","trim");
$this->form_validation->set_rules("image","Image","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="editproductdesignimage";
$data["title"]="Edit productdesignimage";
 $data['product']=$this->product_model->getproductdropdown();
 $data['subcategory']=$this->subcategory_model->getsubcategorydropdown();
$data["before"]=$this->productdesignimage_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$product=$this->input->get_post("product");
$subcategory=$this->input->get_post("subcategory");
      // $config['upload_path'] = './uploads/';
			// 			$config['allowed_types'] = 'gif|jpg|png|jpeg';
			// 			$this->load->library('upload', $config);
			// 			$filename="image";
			// 			$image="";
			// 			if (  $this->upload->do_upload($filename))
			// 			{
			// 				$uploaddata = $this->upload->data();
			// 				$image=$uploaddata['file_name'];
			// 			}
			//
			// 			if($image=="")
			// 			{
			// 			$image=$this->productdesignimage_model->getimagebyid($id);
			// 			   // print_r($image);
			// 				$image=$image->image;
			// 			}
if($this->productdesignimage_model->edit($id,$product,$subcategory)==0)
$data["alerterror"]="New Subcategory could not be Updated.";
else
$data["alertsuccess"]="Subcategory Updated Successfully.";
$data["redirect"]="site/viewproductdesignimage?id=".$product;
$this->load->view("redirect2",$data);
}
}
public function deleteproductdesignimage()
{
$access=array("1");
$this->checkaccess($access);
$this->productdesignimage_model->delete($this->input->get("id"));
//  $product=$this->input->get("productid");
//$data["redirect"]="site/viewproductdesignimage?id=".$product;
$data["redirect"]="site/viewproductdesignimage?id=".$this->input->get('productid');
$this->load->view("redirect2",$data);
}



public function viewtestimonial()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewtestimonial";
$data["base_url"]=site_url("site/viewtestimonialjson");
$data["title"]="View testimonial";
$this->load->view("template",$data);
}
function viewtestimonialjson()
{
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`testimonial`.`id`";
$elements[0]->sort="1";
$elements[0]->header="ID";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`testimonial`.`name`";
$elements[1]->sort="1";
$elements[1]->header="name";
$elements[1]->alias="name";
$elements[2]=new stdClass();
$elements[2]->field="`testimonial`.`location`";
$elements[2]->sort="1";
$elements[2]->header="location";
$elements[2]->alias="location";

$elements[3]=new stdClass();
$elements[3]->field="`testimonial`.`weight`";
$elements[3]->sort="1";
$elements[3]->header="weight";
$elements[3]->alias="weight";
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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `testimonial`");
$this->load->view("json",$data);
}
public function createtestimonial()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="createtestimonial";
$data["title"]="Create testimonial";
$this->load->view("template",$data);
}
public function createtestimonialsubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("text","Text","trim");
$this->form_validation->set_rules("content","Content","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="createtestimonial";
$data["title"]="Create testimonial";
$this->load->view("template",$data);
}
else
{
$name=$this->input->get_post("name");
$location=$this->input->get_post("location");
$description=$this->input->get_post("description");
$weight=$this->input->get_post("weight");
      //  $config['upload_path'] = './uploads/';
			// $config['allowed_types'] = 'gif|jpg|png';
			// $this->load->library('upload', $config);
			// $filename="image";
			// $image="";
			// if (  $this->upload->do_upload($filename))
			// {
			// 	$uploaddata = $this->upload->data();
			// 	$image=$uploaddata['file_name'];
			// }
if($this->testimonial_model->create($name,$location,$description,$weight)==0)
$data["alerterror"]="New testimonial could not be created.";
else
$data["alertsuccess"]="testimonial created Successfully.";
$data["redirect"]="site/viewtestimonial";
$this->load->view("redirect",$data);
}
}

public function edittestimonial()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="edittestimonial";
$data["title"]="Edit testimonial";
$data["before"]=$this->testimonial_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
public function edittestimonialsubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("id","ID","trim");
$this->form_validation->set_rules("text","Text","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="edittestimonial";
$data["title"]="Edit testimonial";
$data["before"]=$this->testimonial_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$name=$this->input->get_post("name");
$location=$this->input->get_post("location");
$description=$this->input->get_post("description");
$weight=$this->input->get_post("weight");
      // $config['upload_path'] = './uploads/';
			// $config['allowed_types'] = 'gif|jpg|png|jpeg';
			// $this->load->library('upload', $config);
			// $filename="image";
			// $image="";
			// if (  $this->upload->do_upload($filename))
			// {
			// 	$uploaddata = $this->upload->data();
			// 	$image=$uploaddata['file_name'];
			//
      //           $config_r['source_image']   = './uploads/' . $uploaddata['file_name'];
      //           $config_r['maintain_ratio'] = TRUE;
      //           $config_t['create_thumb'] = FALSE;///add this
      //           $config_r['width']   = 800;
      //           $config_r['height'] = 800;
      //           $config_r['quality']    = 100;
      //           //end of configs
			//
      //           $this->load->library('image_lib', $config_r);
      //           $this->image_lib->initialize($config_r);
      //           if(!$this->image_lib->resize())
      //           {
      //               echo "Failed." . $this->image_lib->display_errors();
      //               //return false;
      //           }
      //           else
      //           {
      //               //print_r($this->image_lib->dest_image);
      //               //dest_image
      //               $image=$this->image_lib->dest_image;
      //               //return false;
      //           }
			//
			// }
			//
      //       if($image=="")
      //       {
      //       $image=$this->testimonial_model->getimagebyid($id);
      //          // print_r($image);
      //           $image=$image->image;
      //       }
if($this->testimonial_model->edit($id,$name,$location,$description,$weight)==0)
$data["alerterror"]="New testimonial could not be Updated.";
else
$data["alertsuccess"]="testimonial Updated Successfully.";
$data["redirect"]="site/viewtestimonial";
$this->load->view("redirect",$data);
}
}
public function deletetestimonial()
{
$access=array("1");
$this->checkaccess($access);
$this->testimonial_model->delete($this->input->get("id"));
$data["redirect"]="site/viewtestimonial";
$this->load->view("redirect",$data);
}



public function viewhealthpackages()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewhealthpackages";
$data["base_url"]=site_url("site/viewhealthpackagesjson");
$data["title"]="View healthpackages";
$this->load->view("template",$data);
}
function viewhealthpackagesjson()
{
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`selftables_healthpackages`.`id`";
$elements[0]->sort="1";
$elements[0]->header="id";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`selftables_healthpackages`.`type`";
$elements[1]->sort="1";
$elements[1]->header="type";
$elements[1]->alias="type";
$elements[2]=new stdClass();
$elements[2]->field="`selftables_healthpackages`.`months`";
$elements[2]->sort="1";
$elements[2]->header="months";
$elements[2]->alias="months";
$elements[3]=new stdClass();
$elements[3]->field="`selftables_healthpackages`.`consults`";
$elements[3]->sort="1";
$elements[3]->header="consults";
$elements[3]->alias="consults";
$elements[4]=new stdClass();
$elements[4]->field="`selftables_healthpackages`.`plan`";
$elements[4]->sort="1";
$elements[4]->header="plan";
$elements[4]->alias="plan";
$elements[5]=new stdClass();
$elements[5]->field="`selftables_healthpackages`.`price_in_INR`";
$elements[5]->sort="1";
$elements[5]->header="price_in_INR";
$elements[5]->alias="price_in_INR";

$elements[7]=new stdClass();
$elements[7]->field="`selftables_healthpackages`.`description`";
$elements[7]->sort="1";
$elements[7]->header="description";
$elements[7]->alias="description";
$elements[8]=new stdClass();
$elements[8]->field="`selftables_healthpackages`.`title`";
$elements[8]->sort="1";
$elements[8]->header="title";
$elements[8]->alias="title";
$elements[9]=new stdClass();
$elements[9]->field="`selftables_healthpackages`.`subtype`";
$elements[9]->sort="1";
$elements[9]->header="subtype";
$elements[9]->alias="subtype";
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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `selftables_healthpackages`");
$this->load->view("json",$data);
}




public function createhealthpackages()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="createhealthpackages";
$data["title"]="Create healthpackages";
$data[ 'subtype' ] =$this->healthpackages_model->getsubtypedropdown();
  $data['plan']=$this->healthpackages_model->getplanrdropdown();
$this->load->view("template",$data);
}
public function createhealthpackagessubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("type","type","trim");
$this->form_validation->set_rules("months","months","trim");
$this->form_validation->set_rules("visits","visits","trim");
$this->form_validation->set_rules("plan","plan","trim");
$this->form_validation->set_rules("price_in_INR","price_in_INR","trim");
$this->form_validation->set_rules("price_in_dollars","price_in_dollars","trim");
$this->form_validation->set_rules("description","description","trim");
$this->form_validation->set_rules("title","title","trim");
$this->form_validation->set_rules("subtype","subtype","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="createhealthpackages";
$data["title"]="Create healthpackages";
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$type=$this->input->get_post("type");
if($type=="Weight Loss")
{
	$subtype="";
}
else {
$subtype=$this->input->get_post("subtype");
}
$months=$this->input->get_post("months");
$visits=$this->input->get_post("visits");
$plan=$this->input->get_post("plan");
$price_in_INR=$this->input->get_post("price_in_INR");
$price_in_dollars=$this->input->get_post("price_in_dollars");
$description=$this->input->get_post("description");
$title=$this->input->get_post("title");

if($this->healthpackages_model->create($type,$months,$visits,$plan,$price_in_INR,$price_in_dollars,$description,$title,$subtype)==0)
$data["alerterror"]="New healthpackages could not be created.";
else
$data["alertsuccess"]="healthpackages created Successfully.";
$data["redirect"]="site/viewhealthpackages";
$this->load->view("redirect",$data);
}
}
public function edithealthpackages()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="edithealthpackages";
$data["title"]="Edit healthpackages";
$data[ 'subtype' ] =$this->healthpackages_model->getsubtypedropdown();
$data['plan']=$this->healthpackages_model->getplanrdropdown();
$data["page2"]="block/helthpackageblock";
$data["before1"]=$this->input->get("id");
$data["before2"]=$this->input->get("id");
$data["before"]=$this->healthpackages_model->beforeedit($this->input->get("id"));
$this->load->view("templatewith2",$data);

}
public function edithealthpackagessubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("id","id","trim");
$this->form_validation->set_rules("type","type","trim");
$this->form_validation->set_rules("months","months","trim");
$this->form_validation->set_rules("visits","visits","trim");
$this->form_validation->set_rules("plan","plan","trim");
$this->form_validation->set_rules("price_in_INR","price_in_INR","trim");
$this->form_validation->set_rules("price_in_dollars","price_in_dollars","trim");
$this->form_validation->set_rules("description","description","trim");
$this->form_validation->set_rules("title","title","trim");
$this->form_validation->set_rules("subtype","subtype","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="edithealthpackages";
$data["title"]="Edit healthpackages";
$data["before"]=$this->healthpackages_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$type=$this->input->get_post("type");
$months=$this->input->get_post("months");
$visits=$this->input->get_post("visits");
$plan=$this->input->get_post("plan");
$price_in_INR=$this->input->get_post("price_in_INR");
$price_in_dollars=$this->input->get_post("price_in_dollars");
$description=$this->input->get_post("description");
$title=$this->input->get_post("title");
$subtype=$this->input->get_post("subtype");
if($this->healthpackages_model->edit($id,$type,$months,$visits,$plan,$price_in_INR,$price_in_dollars,$description,$title,$subtype)==0)
$data["alerterror"]="New healthpackages could not be Updated.";
else
$data["alertsuccess"]="healthpackages Updated Successfully.";
$data["redirect"]="site/viewhealthpackages";
$this->load->view("redirect",$data);
}
}
public function deletehealthpackages()
{
$access=array("1");
$this->checkaccess($access);
$this->healthpackages_model->delete($this->input->get("id"));
$data["redirect"]="site/viewhealthpackages";
$this->load->view("redirect",$data);
}


public function viewnews()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewnews";
$data["base_url"]=site_url("site/viewnewsjson");
$data["title"]="View News";
$this->load->view("template",$data);
}
function viewnewsjson()
{
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`news`.`id`";
$elements[0]->sort="1";
$elements[0]->header="id";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`news`.`title`";
$elements[1]->sort="1";
$elements[1]->header="title";
$elements[1]->alias="title";
$elements[2]=new stdClass();
$elements[2]->field="`news`.`image`";
$elements[2]->sort="1";
$elements[2]->header="image";
$elements[2]->alias="image";
$elements[3]=new stdClass();
$elements[3]->field="`news`.`year`";
$elements[3]->sort="1";
$elements[3]->header="year";
$elements[3]->alias="year";
$elements[4]=new stdClass();
$elements[4]->field="`news`.`status`";
$elements[4]->sort="1";
$elements[4]->header="status";
$elements[4]->alias="status";
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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `news`");
$this->load->view("json",$data);
}


public function createnews()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="createnews";
$data["title"]="createnews subtype";
$this->load->view("template",$data);
}
public function createnewssubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("name","name","trim");
$this->form_validation->set_rules("image","image","trim");
$this->form_validation->set_rules("year","year","trim");
$this->form_validation->set_rules("status","status","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="createnews";
$data["title"]="Create News";
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$name=$this->input->get_post("name");
$year=$this->input->get_post("year");
$status=$this->input->get_post("status");
$config['upload_path'] = './uploads/';
$config['allowed_types'] = 'gif|jpg|png|jpeg';
$this->load->library('upload', $config);
$filename="image";
$image="";
if (  $this->upload->do_upload($filename))
{
$uploaddata = $this->upload->data();
$image=$uploaddata['file_name'];

		$config_r['source_image']   = './uploads/' . $uploaddata['file_name'];
		$config_r['maintain_ratio'] = TRUE;
		$config_t['create_thumb'] = FALSE;///add this
		$config_r['width']   = 800;
		$config_r['height'] = 800;
		$config_r['quality']    = 100;
		//end of configs

		$this->load->library('image_lib', $config_r);
		$this->image_lib->initialize($config_r);
		if(!$this->image_lib->resize())
		{
				echo "Failed." . $this->image_lib->display_errors();
				//return false;
		}
		else
		{
				//print_r($this->image_lib->dest_image);
				//dest_image
				$image=$this->image_lib->dest_image;
				//return false;
		}

}

if($this->news_model->create($name,$image,$year,$status)==0)
$data["alerterror"]="New News could not be created.";
else
$data["alertsuccess"]="News created Successfully.";
$data["redirect"]="site/viewnews";
$this->load->view("redirect",$data);

}
}
public function editnews()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="editnews";
$data["title"]="Edit News";
$data["before"]=$this->news_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
public function editnewssubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("id","id","trim");
$this->form_validation->set_rules("name","name","trim");
$this->form_validation->set_rules("image","image","trim");
$this->form_validation->set_rules("year","year","trim");
$this->form_validation->set_rules("status","status","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="editnews";
$data["title"]="Edit News";
$data["before"]=$this->news_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$name=$this->input->get_post("name");
$year=$this->input->get_post("year");
$status=$this->input->get_post("status");
$config['upload_path'] = './uploads/';
 $config['allowed_types'] = 'gif|jpg|png';
 $this->load->library('upload', $config);
 $filename="image";
 $image="";
 if (  $this->upload->do_upload($filename))
 {
	 $uploaddata = $this->upload->data();
	 $image=$uploaddata['file_name'];
 }
if($image=="")
			 {
			 $image=$this->subtype_model->getimagebyid($id);
					// print_r($image);
					 $image=$image->image;
			 }
if($this->news_model->edit($id,$name,$image,$year,$status)==0)
$data["alerterror"]="News could not be Updated.";
else
$data["alertsuccess"]="News Updated Successfully.";
$data["redirect"]="site/viewnews";
$this->load->view("redirect",$data);
}
}
public function deletenews()
{
$access=array("1");
$this->checkaccess($access);
$this->news_model->delete($this->input->get("id"));
$data["redirect"]="site/viewnews";
$this->load->view("redirect",$data);
}



public function viewvideo()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewvideo";
$data["base_url"]=site_url("site/viewvideojson");
$data["title"]="View Video";
$this->load->view("template",$data);
}
function viewvideojson()
{
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`video`.`id`";
$elements[0]->sort="1";
$elements[0]->header="id";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`video`.`name`";
$elements[1]->sort="1";
$elements[1]->header="name";
$elements[1]->alias="name";
$elements[2]=new stdClass();
$elements[2]->field="`video`.`link`";
$elements[2]->sort="1";
$elements[2]->header="link";
$elements[2]->alias="link";
$elements[3]=new stdClass();
$elements[3]->field="`video`.`status`";
$elements[3]->sort="1";
$elements[3]->header="status";
$elements[3]->alias="status";
// $elements[4]=new stdClass();
// $elements[4]->field="`news`.`status`";
// $elements[4]->sort="1";
// $elements[4]->header="status";
// $elements[4]->alias="status";
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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `video`");
$this->load->view("json",$data);
}


public function createvideo()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="createvideo";
$data["title"]="create video";
$this->load->view("template",$data);
}
public function createvideosubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("name","name","trim");
$this->form_validation->set_rules("link","link","trim");
$this->form_validation->set_rules("status","status","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="createvideo";
$data["title"]="Create Video";
$this->load->view("template",$data);
}
else
{
$name=$this->input->get_post("name");
$link=$this->input->get_post("link");
$status=$this->input->get_post("status");

if($this->video_model->create($name,$link,$status)==0)
$data["alerterror"]="Video could not be Updated.";
else
$data["alertsuccess"]="Video Updated Successfully.";
$data["redirect"]="site/viewvideo";
$this->load->view("redirect",$data);
}
}

public function editvideo()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="editvideo";
$data["title"]="Edit Video";
$data["before"]=$this->video_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
public function editvideosubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("id","id","trim");
$this->form_validation->set_rules("name","name","trim");
$this->form_validation->set_rules("link","link","trim");
$this->form_validation->set_rules("status","status","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="editvideo";
$data["title"]="Edit Video";
$data["before"]=$this->video_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$name=$this->input->get_post("name");
$link=$this->input->get_post("link");
$status=$this->input->get_post("status");

if($this->video_model->edit($id,$name,$link,$status)==0)
$data["alerterror"]="Video could not be Updated.";
else
$data["alertsuccess"]="Video Updated Successfully.";
$data["redirect"]="site/viewvideo";
$this->load->view("redirect",$data);
}
}


public function deletevideo()
{
$access=array("1");
$this->checkaccess($access);
$this->video_model->delete($this->input->get("id"));
$data["redirect"]="site/viewvideo";
$this->load->view("redirect",$data);
}







public function viewsubtype()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewsubtype";
$data["base_url"]=site_url("site/viewsubtypejson");
$data["title"]="View subtype";
$this->load->view("template",$data);
}
function viewsubtypejson()
{
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`selftables_subtype`.`id`";
$elements[0]->sort="1";
$elements[0]->header="id";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`selftables_subtype`.`name`";
$elements[1]->sort="1";
$elements[1]->header="name";
$elements[1]->alias="name";
$elements[2]=new stdClass();
$elements[2]->field="`selftables_subtype`.`image`";
$elements[2]->sort="1";
$elements[2]->header="image";
$elements[2]->alias="image";
$elements[3]=new stdClass();
$elements[3]->field="`selftables_subtype`.`order`";
$elements[3]->sort="1";
$elements[3]->header="order";
$elements[3]->alias="order";
$elements[4]=new stdClass();
$elements[4]->field="`selftables_subtype`.`status`";
$elements[4]->sort="1";
$elements[4]->header="status";
$elements[4]->alias="status";
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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `selftables_subtype`");
$this->load->view("json",$data);
}

public function createsubtype()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="createsubtype";
$data["title"]="Create subtype";
$this->load->view("template",$data);
}
public function createsubtypesubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("name","name","trim");
$this->form_validation->set_rules("image","image","trim");
$this->form_validation->set_rules("order","order","trim");
$this->form_validation->set_rules("status","status","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="createsubtype";
$data["title"]="Create subtype";
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$name=$this->input->get_post("name");
$description=$this->input->get_post("description");
$order=$this->input->get_post("order");
$status=$this->input->get_post("status");
$config['upload_path'] = './uploads/';
$config['allowed_types'] = 'gif|jpg|png|jpeg';
$this->load->library('upload', $config);
$filename="image";
$image="";
if (  $this->upload->do_upload($filename))
{
$uploaddata = $this->upload->data();
$image=$uploaddata['file_name'];

		$config_r['source_image']   = './uploads/' . $uploaddata['file_name'];
		$config_r['maintain_ratio'] = TRUE;
		$config_t['create_thumb'] = FALSE;///add this
		$config_r['width']   = 800;
		$config_r['height'] = 800;
		$config_r['quality']    = 100;
		//end of configs

		$this->load->library('image_lib', $config_r);
		$this->image_lib->initialize($config_r);
		if(!$this->image_lib->resize())
		{
				echo "Failed." . $this->image_lib->display_errors();
				//return false;
		}
		else
		{
				//print_r($this->image_lib->dest_image);
				//dest_image
				$image=$this->image_lib->dest_image;
				//return false;
		}

}

if($this->subtype_model->create($name,$description,$image,$order,$status)==0)
$data["alerterror"]="New subtype could not be created.";
else
$data["alertsuccess"]="subtype created Successfully.";
$data["redirect"]="site/viewsubtype";
$this->load->view("redirect",$data);
}
}
public function editsubtype()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="editsubtype";
$data["title"]="Edit subtype";
$data["before"]=$this->subtype_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
public function editsubtypesubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("id","id","trim");
$this->form_validation->set_rules("name","name","trim");
$this->form_validation->set_rules("image","image","trim");
$this->form_validation->set_rules("order","order","trim");
$this->form_validation->set_rules("status","status","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="editsubtype";
$data["title"]="Edit subtype";
$data["before"]=$this->subtype_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$name=$this->input->get_post("name");
$description=$this->input->get_post("description");
$order=$this->input->get_post("order");
$status=$this->input->get_post("status");
$config['upload_path'] = './uploads/';
 $config['allowed_types'] = 'gif|jpg|png';
 $this->load->library('upload', $config);
 $filename="image";
 $image="";
 if (  $this->upload->do_upload($filename))
 {
	 $uploaddata = $this->upload->data();
	 $image=$uploaddata['file_name'];
 }
if($image=="")
			 {
			 $image=$this->subtype_model->getimagebyid($id);
					// print_r($image);
					 $image=$image->image;
			 }
if($this->subtype_model->edit($id,$name,$description,$image,$order,$status)==0)
$data["alerterror"]="New subtype could not be Updated.";
else
$data["alertsuccess"]="subtype Updated Successfully.";
$data["redirect"]="site/viewsubtype";
$this->load->view("redirect",$data);
}
}
public function deletesubtype()
{
$access=array("1");
$this->checkaccess($access);
$this->subtype_model->delete($this->input->get("id"));
$data["redirect"]="site/viewsubtype";
$this->load->view("redirect",$data);
}
public function viewblog()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewblog";
$data["base_url"]=site_url("site/viewblogjson");
$data["title"]="View blog";
$this->load->view("template",$data);
}
function viewblogjson()
{
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`selftables_blog`.`id`";
$elements[0]->sort="1";
$elements[0]->header="id";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`selftables_blog`.`name`";
$elements[1]->sort="1";
$elements[1]->header="name";
$elements[1]->alias="name";
$elements[2]=new stdClass();
$elements[2]->field="`selftables_blog`.`description`";
$elements[2]->sort="1";
$elements[2]->header="description";
$elements[2]->alias="description";
$elements[3]=new stdClass();
$elements[3]->field="`selftables_blog`.`posted_by`";
$elements[3]->sort="1";
$elements[3]->header="posted_by";
$elements[3]->alias="posted_by";
$elements[4]=new stdClass();
$elements[4]->field="`selftables_blog`.`dateofposting`";
$elements[4]->sort="1";
$elements[4]->header="dateofposting";
$elements[4]->alias="dateofposting";
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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `selftables_blog`");
$this->load->view("json",$data);
}

public function createblog()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="createblog";
$data["title"]="Create blog";
  $data['tag']=$this->tags_model->gettagdropdown();
$this->load->view("template",$data);
}
public function createblogsubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("name","name","trim", "required");
$this->form_validation->set_rules("description","description","trim", "required");
$this->form_validation->set_rules("image","image","trim", "required");
$this->form_validation->set_rules("posted_by","posted_by","trim", "required");
$this->form_validation->set_rules("dateofposting","dateofposting","trim", "required");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="createblog";
$data["title"]="Create blog";
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$name=$this->input->get_post("name");
$description=$this->input->get_post("description");
$posted_by=$this->input->get_post("posted_by");
$dateofposting=$this->input->get_post("dateofposting");
$tags=$this->input->get_post("tag");
$config['upload_path'] = './uploads/';
$config['allowed_types'] = 'gif|jpg|png|jpeg';
$this->load->library('upload', $config);
$filename="image";
$image="";
if (  $this->upload->do_upload($filename))
{
$uploaddata = $this->upload->data();
$image=$uploaddata['file_name'];

		$config_r['source_image']   = './uploads/' . $uploaddata['file_name'];
		$config_r['maintain_ratio'] = TRUE;
		$config_t['create_thumb'] = FALSE;///add this
		$config_r['width']   = 800;
		$config_r['height'] = 800;
		$config_r['quality']    = 100;
		//end of configs

		$this->load->library('image_lib', $config_r);
		$this->image_lib->initialize($config_r);
		if(!$this->image_lib->resize())
		{
				echo "Failed." . $this->image_lib->display_errors();
				//return false;
		}
		else
		{
				//print_r($this->image_lib->dest_image);
				//dest_image
				$image=$this->image_lib->dest_image;
				//return false;
		}

}
if($this->blog_model->create($name,$image,$description,$posted_by,$dateofposting,$tags)==0)
$data["alerterror"]="New blog could not be created.";
else
$data["alertsuccess"]="blog created Successfully.";
$data["redirect"]="site/viewblog";
$this->load->view("redirect",$data);
}
}
public function editblog()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="editblog";
$data["page2"]="block/blogblock";
$data["before1"]=$this->input->get('id');
$data["before2"]=$this->input->get('id');
$data["title"]="Edit blog";

$data['tag']=$this->tags_model->gettagdropdown();
$data["before"]=$this->blog_model->beforeedit($this->input->get("id"));
// $this->load->view("template",$data);
$this->load->view("templatewith2",$data);
}
public function editblogsubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("id","id","trim");
$this->form_validation->set_rules("name","name","trim");
$this->form_validation->set_rules("description","description","trim");
$this->form_validation->set_rules("posted_by","posted_by","trim");
$this->form_validation->set_rules("dateofposting","dateofposting","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="editblog";
$data["title"]="Edit blog";
$data["before"]=$this->blog_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$name=$this->input->get_post("name");
$description=$this->input->get_post("description");
$posted_by=$this->input->get_post("posted_by");
$dateofposting=$this->input->get_post("dateofposting");
$config['upload_path'] = './uploads/';
 $config['allowed_types'] = 'gif|jpg|png';
 $this->load->library('upload', $config);
 $filename="image";
 $image="";
 if (  $this->upload->do_upload($filename))
 {
	 $uploaddata = $this->upload->data();
	 $image=$uploaddata['file_name'];
 }
if($image=="")
			 {
			 $image=$this->subtype_model->getimagebyid($id);
					// print_r($image);
					 $image=$image->image;
			 }
if($this->blog_model->edit($id,$name,$image,$description,$posted_by,$dateofposting)==0)
$data["alerterror"]="New blog could not be Updated.";
else
$data["alertsuccess"]="blog Updated Successfully.";
$data["redirect"]="site/viewblog";
$this->load->view("redirect",$data);
}
}
public function deleteblog()
{
$access=array("1");
$this->checkaccess($access);
$this->blog_model->delete($this->input->get("id"));
$data["redirect"]="site/viewblog";
$this->load->view("redirect",$data);
}
public function viewcomment()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewcomment";
$data["base_url"]=site_url("site/viewcommentjson");
$data["title"]="View comment";
$this->load->view("template",$data);
}
function viewcommentjson()
{
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`selftables_comment`.`id`";
$elements[0]->sort="1";
$elements[0]->header="id";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`selftables_comment`.`name`";
$elements[1]->sort="1";
$elements[1]->header="name";
$elements[1]->alias="name";
$elements[2]=new stdClass();
$elements[2]->field="`selftables_comment`.`email`";
$elements[2]->sort="1";
$elements[2]->header="email";
$elements[2]->alias="email";
$elements[3]=new stdClass();
$elements[3]->field="`selftables_comment`.`website`";
$elements[3]->sort="1";
$elements[3]->header="website";
$elements[3]->alias="website";
$elements[4]=new stdClass();
$elements[4]->field="`selftables_comment`.`comment`";
$elements[4]->sort="1";
$elements[4]->header="comment";
$elements[4]->alias="comment";
$elements[5]=new stdClass();
$elements[5]->field="`selftables_comment`.`blog`";
$elements[5]->sort="1";
$elements[5]->header="blog";
$elements[5]->alias="blog";
$elements[6]=new stdClass();
$elements[6]->field="`selftables_comment`.`timestamp`";
$elements[6]->sort="1";
$elements[6]->header="timestamp";
$elements[6]->alias="timestamp";
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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `selftables_comment`");
$this->load->view("json",$data);
}

public function createcomment()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="createcomment";
$data["title"]="Create comment";
$this->load->view("template",$data);
}
public function createcommentsubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("name","name","trim");
$this->form_validation->set_rules("email","email","trim");
$this->form_validation->set_rules("website","website","trim");
$this->form_validation->set_rules("comment","comment","trim");
$this->form_validation->set_rules("blog","blog","trim");
$this->form_validation->set_rules("timestamp","timestamp","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="createcomment";
$data["title"]="Create comment";
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$name=$this->input->get_post("name");
$email=$this->input->get_post("email");
$website=$this->input->get_post("website");
$comment=$this->input->get_post("comment");
$blog=$this->input->get_post("blog");
if($this->comment_model->create($name,$email,$website,$comment,$blog,$timestamp)==0)
$data["alerterror"]="New comment could not be created.";
else
$data["alertsuccess"]="comment created Successfully.";
$data["redirect"]="site/viewcomment";
$this->load->view("redirect",$data);
}
}
public function editcomment()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="editcomment";
$data["title"]="Edit comment";
$data["before"]=$this->comment_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
public function editcommentsubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("id","id","trim");
$this->form_validation->set_rules("name","name","trim");
$this->form_validation->set_rules("email","email","trim");
$this->form_validation->set_rules("website","website","trim");
$this->form_validation->set_rules("comment","comment","trim");
$this->form_validation->set_rules("blog","blog","trim");
$this->form_validation->set_rules("timestamp","timestamp","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="editcomment";
$data["title"]="Edit comment";
$data["before"]=$this->comment_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$name=$this->input->get_post("name");
$email=$this->input->get_post("email");
$website=$this->input->get_post("website");
$comment=$this->input->get_post("comment");
$blog=$this->input->get_post("blog");
$timestamp=$this->input->get_post("timestamp");
if($this->comment_model->edit($id,$name,$email,$website,$comment,$blog,$timestamp)==0)
$data["alerterror"]="New comment could not be Updated.";
else
$data["alertsuccess"]="comment Updated Successfully.";
$data["redirect"]="site/viewcomment";
$this->load->view("redirect",$data);
}
}
public function deletecomment()
{
$access=array("1");
$this->checkaccess($access);
$this->comment_model->delete($this->input->get("id"));
$data["redirect"]="site/viewcomment";
$this->load->view("redirect",$data);
}
public function viewrelatedblog()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewrelatedblog";
$data["page2"]="block/blogblock";
$data["before1"]=$this->input->get('id');
$data["before2"]=$this->input->get('id');
$data["base_url"]=site_url("site/viewrelatedblogjson?id=").$this->input->get('id');
$data["title"]="View productimage";
$this->load->view("templatewith2",$data);
}
function viewrelatedblogjson()
{
$id=$this->input->get('id');

$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`selftables_realtedblog`.`id`";
$elements[0]->sort="1";
$elements[0]->header="id";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`selftables_realtedblog`.`relatedblog`";
$elements[1]->sort="1";
$elements[1]->header="relatedblog";
$elements[1]->alias="relatedblog";

$elements[2]=new stdClass();
$elements[2]->field="`selftables_blog`.`name`";
$elements[2]->sort="1";
$elements[2]->header="name";
$elements[2]->alias="name";

$elements[3]=new stdClass();
$elements[3]->field="`selftables_realtedblog`.`blog`";
$elements[3]->sort="1";
$elements[3]->header="productid";
$elements[3]->alias="productid";
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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `selftables_realtedblog` LEFT OUTER JOIN `selftables_blog` on `selftables_realtedblog`.`relatedblog` =`selftables_blog`.`id`","WHERE `selftables_realtedblog`.`blog`='$id'");
$this->load->view("json",$data);
}

public function createrealtedblog()
{
$access=array("1");
$this->checkaccess($access);

$data["page"]="createrealtedblog";
$data["page2"]="block/blogblock";
$data["title"]="Create realtedblog";
$data["before1"]=$this->input->get("id");
$data["before2"]=$this->input->get("id");
$data['blog']=$this->realtedblog_model->getblogdropdown();
$data['relatedblog']=$this->realtedblog_model->getblogdropdown();
$this->load->view("templatewith2",$data);

}
public function createrealtedblogsubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("blog","blog","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="createrealtedblog";
$data["title"]="Create realtedblog";
$this->load->view("template",$data);
}
else
{
$relatedblog=$this->input->get_post("relatedblog");
$blog=$this->input->get_post("blog");
if($this->realtedblog_model->create($relatedblog,$blog)==0)
$data["alerterror"]="New realtedblog could not be created.";
else
$data["alertsuccess"]="realtedblog created Successfully.";
$data["redirect"]="site/viewrelatedblog";
$this->load->view("redirect",$data);
}
}
public function editrealtedblog()
{
$access=array("1");
$this->checkaccess($access);
$data['blog']=$this->realtedblog_model->getblogdropdown();
$data['relatedblog']=$this->realtedblog_model->getblogdropdown();
$data["page"]="editrealtedblog";
$data["page2"]="block/blogblock";
$data["title"]="Edit realtedblog";
$data["before"]=$this->realtedblog_model->beforeedit($this->input->get("id"));
$data["before1"]=$this->input->get("id");
$data["before2"]=$this->input->get("id");
$this->load->view("templatewith2",$data);

}
public function editrealtedblogsubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("id","id","trim");
$this->form_validation->set_rules("relatedblog","relatedblog","trim");
$this->form_validation->set_rules("blog","blog","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data['blog']=$this->realtedblog_model->getblogdropdown();
$data['relatedblog']=$this->realtedblog_model->getblogdropdown();
$data["page"]="editrealtedblog";
$data["title"]="Edit realtedblog";
$data["before"]=$this->realtedblog_model->beforeedit($this->input->get("id"));
$this->load->view("templatewith2",$data);
}
else
{
$id=$this->input->get_post("id");
$relatedblog=$this->input->get_post("relatedblog");
$blog=$this->input->get_post("blog");
if($this->realtedblog_model->edit($id,$relatedblog,$blog)==0)
$data["alerterror"]="New realtedblog could not be Updated.";
else
$data["alertsuccess"]="realtedblog Updated Successfully.";
$data["redirect"]="site/viewrelatedblog?id=".$blog;
$this->load->view("redirect",$data);
}
}
public function deleterealtedblog()
{
$access=array("1");
$this->checkaccess($access);
$this->realtedblog_model->delete($this->input->get("id"));
$data["redirect"]="site/viewrelatedblog?id=".$this->input->get("productid");
$this->load->view("redirect",$data);
}


public function viewplan()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewplan";
$data["page2"]="block/helthpackageblock";
$data["before1"]=$this->input->get('id');
$data["before2"]=$this->input->get('id');
$data["base_url"]=site_url("site/viewplanjson?id=").$this->input->get('id');
$data["title"]="View productimage";
$this->load->view("templatewith2",$data);
}
function viewplanjson()
{
$id= $this->input->get("id");
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`plans`.`id`";
$elements[0]->sort="1";
$elements[0]->header="id";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`plans`.`plan`";
$elements[1]->sort="1";
$elements[1]->header="plan";
$elements[1]->alias="plan";

$elements[2]=new stdClass();
$elements[2]->field="`plans`.`title`";
$elements[2]->sort="1";
$elements[2]->header="title";
$elements[2]->alias="title";

$elements[3]=new stdClass();
$elements[3]->field="`plans`.`price_in_INR`";
$elements[3]->sort="1";
$elements[3]->header="price_in_INR";
$elements[3]->alias="price_in_INR";

$elements[4]=new stdClass();
$elements[4]->field="`plans`.`price_in_dollars`";
$elements[4]->sort="1";
$elements[4]->header="price_in_dollars";
$elements[4]->alias="price_in_dollars";


$elements[5]=new stdClass();
$elements[5]->field="`plans`.`packageid`";
$elements[5]->sort="1";
$elements[5]->header="packageid";
$elements[5]->alias="packageid";
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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `plans` LEFT OUTER JOIN `selftables_healthpackages` on `plans`.`packageid` =`selftables_healthpackages`.`id`","WHERE `plans`.`packageid`='$id'");
$this->load->view("json",$data);
}

public function createplan()
{
$access=array("1");
$this->checkaccess($access);

$data["page"]="createplan";
$data["page2"]="block/helthpackageblock";
$data["title"]="Create Plan";
$data["before1"]=$this->input->get("id");
$data["before2"]=$this->input->get("id");
  $data['plan']=$this->healthpackages_model->getplanrdropdown();
// $data['plan']=$this->healthpackages_model->getplandropdown();
$this->load->view("templatewith2",$data);

}
public function createplansubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("plan","plan","trim");
$this->form_validation->set_rules("price_in_INR","price_in_INR","trim");
$this->form_validation->set_rules("price_in_dollars","price_in_dollars","trim");
$this->form_validation->set_rules("description","description","trim");
$this->form_validation->set_rules("title","title","trim");
$this->form_validation->set_rules("subtype","subtype","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="createplan";
$data["title"]="Create Plan";
$this->load->view("template",$data);
}
else
{

		$id=$this->input->get_post("id");
	$plan=$this->input->get_post("plan");
	$price_in_INR=$this->input->get_post("price_in_INR");
	$price_in_dollars=$this->input->get_post("price_in_dollars");
	$description=$this->input->get_post("description");
	$title=$this->input->get_post("title");
if($this->plans_model->create($plan,$price_in_INR,$price_in_dollars,$description,$title,$id)==0)
$data["alerterror"]="New Plan could not be created.";
else
$data["alertsuccess"]="Plan created Successfully.";
$data["redirect"]="site/viewplan?id=".$id;
$this->load->view("redirect2",$data);
}
}
public function editplan()
{
$access=array("1");
$this->checkaccess($access);
//$data['plan']=$this->healthpackages_model->getplandropdown();
$data["page"]="editplan";
$data["page2"]="block/helthpackageblock";
$data["title"]="Edit Plan";
$data["before"]=$this->plans_model->beforeedit($this->input->get("id"));
$data["before1"]=$this->input->get("packageid");
$data["before2"]=$this->input->get("packageid");
  $data['plan']=$this->healthpackages_model->getplanrdropdown();
$this->load->view("templatewith2",$data);

}
public function editplansubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("plan","plan","trim");
$this->form_validation->set_rules("price_in_INR","price_in_INR","trim");
$this->form_validation->set_rules("price_in_dollars","price_in_dollars","trim");
$this->form_validation->set_rules("description","description","trim");
$this->form_validation->set_rules("title","title","trim");
$this->form_validation->set_rules("subtype","subtype","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data['blog']=$this->realtedblog_model->getblogdropdown();
$data['relatedblog']=$this->realtedblog_model->getblogdropdown();
$data["page"]="editplan";
$data["title"]="Edit realtedblog";
$data["before"]=$this->plans_model->beforeedit($this->input->get("id"));
$this->load->view("templatewith2",$data);
}
else
{
	$id=$this->input->get_post("id");
		$pid=$this->input->get_post("pid");
$plan=$this->input->get_post("plan");
$price_in_INR=$this->input->get_post("price_in_INR");
$price_in_dollars=$this->input->get_post("price_in_dollars");
$description=$this->input->get_post("description");
$title=$this->input->get_post("title");
if($this->plans_model->edit($plan,$price_in_INR,$price_in_dollars,$description,$title,$id,$pid)==0)
$data["alerterror"]="New Plan could not be Updated.";
else
$data["alertsuccess"]="Plan Updated Successfully.";
$data["redirect"]="site/viewplan?id=".$pid;
$this->load->view("redirect2",$data);
}
}
public function deleteplan()
{
$access=array("1");
$this->checkaccess($access);
$this->plans_model->delete($this->input->get("id"));
$data["redirect"]="site/viewplan?id=".$this->input->get("packageid");
$this->load->view("redirect2",$data);

}

public function viewtags()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewtags";
$data["base_url"]=site_url("site/viewtagsjson");
$data["title"]="View tags";
$this->load->view("template",$data);
}
function viewtagsjson()
{
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`tags`.`id`";
$elements[0]->sort="1";
$elements[0]->header="id";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`tags`.`name`";
$elements[1]->sort="1";
$elements[1]->header="name";
$elements[1]->alias="name";
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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `tags`");
$this->load->view("json",$data);
}

public function createtags()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="createtags";
$data["title"]="Create tags";
$this->load->view("template",$data);
}
public function createtagssubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("name","name","trim|required|min_length[4]");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="createtags";
$data["title"]="Create tags";
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$name=$this->input->get_post("name");
if($this->tags_model->create($name)==0)
$data["alerterror"]="New tags could not be created.";
else
$data["alertsuccess"]="tags created Successfully.";
$data["redirect"]="site/viewtags";
$this->load->view("redirect",$data);
}
}
public function edittags()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="edittags";
$data["title"]="Edit tags";
$data["before"]=$this->tags_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
public function edittagssubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("id","id","trim");
$this->form_validation->set_rules("name","name","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="edittags";
$data["title"]="Edit tags";
$data["before"]=$this->tags_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$name=$this->input->get_post("name");
if($this->tags_model->edit($id,$name)==0)
$data["alerterror"]="New tags could not be Updated.";
else
$data["alertsuccess"]="tags Updated Successfully.";
$data["redirect"]="site/viewtags";
$this->load->view("redirect",$data);
}
}
public function deletetags()
{
$access=array("1");
$this->checkaccess($access);
$this->tags_model->delete($this->input->get("id"));
$data["redirect"]="site/viewtags";
$this->load->view("redirect",$data);
}


public function viewimagepull()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewimagepull";
$data["base_url"]=site_url("site/viewimagepulljson");
$data["title"]="View Image";
$this->load->view("template",$data);
}
function viewimagepulljson()
{
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`imagepull`.`id`";
$elements[0]->sort="1";
$elements[0]->header="id";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`imagepull`.`image`";
$elements[1]->sort="1";
$elements[1]->header="image";
$elements[1]->alias="image";

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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `imagepull`");
$this->load->view("json",$data);
}

public function createimagepull()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="createimagepull";
$data["title"]="Create Iamge";
$this->load->view("template",$data);
}
public function createimagepullsubmit()
{
$access=array("1");
$this->checkaccess($access);

$id=$this->input->get_post("id");
$config['upload_path'] = './uploads/';
$config['allowed_types'] = 'gif|jpg|png|jpeg';
$this->load->library('upload', $config);
$filename="image";
$image="";
if (  $this->upload->do_upload($filename))
{
$uploaddata = $this->upload->data();
$image=$uploaddata['file_name'];

		$config_r['source_image']   = './uploads/' . $uploaddata['file_name'];
		$config_r['maintain_ratio'] = TRUE;
		$config_t['create_thumb'] = FALSE;///add this
		$config_r['width']   = 800;
		$config_r['height'] = 800;
		$config_r['quality']    = 100;
		//end of configs

		$this->load->library('image_lib', $config_r);
		$this->image_lib->initialize($config_r);
		if(!$this->image_lib->resize())
		{
				echo "Failed." . $this->image_lib->display_errors();
				//return false;
		}
		else
		{
				//print_r($this->image_lib->dest_image);
				//dest_image
				$image=$this->image_lib->dest_image;
				//return false;
		}

}
echo 'test';
if($this->imagepull_model->create($image)==0)
$data["alerterror"]="New Image could not be created.";
else
$data["alertsuccess"]="Image created Successfully.";
$data["redirect"]="site/viewimagepull";
$this->load->view("redirect",$data);

}
public function editimagepull()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="editimagepull";
$data["title"]="Edit Image";
$data["before"]=$this->imagepull_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
public function editimagepullsubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("image","image","trim");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="editimagepull";
$data["title"]="Edit Image";
$data["before"]=$this->imagepull_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
$id=$this->input->get_post("id");
$config['upload_path'] = './uploads/';
 $config['allowed_types'] = 'gif|jpg|png';
 $this->load->library('upload', $config);
 $filename="image";
 $image="";
 if (  $this->upload->do_upload($filename))
 {
	 $uploaddata = $this->upload->data();
	 $image=$uploaddata['file_name'];
 }
if($image=="")
			 {
			 $image=$this->subtype_model->getimagebyid($id);
					// print_r($image);
					 $image=$image->image;
			 }
if($this->imagepull_model->edit($id,$image)==0)
$data["alerterror"]="New Image could not be Updated.";
else
$data["alertsuccess"]="Image Updated Successfully.";
$data["redirect"]="site/viewimagepull";
$this->load->view("redirect",$data);
}
}
public function deleteimagepull()
{
$access=array("1");
$this->checkaccess($access);
$this->imagepull_model->delete($this->input->get("id"));
$data["redirect"]="site/viewimagepull";
$this->load->view("redirect",$data);
}
public function viewrecipes()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="viewrecipes";
$data["base_url"]=site_url("site/viewrecipesjson");
$data["title"]="View Recipes";
$this->load->view("template",$data);
}
function viewrecipesjson()
{
$elements=array();
$elements[0]=new stdClass();
$elements[0]->field="`recipes`.`id`";
$elements[0]->sort="1";
$elements[0]->header="ID";
$elements[0]->alias="id";
$elements[1]=new stdClass();
$elements[1]->field="`recipes`.`name`";
$elements[1]->sort="1";
$elements[1]->header="name";
$elements[1]->alias="name";
$elements[2]=new stdClass();
$elements[2]->field="`recipes`.`description`";
$elements[2]->sort="1";
$elements[2]->header="description";
$elements[2]->alias="description";
$elements[3]=new stdClass();
$elements[3]->field="`recipes`.`ingredients`";
$elements[3]->sort="1";
$elements[3]->header="ingredients";
$elements[3]->alias="ingredients";
$elements[4]=new stdClass();
$elements[4]->field="`recipes`.`method`";
$elements[4]->sort="1";
$elements[4]->header="method";
$elements[4]->alias="method";
$elements[5]=new stdClass();
$elements[5]->field="`recipes`.`valueperserve`";
$elements[5]->sort="1";
$elements[5]->header="valueperserve";
$elements[5]->alias="valueperserve";
$elements[6]=new stdClass();
$elements[6]->field="`recipes`.`image`";
$elements[6]->sort="1";
$elements[6]->header="Image";
$elements[6]->alias="image";
$elements[7]=new stdClass();
$elements[7]->field="`recipes`.`image`";
$elements[7]->sort="1";
$elements[7]->header="Image";
$elements[7]->alias="image";
$elements[8]=new stdClass();
$elements[8]->field="`recipes`.`status`";
$elements[8]->sort="1";
$elements[8]->header="status";
$elements[8]->alias="status";
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
$data["message"]=$this->chintantable->query($pageno,$maxrow,$orderby,$orderorder,$search,$elements,"FROM `recipes`");
$this->load->view("json",$data);
}
public function createrecipes()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="createrecipes";
   $data['status']=$this->user_model->getstatusdropdown();
$data["title"]="Create Recipes";
$this->load->view("template",$data);
}
public function createrecipessubmit()
{
$access=array("1");
$this->checkaccess($access);
$this->form_validation->set_rules("name","Name","trim");
$this->form_validation->set_rules("description","description","trim");
$this->form_validation->set_rules("ingredients","ingredients","trim");
$this->form_validation->set_rules("method","method","trim");
$this->form_validation->set_rules("valueperserve","valueperserve","trim");
$this->form_validation->set_rules("status","Status","trim");
$this->form_validation->set_rules("image1","Image1","trim");

if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="createrecipes";
   $data['status']=$this->user_model->getstatusdropdown();
$data["title"]="Create Recipes";
$this->load->view("template",$data);
}
else
{
$name=$this->input->get_post("name");
$status=$this->input->get_post("status");
$description=$this->input->get_post("description");
$ingredients=$this->input->get_post("ingredients");
$method=$this->input->get_post("method");
$valueperserve=$this->input->get_post("valueperserve");

    $config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|png';
			$this->load->library('upload', $config);
			$filename="image1";
			$image1="";
			if (  $this->upload->do_upload($filename))
			{
				$uploaddata = $this->upload->data();
				$image1=$uploaddata['file_name'];
			}

if($this->recipes_model->create($name,$description,$ingredients,$method,$valueperserve,$status,$image1)==0)
$data["alerterror"]="New Recipe could not be created.";
else
$data["alertsuccess"]="Recipe created Successfully.";
$data["redirect"]="site/viewrecipes";
$this->load->view("redirect",$data);
}
}
public function editrecipes()
{
$access=array("1");
$this->checkaccess($access);
$data["page"]="editrecipes";
$data["title"]="Edit Recipe";
   $data['status']=$this->user_model->getstatusdropdown();
$data["before"]=$this->recipes_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
public function editrecipessubmit()
{
$access=array("1");
$this->checkaccess($access);
$name=$this->input->get_post("name");
$status=$this->input->get_post("status");
$description=$this->input->get_post("description");
$ingredients=$this->input->get_post("ingredients");
$method=$this->input->get_post("method");
$valueperserve=$this->input->get_post("valueperserve");
if($this->form_validation->run()==FALSE)
{
$data["alerterror"]=validation_errors();
$data["page"]="editrecipes";
   $data['status']=$this->user_model->getstatusdropdown();
$data["title"]="Edit Recipe";
$data["before"]=$this->recipes_model->beforeedit($this->input->get("id"));
$this->load->view("template",$data);
}
else
{
	echo "start";
$id=$this->input->get_post("id");
$order=$this->input->get_post("order");
$name=$this->input->get_post("name");
$parent=$this->input->get_post("parent");
$status=$this->input->get_post("status");
$description=$this->input->get_post("description");

$config['upload_path'] = './uploads/';
 $config['allowed_types'] = 'gif|jpg|png';
 $this->load->library('upload', $config);
 $filename="image1";
 $image1="";
 if (  $this->upload->do_upload($filename))
 {
	 $uploaddata = $this->upload->data();
	 $image1=$uploaddata['file_name'];
 }
if($image1=="")
			 {
			 $image1=$this->product_model->getimage1byid($id);
					// print_r($image);
					 $image1=$image1->image1;
			 }
echo "print data";
if($this->recipes_model->edit($name,$description,$ingredients,$method,$valueperserve,$status,$image1)==0)
$data["alerterror"]="New Recipe could not be Updated.";
else
$data["alertsuccess"]="Recipe Updated Successfully.";
// $data["redirect"]="site/viewrecipes";
// $this->load->view("redirect",$data);
}
}
public function deleterecipes()
{
$access=array("1");
$this->checkaccess($access);
$this->recipes_model->delete($this->input->get("id"));
$data["redirect"]="site/viewrecipes";
$this->load->view("redirect",$data);
}


}
?>
