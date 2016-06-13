<?php

// HTTP
define('HTTP_SERVER', 'http://dientu.gg/');

// HTTPS
define('HTTPS_SERVER', 'http://dientu.gg/');
define('HTTPS_IMAGE', 'http://dientu.gg/image/');

// DIR
define('DIR_APPLICATION', 'E:\Work2\chodientu/catalog/');
define('DIR_SYSTEM', 'E:\Work2\chodientu/system/');
define('DIR_LANGUAGE', 'E:\Work2\chodientu/catalog/language/');
define('DIR_TEMPLATE', 'E:\Work2\chodientu/catalog/view/theme/');
define('DIR_CONFIG', 'E:\Work2\chodientu/system/config/');
define('DIR_IMAGE', 'E:\Work2\chodientu/image/');
define('DIR_CACHE', 'E:\Work2\chodientu/system/cache/');
define('DIR_DOWNLOAD', 'E:\Work2\chodientu/system/download/');
define('DIR_UPLOAD', 'E:\Work2\chodientu/system/upload/');
define('DIR_MODIFICATION', 'E:\Work2\chodientu/system/modification/');
define('DIR_LOGS', 'E:\Work2\chodientu/system/logs/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_DATABASE', 'chodientu');
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
    ),
    'footer_top' => array(
        'label' => 'Footer top',
        'template' => false //you can use the same template file for several positions if you want
    )
)));
