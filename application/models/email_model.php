<?php
if ( !defined( 'BASEPATH' ) )
	exit( 'No direct script access allowed' );
class email_model extends CI_Model
{
  public function emailer($htmltext,$subject,$toemail,$toname)
  {
  $url = 'https://api.sendgrid.com/';
  $user = 'sohanwohlig';
  $pass = 'wohlig123';
  $request =  $url.'api/mail.send.json';

  $json_string = array(

    'to' => array(
      $toemail
    ),
    'category' => 'test_category'
  );

  $params = array(
     'api_user'  => $user,
     'api_key'   => $pass,
     'x-smtpapi' => json_encode($json_string),
     'to'        => $toemail,
     'subject'   => $subject,
     'html'      => $htmltext,
     'text'      => 'test',
     'from'      => 'info@selfcareindia.com',
   );
  $session = curl_init($request);
  // Tell curl to use HTTP POST
  curl_setopt ($session, CURLOPT_POST, true);
  // Tell curl that this is the body of the POST
  curl_setopt ($session, CURLOPT_POSTFIELDS, $params);
  // Tell curl not to return headers, but do return the response
  curl_setopt($session, CURLOPT_HEADER, false);
  // Tell PHP not to use SSLv3 (instead opting for TLS)
  curl_setopt($session, CURLOPT_SSLVERSION, CURL_SSLVERSION_TLSv1_2);
  curl_setopt($session, CURLOPT_RETURNTRANSFER, true);

  // obtain response
  $response = curl_exec($session);
  curl_close($session);

  // print everything out
  // print_r($response);
  }

}
?>
