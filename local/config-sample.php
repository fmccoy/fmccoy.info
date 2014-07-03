<?php

/**
 * Local Configuration File
 */

/**
 * Database Connection Info
 */
define( 'DB_NAME', 'DB_NAME' );
define( 'DB_USER', 'DB_USER' );
define( 'DB_PASSWORD', 'DB_PASSWORD' );
define( 'DB_HOST', 'localhost' ); // Probably 'localhost'

/**
 * Debug
 * We are developing locally here so lets turn debug on,
 * if not comment out.
 */
//define( 'WP_DEBUG', true );

/**
 * Content Directory 
 * 
 * If wordpress is installed in a subdirectory you need to adjust your
 * content directory url accordingly.
 */
define( 'WP_CONTENT_URL', 'http://' . $_SERVER['HTTP_HOST'] . '/content' );
