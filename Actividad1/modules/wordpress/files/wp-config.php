<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'username' );

/** MySQL database password */
define( 'DB_PASSWORD', 'actividadPuppetPassword' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'RPl2?S]EIAG5kijv>zO*PyBU92__<^`MMfp0+nTY4u3j,Stu+HNOoK15Ix@Ov,7^' );
define( 'SECURE_AUTH_KEY',  '`GSzT-~rvNE])c<X4=YBMBc`!HiK ^&f~brA]b*Mxu wE5XGgOr$d=cY)iOt09or' );
define( 'LOGGED_IN_KEY',    'K$DKih.QNufW4.ZFtK20IW}U&F7T=WW~n-mK_WbT%9qcPzW7[8?I1/f,:NkYG+F0' );
define( 'NONCE_KEY',        '?61^_Zasq~rMsy+9@aB]Dl&SC6StOT|,*7w96fSyhh)YU0PK.M}BZ2C3gJ,,VZWC' );
define( 'AUTH_SALT',        'wm4u~!YFj-RCFLABLY4-2[h[v0xqK1o^:s$Sj62a5A>8Gxc|Z*dV=+{LD or~N<5' );
define( 'SECURE_AUTH_SALT', 'rDdY3wm<Se&n{J=?B]?O{jJeH<cJS)h-wA3^{h>k^|Fhvf-/MA)!rsnE|^B.Z8@r' );
define( 'LOGGED_IN_SALT',   'H|(wufD9:Ov,E=] .6_Iq!2[9[pSmq  KT6pIP$TQN<JrS,ab`W3cHaIxG,q|,kl' );
define( 'NONCE_SALT',       '*h)Qv44A8Po&W5[XI<h}>morYhYpN6`@W{2Lu8HJaTF7|-kfr<)PGCOVh?D#I3:5' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
