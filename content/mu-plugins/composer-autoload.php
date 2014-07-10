<?php
/*
 Plugin Name: Composer Autoloader
 Description: Adds a the composer autoload.php
 Author: Frank McCoy <frankmccoy.d@gmail.com>
 Version: 0.0.1
 Author URI: http://github.com/fmccoy/
 */

 if( ! ABSPATH ) exit;

 if ( file_exists( WP_CONTENT_DIR . '/vendor/autoload.php' ) ) {
    require_once( WP_CONTENT_DIR . '/vendor/autoload.php' );
    define( 'WP_COMPOSER', true );
 } else {
    echo "Autoload Not Found";
    define( 'WP_COMPOSER', false );
 }