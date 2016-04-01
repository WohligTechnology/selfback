<?php
if ( !defined( 'BASEPATH' ) )
	exit( 'No direct script access allowed' );
class email_model extends CI_Model
{
  public function emailer($htmltext,$subject,$toemail,$toname)
  {
        $query=$this->db->query("SELECT * FROM `emailer`")->row();
        $username=$query->username;
        $password=$query->password;
        $url = 'https://api.sendgrid.com/';
        $user = $username;
        $pass = $password;

        $params = array(
            'api_user'  => $user,
            'api_key'   => $pass,
            'to'        => $toemail,
            'subject'   => $subject,
            'html'      => $htmltext,
            'text'      => 'SelfCare India',
            'from'      => 'info@selfcareindia.com',
          );

        $request =  $url.'api/mail.send.json';

        // Generate curl request
        $session = curl_init($request);
        // Tell curl to use HTTP POST
        curl_setopt ($session, CURLOPT_POST, true);
        // Tell curl that this is the body of the POST
        curl_setopt ($session, CURLOPT_POSTFIELDS, $params);
        // Tell curl not to return headers, but do return the response
        curl_setopt($session, CURLOPT_HEADER, false);
        // Tell PHP not to use SSLv3 (instead opting for TLS)
        //curl_setopt($session, CURLOPT_SSLVERSION, CURL_SSLVERSION_TLSv1_2);

        //Turn off SSL
        curl_setopt($session, CURLOPT_SSL_VERIFYPEER, false);//New line
        curl_setopt($session, CURLOPT_SSL_VERIFYHOST, false);//New line

        curl_setopt($session, CURLOPT_RETURNTRANSFER, true);

        // obtain response
        $response = curl_exec($session);

        // print everything out
        ////var_dump($response,curl_error($session),curl_getinfo($session));
        //print_r($response);
        curl_close($session);
  }

}
?>
