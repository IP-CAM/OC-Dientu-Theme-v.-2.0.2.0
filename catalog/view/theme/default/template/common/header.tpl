 <!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<link href="catalog/view/theme/default/stylesheet/responsive.css" rel="stylesheet">
<script src="catalog/view/javascript/jquery/jquery.flexisel.js" type="text/javascript"></script>
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php echo $google_analytics; ?>
<!-- Ultimate Seo Package -->
<meta property="og:title" content="<?php echo $title; ?>" />
<meta property="og:type" content="website" />
<meta property="og:url" content="<?php echo HTTP_SERVER; ?>" />
<?php if (isset($thumb) || isset($images)) { ?>
<?php if (isset($thumb)) { ?>
          <meta property="og:image" content="<?php echo $thumb; ?>" />
<?php } ?>
<?php if ($images) { ?>
<?php foreach ($images as $image) { ?>
          <meta property="og:image" content="<?php echo $image; ?>" />
<?php } ?>         
<?php } ?>
<?php }else{ ?>
           <meta property="og:image" content="<?php echo $icon; ?>" />
<?php   }  ?>     
<!-- END Ultimate Seo Package -->
</head>
<body class="<?php echo $class; ?>">
<?php 
	global $registry; $vie_module_groups = $registry->get('vie_module_groups'); 
	if (!empty($vie_module_groups['vie_ht'])) { ?>
        <?php echo implode('', $vie_module_groups['vie_ht']); ?>
<?php } ?>
<header>
<div class="header-top">
    <div id="linkstop">
    	<div class="container">
	    	<div class="row">
	        	<div class="col-md-10 col-sm-10">
		        	<i class="fa fa-envelope sf" aria-hidden="true"></i>&nbsp;<?php echo $email; ?>
		        	&nbsp;&nbsp;&nbsp;&nbsp;
		        	<i class="fa fa-phone sf" aria-hidden="true"></i>&nbsp;<?php echo $telephone; ?>
		        	&nbsp;&nbsp;&nbsp;&nbsp;
		        	<i class="fa fa-mobile sf" aria-hidden="true"></i>&nbsp;<?php echo $hotline; ?>
	        	</div>
	        	<div class="col-md-2 col-sm-2 alignright">
	        		<a class="linkfacebook" href="<?php echo $link_facebook; ?>"><i class="fa fa-facebook-square sf" aria-hidden="true"></i></a>&nbsp;
	        		<a class="linkyoutube" href="<?php echo $link_youtube; ?>"><i class="fa fa-youtube-square sf" aria-hidden="true"></i></a>&nbsp;
	        		<a class="linkgoogle" href="<?php echo $link_google; ?>"><i class="fa fa-google-plus-square sf" aria-hidden="true"></i></a>&nbsp;
	        	</div>
	    	</div>
    	</div>
    </div>
    <div id="headermenu">
    	<div class="container">
	    	<div class="row">
		        <div class="col-md-3 col-sm-10 col-xs-10 col-xs-16">
		            <div id="logo">
		                <?php if ($logo) { ?>
		                <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive mrthome"/></a>
		                <?php } else { ?>
		                <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
		                <?php } ?>
		            </div>
		        </div>
		        <div class="col-md-9 col-sm-2 col-xs-2 col-xs-16">
			        <!-- add -->
					<nav id="navbarheader">
					    <ul>
					        <li><a href="<?php echo $home; ?>"> Trang chủ</a></li>
					        <li><a href="<?php echo $gioithieu; ?>">Giới thiệu</a></li>
					        <?php if ($categories) { ?>
					        <li><a href="<?php echo $product; ?>">Sản phẩm</a>
					            <ul>
					                <?php foreach ($categories as $category) { ?>
					                    <?php if ($category['children']) { ?>
					                    <li>
					                        <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
					                            <ul>
					                            <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
					                                <?php foreach ($children as $child) { ?>
					                                    <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
					                                <?php } ?>
					                            <?php } ?>
					                            </ul>
					                    </li>
					                    <?php } else { ?>
					                    <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
					                    <?php } ?>
					                <?php } ?>
					            </ul>
					        </li>
					        <?php } ?>                 
					        <li><a href="<?php echo $suutap; ?>">Dịch vụ</a></li>
					        <li><a href="<?php echo $tintuc; ?>">Tư vấn</a></li>
					        <li><a href="<?php echo $contact; ?>">Liên hệ</a></li>
					    </ul>
					</nav>
					<!-- end -->
					<button type="button" class="btn btn-navbar navbar-toggle btmh" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
		        </div>
        	</div>
        </div>
    </div>
</div>
<div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav floatright">
        <li><a href="<?php echo $home; ?>"> Trang chủ</a></li>
        <li><a href="<?php echo $gioithieu; ?>">Giới thiệu</a></li>
        <?php if ($categories) { ?>
        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Sản phẩm <b class="caret"></b></a>
        <ul class="dropdown-menu span10">
            <li><a href="<?php echo $product; ?>" >Sản phẩm</a>
            <?php foreach ($categories as $category) { ?>
            <?php if ($category['children']) { ?>
            <li class="dropdown">
                <a href="" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?><b class="caret"></b></a>
                    <ul class="dropdown-menu span10">
                        <li class="paddingmnres">
                            <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                        </li>
                        <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                            <?php foreach ($children as $child) { ?>
                                <li class="paddingmnres"><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                            <?php } ?>
                        <?php } ?>
                    </ul>
            </li>
            <?php } else { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
            <?php } ?>
        </ul>
        </li>
        <?php } ?>                 
        <li><a href="<?php echo $suutap; ?>">Dịch vụ</a></li>
        <li><a href="<?php echo $tintuc; ?>">Tư vấn</a></li>
        <li><a href="<?php echo $contact; ?>">Liên hệ</a></li>
    </ul>
</div>

	            