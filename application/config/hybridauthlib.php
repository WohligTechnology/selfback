<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/*!
* HybridAuth
* http://hybridauth.sourceforge.net | http://github.com/hybridauth/hybridauth
* (c) 2009-2012, HybridAuth authors | http://hybridauth.sourceforge.net/licenses.html
*/

// ----------------------------------------------------------------------------------------
//	HybridAuth Config file: http://hybridauth.sourceforge.net/userguide/Configuration.html
// ----------------------------------------------------------------------------------------

$config =
	array(
		// set on "base_url" the relative url that point to HybridAuth Endpoint
		'base_url' => '/hauth/endpoint',

		"providers" => array (
			// openid providers
			"OpenID" => array (
				"enabled" => false
			),

			"Yahoo" => array (
				"enabled" => false,
				"keys"    => array ( "id" => "", "secret" => "" ),
			),

			"AOL"  => array (
				"enabled" => false
			),

			"Google" => array (
				"enabled" => true,
				"keys"    => array ( "id" => "370897659244-f295cv4j5ubq5gevq3u8ekaia16t1tni.apps.googleusercontent.com", "secret" => "1OAR31LoxQfL3B1CjCl-Hn-e" )

			),

			"Facebook" => array (
				"enabled" => true,
				"keys"    => array ( "id" => "1232346963455576", "secret" => "d84c7fcebc91a6ab90059544728d2eeb" ),
                "scope"   => "email, user_about_me, user_birthday, user_hometown, user_website,publish_actions"
			),

			"Twitter" => array (
				"enabled" => true,
				"keys"    => array ( "key" => "gCWlQBLeYdOis9t9UHOcHtjpe", "secret" => "M8dKFtM893fJMBmTt0xUxWgWn0v0dEWzuqYY9QK4KkUXxbu1I1" )
			),

			// windows live
			"Live" => array (
				"enabled" => false,
				"keys"    => array ( "id" => "", "secret" => "" )
			),

			"MySpace" => array (
				"enabled" => false,
				"keys"    => array ( "key" => "", "secret" => "" )
			),

			"LinkedIn" => array (
				"enabled" => false,
				"keys"    => array ( "key" => "", "secret" => "" )
			),

			"Foursquare" => array (
				"enabled" => false,
				"keys"    => array ( "id" => "", "secret" => "" )
			),
		),

		// if you want to enable logging, set 'debug_mode' to true  then provide a writable file by the web server on "debug_file"
		"debug_mode" => false,

		"debug_file" => APPPATH.'/logs/hybridauth.log',
	);


/* End of file hybridauthlib.php */
/* Location: ./application/config/hybridauthlib.php */
