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
<link href="catalog/view/theme/giaydep/stylesheet/stylesheet.css" rel="stylesheet">
<link href="catalog/view/theme/default/stylesheet/responsive.css" rel="stylesheet">
    <link href="catalog/view/theme/giaydep/stylesheet/responsive.css" rel="stylesheet">
<script src="catalog/view/javascript/jquery/jquery.flexisel.js" type="text/javascript"></script>
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>

    <?php echo $google_analytics; ?>
    <?php echo $google_adword; ?>
    <?php echo $google_webmaster; ?>

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

            <?php if ($live_search_ajax_status):?>
            <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/live_search.css" />
			<script type="text/javascript"><!--
				var live_search = {
					selector: '#search',
					text_no_matches: 'No matches.',
					height: '50px',
					delay: 400
				}

				$(document).ready(function() {
					var html = '';
					html += '<div id="live-search">';
					html += '	<ul>';
					html += '	</ul>';
					html += '</div>';

					$(live_search.selector).after(html);
					$('input[name=\'search\']').autocomplete({
						'source': function(request, response) {
							if ($(live_search.selector + ' input[type=\'text\']').val() == '') {
								$('#live-search').css('display','none');
							}
							else{
								var html = '';
								html += '<li style="text-align: center;height:10px;">';
								html +=		'	<img class="loading" src="catalog/view/theme/default/image/loading.gif" />';
								html +=	'</li>';
								$('#live-search ul').html(html);
								$('#live-search').css('display','block');
							}
							var filter_name = $(live_search.selector + ' input[type=\'text\']').val();

							if (filter_name.length>0) {
								$.ajax({
									url: 'index.php?route=product/live_search&filter_name=' +  encodeURIComponent(request),
									dataType: 'json',
									success: function(products) {
										$('#live-search ul li').remove();
										if (!$.isEmptyObject(products)) {
											var show_image = <?php echo $live_search_show_image;?>;
											var show_price = <?php echo $live_search_show_price;?>;
											var show_description = <?php echo $live_search_show_description;?>;

											$.each(products, function(index,product) {
												var html = '';
												
												html += '<li>';
												html += '<a href="' + product.url + '" title="' + product.name + '">';
												if(product.image && show_image){
													html += '	<div class="product-image"><img alt="' + product.name + '" src="' + product.image + '"></div>';
												}
												html += '	<div class="product-name">' + product.name ;
												if(show_description){
													html += '<p>' + product.extra_info + '</p>';
												}
												html += '</div>';
												if(show_price){
													if (product.special) {
														html += '	<div class="product-price"><span class="special">' + product.price + '</span><span class="price">' + product.special + '</span></div>';
													} else {
														html += '	<div class="product-price"><span class="price">' + product.price + '</span></div>';
													}
												}
												html += '<span style="clear:both"></span>';
												html += '</a>';
												html += '</li>';
												$('#live-search ul').append(html);
											});
										} else {
											var html = '';
											html += '<li style="text-align: center;height:10px;">';
											html +=		live_search.text_no_matches;
											html +=	'</li>';

											$('#live-search ul').html(html);
										}
										$('#live-search ul li').css('height',live_search.height);
										$('#live-search').css('display','block');
										return false;
									}
								});
							}
						},
						'select': function(product) {
							$('input[name=\'search\']').val(product.name);
						}
					});

					$(document).bind( "mouseup touchend", function(e){
					  var container = $('#live-search');
					  if (!container.is(e.target) && container.has(e.target).length === 0)
					  {
					    container.hide();
					  }
					});
				});
			//--></script>
			<?php endif;?>
            
</head>
<!--------ajax search--->
<?php if ($live_search_ajax_status):?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/live_search.css" />
<script type="text/javascript"><!--
	var live_search = {
		selector: '#search',
		text_no_matches: 'No matches.',
		height: '50px',
		delay: 400
	}

	$(document).ready(function() {
		var html = '';
		html += '<div id="live-search">';
		html += '	<ul>';
		html += '	</ul>';
		html += '</div>';

		$(live_search.selector).after(html);
		$('input[name=\'search\']').autocomplete({
			'source': function(request, response) {
				if ($(live_search.selector + ' input[type=\'text\']').val() == '') {
					$('#live-search').css('display','none');
				}
				else{
					var html = '';
					html += '<li style="text-align: center;height:10px;">';
					html +=		'	<img class="loading" src="catalog/view/theme/default/image/loading.gif" />';
					html +=	'</li>';
					$('#live-search ul').html(html);
					$('#live-search').css('display','block');
				}
				var filter_name = $(live_search.selector + ' input[type=\'text\']').val();

				if (filter_name.length>0) {
					$.ajax({
						url: 'index.php?route=product/live_search&filter_name=' +  encodeURIComponent(request),
						dataType: 'json',
						success: function(products) {
							$('#live-search ul li').remove();
							if (!$.isEmptyObject(products)) {
								var show_image = <?php echo $live_search_show_image;?>;
							var show_price = <?php echo $live_search_show_price;?>;
							var show_description = <?php echo $live_search_show_description;?>;

							$.each(products, function(index,product) {
								var html = '';

								html += '<li>';
								html += '<a href="' + product.url + '" title="' + product.name + '">';
								if(product.image && show_image){
								html += '	<div class="product-image"><img alt="' + product.name + '" src="' + product.image + '"></div>';
							}
								html += '	<div class="product-name">' + product.name ;
								if(show_description){
								html += '<p>' + product.extra_info + '</p>';
							}
								html += '</div>';
								if(show_price){
								if (product.special) {
								html += '	<div class="product-price"><span class="special">' + product.price + '</span><span class="price">' + product.special + '</span></div>';
							} else {
								html += '	<div class="product-price"><span class="price">' + product.price + '</span></div>';
							}
							}
								html += '<span style="clear:both"></span>';
								html += '</a>';
								html += '</li>';
								$('#live-search ul').append(html);
							});
							} else {
								var html = '';
								html += '<li style="text-align: center;height:10px;">';
								html +=		live_search.text_no_matches;
								html +=	'</li>';

								$('#live-search ul').html(html);
							}
							$('#live-search ul li').css('height',live_search.height);
										$('#live-search').css('display','block');
										return false;
									}
								});
							}
						},
						'select': function(product) {
							$('input[name=\'search\']').val(product.name);
							}
							});

							$(document).bind( "mouseup touchend", function(e){
					  var container = $('#live-search');
					  if (!container.is(e.target) && container.has(e.target).length === 0)
					  {
					    container.hide();
					  }
					});
				});
	//--></script>
<?php endif;?>

<!--------ajax search--->
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
	        	<div class="col-md-7 col-sm-2 col-xs-4">
		        	<span>Hotline:</span>
	        	</div>
	        	<div class="col-md-5 col-sm-10 col-xs-8 alignright">
                    <?php if(!$logged):?>
					<a href="<?php echo $register;?>">Chăm sóc khách hàng</a>
					<a href="<?php echo $register;?>">Kiểm tra đơn hàng</a>
	        		<a href="<?php echo $login;?>">Đăng nhập</a>&nbsp;
                    <?php else:?>
                    <a href="<?php echo $account; ?>">Tài khoản</a>
                    <a href="<?php echo $logout; ?>">Đăng xuất</a>
                    <?php endif?>
	        	</div>
	    	</div>
    	</div>
    </div>
    <div id="headermenu">
    	<div class="container">
	    	<div class="row">
		        <div class="col-md-5 col-sm-3 col-xs-16">
		            <div id="logo">
		                <?php if ($logo) { ?>
		                <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive mrthome"/></a>
		                <?php } else { ?>
		                <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
		                <?php } ?>
		            </div>
		        </div>
				<div class="col-md-5 col-sm-9 col-xs-16 group-nav">
					<?php echo $search; ?>
				</div>
		        <div class="col-md-2 col-sm-12 col-xs-12 group-nav navbar-ex1-collapse">
			        <!-- add -->
					<nav id="navbarheader">
					    <ul class="list-inline">
					        <li class="cart-img"><a href="<?php echo $shopping_cart; ?>"><?php echo $cart; ?> sản phẩm</a></li>
					    </ul>
					</nav>
					<!-- end -->

		        </div>

        	</div>
        </div>
    </div>
</div>

