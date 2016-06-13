<?php
// HTTP
define('HTTP_SERVER', 'http://dientu.tgmss.com/admin/');
define('HTTP_CATALOG', 'http://dientu.tgmss.com/');

// HTTPS
define('HTTPS_SERVER', 'http://dientu.tgmss.com/admin/');
define('HTTPS_CATALOG', 'http://dientu.tgmss.com/');

// DIR
define('DIR_APPLICATION', '/home/dientu/public_html/admin/');
define('DIR_SYSTEM', '/home/dientu/public_html/system/');
define('DIR_LANGUAGE', '/home/dientu/public_html/admin/language/');
define('DIR_TEMPLATE', '/home/dientu/public_html/admin/view/template/');
define('DIR_CONFIG', '/home/dientu/public_html/system/config/');
define('DIR_IMAGE', '/home/dientu/public_html/image/');
define('DIR_CACHE', '/home/dientu/public_html/system/cache/');
define('DIR_DOWNLOAD', '/home/dientu/public_html/system/download/');
define('DIR_UPLOAD', '/home/dientu/public_html/system/upload/');
define('DIR_LOGS', '/home/dientu/public_html/system/logs/');
define('DIR_MODIFICATION', '/home/dientu/public_html/system/modification/');
define('DIR_CATALOG', '/home/dientu/public_html/catalog/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'dientu_user');
define('DB_PASSWORD', 'Luong@1235');
define('DB_DATABASE', 'dientu_database');
define('DB_PREFIX', 'tgm_');

define('positions', serialize(array(
    'home_left' => array( //this key results in 'echo $position_1' in your template file where you want to show your modules
        'label' => 'Home left', //this is just for the label that shows in the select list when configuring your modules
        'template' => 'home_left.tpl' //this is the template file for the position, similar to common/content_top.tpl
    ),
    'home_right' => array(
        'label' => 'Home right',
        'template' => 'home_right.tpl' //you can use the same template file for several positions if you want
    ),
    'header_left' => array(
        'label' => 'Header left',
        'template' => false //you can use the same template file for several positions if you want
    )
)));

