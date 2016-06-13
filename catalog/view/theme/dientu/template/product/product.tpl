
<?php echo $header; ?>
<script type="text/javascript" src="asset/js/jssor.slider.min.js"></script>
<script>
	jssor_1_slider_init = function() {

		var jssor_1_SlideshowTransitions = [
			{$Duration:1200,x:0.3,$During:{$Left:[0.3,0.7]},$Easing:{$Left:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
			{$Duration:1200,x:-0.3,$SlideOut:true,$Easing:{$Left:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
			{$Duration:1200,x:-0.3,$During:{$Left:[0.3,0.7]},$Easing:{$Left:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
			{$Duration:1200,x:0.3,$SlideOut:true,$Easing:{$Left:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
			{$Duration:1200,y:0.3,$During:{$Top:[0.3,0.7]},$Easing:{$Top:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
			{$Duration:1200,y:-0.3,$SlideOut:true,$Easing:{$Top:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
			{$Duration:1200,y:-0.3,$During:{$Top:[0.3,0.7]},$Easing:{$Top:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
			{$Duration:1200,y:0.3,$SlideOut:true,$Easing:{$Top:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
			{$Duration:1200,x:0.3,$Cols:2,$During:{$Left:[0.3,0.7]},$ChessMode:{$Column:3},$Easing:{$Left:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
			{$Duration:1200,x:0.3,$Cols:2,$SlideOut:true,$ChessMode:{$Column:3},$Easing:{$Left:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
			{$Duration:1200,y:0.3,$Rows:2,$During:{$Top:[0.3,0.7]},$ChessMode:{$Row:12},$Easing:{$Top:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
			{$Duration:1200,y:0.3,$Rows:2,$SlideOut:true,$ChessMode:{$Row:12},$Easing:{$Top:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
			{$Duration:1200,y:0.3,$Cols:2,$During:{$Top:[0.3,0.7]},$ChessMode:{$Column:12},$Easing:{$Top:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
			{$Duration:1200,y:-0.3,$Cols:2,$SlideOut:true,$ChessMode:{$Column:12},$Easing:{$Top:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
			{$Duration:1200,x:0.3,$Rows:2,$During:{$Left:[0.3,0.7]},$ChessMode:{$Row:3},$Easing:{$Left:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
			{$Duration:1200,x:-0.3,$Rows:2,$SlideOut:true,$ChessMode:{$Row:3},$Easing:{$Left:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
			{$Duration:1200,x:0.3,y:0.3,$Cols:2,$Rows:2,$During:{$Left:[0.3,0.7],$Top:[0.3,0.7]},$ChessMode:{$Column:3,$Row:12},$Easing:{$Left:$Jease$.$InCubic,$Top:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
			{$Duration:1200,x:0.3,y:0.3,$Cols:2,$Rows:2,$During:{$Left:[0.3,0.7],$Top:[0.3,0.7]},$SlideOut:true,$ChessMode:{$Column:3,$Row:12},$Easing:{$Left:$Jease$.$InCubic,$Top:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
			{$Duration:1200,$Delay:20,$Clip:3,$Assembly:260,$Easing:{$Clip:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
			{$Duration:1200,$Delay:20,$Clip:3,$SlideOut:true,$Assembly:260,$Easing:{$Clip:$Jease$.$OutCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
			{$Duration:1200,$Delay:20,$Clip:12,$Assembly:260,$Easing:{$Clip:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
			{$Duration:1200,$Delay:20,$Clip:12,$SlideOut:true,$Assembly:260,$Easing:{$Clip:$Jease$.$OutCubic,$Opacity:$Jease$.$Linear},$Opacity:2}
		];

		var jssor_1_options = {
			$AutoPlay: true,
			$SlideshowOptions: {
				$Class: $JssorSlideshowRunner$,
				$Transitions: jssor_1_SlideshowTransitions,
				$TransitionsOrder: 1
			},
			$ArrowNavigatorOptions: {
				$Class: $JssorArrowNavigator$
			},
			$ThumbnailNavigatorOptions: {
				$Class: $JssorThumbnailNavigator$,
				$Cols: 4,
				$SpacingX: 12,
				$SpacingY: 0,
				$Align: 360
			}
		};

		var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

		//responsive code begin
		//you can remove responsive code if you don't want the slider scales while window resizing
		function ScaleSlider() {
			var refSize = jssor_1_slider.$Elmt.parentNode.clientWidth;
			if (refSize) {
				refSize = Math.min(refSize, 800);
				jssor_1_slider.$ScaleWidth(refSize);
			}
			else {
				window.setTimeout(ScaleSlider, 30);
			}
		}
		ScaleSlider();
		$Jssor$.$AddEvent(window, "load", ScaleSlider);
		$Jssor$.$AddEvent(window, "resize", $Jssor$.$WindowResizeFilter(window, ScaleSlider));
		$Jssor$.$AddEvent(window, "orientationchange", ScaleSlider);
		//responsive code end
	};
</script>

<style>

	/* jssor slider arrow navigator skin 05 css */
	/*
    .jssora05l                  (normal)
    .jssora05r                  (normal)
    .jssora05l:hover            (normal mouseover)
    .jssora05r:hover            (normal mouseover)
    .jssora05l.jssora05ldn      (mousedown)
    .jssora05r.jssora05rdn      (mousedown)
    */
	.jssora05l, .jssora05r {
		display: block;
		position: absolute;
		/* size of arrow element */
		width: 40px;
		height: 40px;
		cursor: pointer;
		background: url('image/image_slider/a17.png') no-repeat;
		overflow: hidden;
	}
	.jssora05l { background-position: -10px -40px; }
	.jssora05r { background-position: -70px -40px; }
	.jssora05l:hover { background-position: -130px -40px; }
	.jssora05r:hover { background-position: -190px -40px; }
	.jssora05l.jssora05ldn { background-position: -250px -40px; }
	.jssora05r.jssora05rdn { background-position: -310px -40px; }

	/* jssor slider thumbnail navigator skin 01 css */
	/*
    .jssort01 .p            (normal)
    .jssort01 .p:hover      (normal mouseover)
    .jssort01 .p.pav        (active)
    .jssort01 .p.pdn        (mousedown)
    */
	.jssort01 .p {
		position: absolute;
		top: 0;
		left: 0;
		width: 172px;
		height: 172px;
	}

	.jssort01 .t {
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		border: none;
	}

	.jssort01 .w {
		position: absolute;
		top: 0px;
		left: 0px;
		width: 100%;
		height: 100%;
	}

	.jssort01 .c {
		position: absolute;
		top: 0px;
		left: 0px;
		width: 172px;
		height: 172px;
		/*border: #000 2px solid;*/
		box-sizing: content-box;
		background: url('image/image_slider/t01.png') -800px -800px no-repeat;
		_background: none;
	}

	.jssort01 .pav .c {
		top: 2px;
		_top: 0px;
		left: 2px;
		_left: 0px;
		width: 172px;
		height: 172px;
		/*border: #000 0px solid;*/
		/*_border: #fff 2px solid;*/
		background-position: 50% 50%;
	}

	.jssort01 .p:hover .c {
		top: 0px;
		left: 0px;
		width: 172px;
		height: 172px;
		/*border: #fff 1px solid;*/
		background-position: 50% 50%;
	}

	.jssort01 .p.pdn .c {
		background-position: 50% 50%;
		width: 172px;
		height: 172px;
		/*border: #000 2px solid;*/
	}

	* html .jssort01 .c, * html .jssort01 .pdn .c, * html .jssort01 .pav .c {
		/* ie quirks mode adjust */
		width /**/: 172px;
		height /**/: 172px;
	}

</style>

<div id="cat-nav">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<?php echo $content_top;?>
			</div>
		</div>
	</div>
</div>
<div class="container container-product">
	<div class="row">
		<div class="col-md-12">
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>

	<div class="row">
		<?php echo $column_left; ?>
		<?php if ($column_left && $column_right) { ?>
		<?php $class = 'col-sm-9'; ?>
		<?php } elseif ($column_left || $column_right) { ?>
		<?php $class = 'col-sm-9'; ?>
		<?php } else { ?>
		<?php $class = 'col-sm-12'; ?>
		<?php } ?>
		<div id="content-detail" class="<?php echo $class; ?>">
			<div class="row">
			<?php if ($thumb && $images) { ?>
			<?php $class = 'col-sm-6'; ?>
			<?php } elseif ($thumb || $images) { ?>
			<?php $class = 'col-sm-6'; ?>
			<?php } else { ?>
			<?php $class = 'col-sm-12'; ?>
			<?php } ?>
			<div class="<?php echo $class; ?>">
			<div style="display: none;">
			<?php if (isset($useo_heading_title2)) {?><h2 class = "useo_h2"><?php echo $useo_heading_title2; ?></h2><!-- Ultimate Seo Package --><?php } ?></div>
			  <?php if ($thumb || $images) { ?>
			  <div class="thumbnails">

				  <div id="jssor_1" style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 800px; height: 806px; overflow: hidden; visibility: hidden;">
					  <!-- Loading Screen -->
					  <div data-u="loading" style="position: absolute; top: 0px; left: 0px;">
						  <div style="filter: alpha(opacity=70); opacity: 0.7; position: absolute; display: block; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
						  <div style="position:absolute;display:block;background:url('image/image_slider/loading.gif') no-repeat center center;top:0px;left:0px;width:100%;height:100%;"></div>
					  </div>
					  <div data-u="slides" style="cursor: default; position: relative; top: 0px; left: 0px; width: 800px; height: 636px; overflow: hidden; border: 2px lightgrey solid;">
						  <div data-p="144.50" style="display: none;">
							  <img data-u="image" src="<?php echo $thumb; ?>" />
							  <img data-u="thumb" src="<?php echo $thumb; ?>" />
						  </div>
						  <?php if ($images): ?>
							  <?php foreach ($images as $image):?>
							  <div data-p="144.50" style="display: none;">

									  <img data-u="image" src="<?php echo $image['popup']; ?>" />
									  <img data-u="thumb" src="<?php echo $image['thumb']; ?>" />
							  </div>
							  <?php endforeach;?>
						  <?php endif?>
					  </div>
					  <!-- Thumbnail Navigator -->
					  <div data-u="thumbnavigator" class="jssort01" style="position:absolute;left:0px;bottom:0px;width:800px;height:100px;" data-autocenter="1">
						  <!-- Thumbnail Item Skin Begin -->
						  <div data-u="slides" style="cursor: default;">
							  <div data-u="prototype" class="p">
								  <div class="w">
									  <div data-u="thumbnailtemplate" class="t"></div>
								  </div>
								  <div class="c"></div>
							  </div>
						  </div>
						  <!-- Thumbnail Item Skin End -->
					  </div>
					  <!-- Arrow Navigator -->
					  <span data-u="arrowleft" class="jssora05l" style="top:258px;left:8px;width:40px;height:40px;"></span>
					  <span data-u="arrowright" class="jssora05r" style="top:258px;right:8px;width:40px;height:40px;"></span>
					  <a href="http://www.jssor.com" style="display:none">Bootstrap Carousel</a>
				  </div>
				  <script>
					  jssor_1_slider_init();
				  </script>

			  </div>
			  <?php } ?>

			</div>
			<?php if ($thumb && $images) { ?>
			<?php $class = 'col-sm-6'; ?>
			<?php } elseif ($thumb || $images) { ?>
			<?php $class = 'col-sm-6'; ?>
			<?php } else { ?>
			<?php $class = 'col-sm-12'; ?>
			<?php } ?>
			<div class="<?php echo $class; ?>  product-detail">
				<?php if ($name) { ?>
					<h2 class="name-detail"><?php echo $name; ?></h2>
				<?php } ?>
				<div class="detail-model">
					<span class="text-model"><?php echo $text_model; ?></span>
					<span class="st-sku"><i></i><?php echo $model; ?></span>
				</div>
				<div class="clearfix"></div>
				<?php if ($short_description) { ?>
					<div class="short-desc"><?php echo $short_description; ?></div>
				<?php } ?>

				<div class="price_pdt">
					<?php if( $special): ?>
						<div class="fll bx_tpv">
							<div style="border: 1px solid #fff;"><?php echo $specialper;?><span>%</span></div>
						</div>
						<div class="fll" style="padding-left: 20px; padding-top: 7px; width: 135px;">
							<p><span class="ol_price"><?php echo $price; ?></span> </p>
							<p><span class="m_price"><?php echo $special; ?></span></p>
						</div>
					<?php else:?>
					<p><span class="m_price" style="line-height: 70px; padding: 10px"><?php echo $price; ?></span></p>
					<?php endif?>
				</div>

				<span class="detail-stock-green clearfix <?php echo $class_stock;?>"><?php echo $stock; ?></span>

				<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
				<input type="hidden" name="quantity" value="1" />

			<div class="group-btn-cart clearfix">
				<?php if ($options):?>
				<?php foreach ($options as $option): ?>
				<?php if ($option['type'] == 'select') { ?>
					<div id="selectcolor" class="select-color <?php echo ($option['required'] ? ' required' : ''); ?>">
						<select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="">

							<?php foreach ($option['product_option_value'] as $option_value) { ?>
							<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
								<?php if ($option_value['price']) { ?>
								(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
								<?php } ?>
							</option>
							<?php } ?>
						</select>
					</div>
					<?php } ?>
				<?php endforeach;
				endif; ?>


				<div class="btn-cart">
					<div type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="box_btn_od">
						<a class="btn_order_now"><?php echo $button_cart; ?>
							<span>+</span>
						</a>
					</div>
				</div>
			</div>

			<div class="detail-support">
				<div style="background-color: #CCCCCC; float: left;margin-right: 10px;padding: 0px 5px;">
					<img src="image/Phone_27x27-black.gif" />
				</div>
				<span>Hỗ trợ mua hàng <span class="hot-line"><?php echo $hotline;?></span> (<?php echo $timeopen;?>)</span>
			</div>
			</div>
		  </div>
			<div class="row">
				<div  class="col-sm-12 motasanpham2">

					<div>
						<!-- Nav tabs -->
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a href="#desc" aria-controls="desc" role="tab" data-toggle="tab"><?php echo $tab_description; ?></a></li>
							<li role="presentation"><a href="#reviews" aria-controls="reviews" role="tab" data-toggle="tab">Đánh giá bình luận</a></li>
						</ul>

						<!-- Tab panes -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="desc">	<?php echo $description; ?></div>
							<div role="tabpanel" class="tab-pane" id="reviews">

								<?php if ($review_status) { ?>
								<div class="tab-pane" id="tab-review">
									<form class="form-horizontal">
										<div id="review"></div>
										<h2><?php echo $text_write; ?></h2>
										<?php if ($review_guest) { ?>
										<div class="form-group required">
											<div class="col-sm-12">
												<label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
												<input type="text" name="name" value="" id="input-name" class="form-control" />
											</div>
										</div>
										<div class="form-group required">
											<div class="col-sm-12">
												<label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
												<textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
												<div class="help-block"><?php echo $text_note; ?></div>
											</div>
										</div>
										<div class="form-group required">
											<div class="col-sm-12">
												<label class="control-label"><?php echo $entry_rating; ?></label>
												&nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
												<input type="radio" name="rating" value="1" />
												&nbsp;
												<input type="radio" name="rating" value="2" />
												&nbsp;
												<input type="radio" name="rating" value="3" />
												&nbsp;
												<input type="radio" name="rating" value="4" />
												&nbsp;
												<input type="radio" name="rating" value="5" />
												&nbsp;<?php echo $entry_good; ?></div>
										</div>
										<?php if ($site_key) { ?>
										<div class="form-group">
											<div class="col-sm-12">
												<div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
											</div>
										</div>
										<?php } ?>
										<div class="buttons clearfix">
											<div class="pull-right">
												<button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
											</div>
										</div>
										<?php } else { ?>
										<?php echo $text_login; ?>
										<?php } ?>
									</form>
								</div>
								<?php } ?>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<?php echo $column_right; ?>
	</div>

	<div class="row">
	<?php echo $content_bottom; ?>
	</div>

</div>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']t'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {

	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\'], #selectcolor select'),
		dataType: 'json',
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
                document.location=json['successcart'];
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('#cart > button').html('<i class="fa fa-shopping-cart"></i> ' + json['total']);

				$('html, body').animate({ scrollTop: 0 }, 'slow');

				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : ''),
		dataType: 'json',

		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});

$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
//--></script>
<?php echo $footer; ?>