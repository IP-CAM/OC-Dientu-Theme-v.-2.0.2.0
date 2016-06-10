<?php echo $header; ?>
<div class="container container-product">
	<div class="row">
		<?php echo $column_left; ?>
		<?php if ($column_left && $column_right) { ?>
		<?php $class = 'col-sm-9'; ?>
		<?php } elseif ($column_left || $column_right) { ?>
		<?php $class = 'col-sm-9'; ?>
		<?php } else { ?>
		<?php $class = 'col-sm-12'; ?>
		<?php } ?>
		<div id="content-detail" class="<?php echo $class; ?>"><?php echo $content_top; ?>
			<div class="row ">
			<div class="left col-sm-6"><a href="#">Tin khuyến mãi</a></div>
			<div class="right col-sm-6"> <img src="image/iconhotline.png"><span class="icon">Bán hàng online: </span><a href="tel:0838681916">08 38 68 19 16</a></div>
			</div>
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
			  <ul class="thumbnails">
				<?php if ($thumb) { ?>
				<li>					
					<a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>">
					<img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
				</li>
				<?php } ?>
				<?php if ($images) { ?>
				<?php foreach ($images as $image) { ?>
				<li class="image-additional"><a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
				<?php } ?>
				<?php } ?>
			  </ul>
			  <?php } ?>

			</div>
			<?php if ($thumb && $images) { ?>
			<?php $class = 'col-sm-6'; ?>
			<?php } elseif ($thumb || $images) { ?>
			<?php $class = 'col-sm-6'; ?>
			<?php } else { ?>
			<?php $class = 'col-sm-12'; ?>
			<?php } ?>
			<div class="<?php echo $class; ?>  chitietsanphamli">          
				<ul>
				<?php if ($manufacturer) { ?>
				<li><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
				<?php } ?>
				<li><?php echo $text_model; ?> <?php echo $model; ?></li>
				<?php if ($reward) { ?>
				<li><?php echo $text_reward; ?> <?php echo $reward; ?></li>
				<?php } ?>
				<li><?php echo $text_stock; ?> <?php echo $stock; ?></li>
				<?php if ($material) { ?>
				<li><?php echo $text_material; ?> <?php echo $material; ?></li>
				<?php } ?>
				<?php if ($guarantee) { ?>
				<li><?php echo $text_guarantee; ?> <?php echo $guarantee; ?></li>
				<?php } ?>
				<?php if ($length || $width || $height) { ?>
				<li><?php echo $text_length; ?> <?php echo $length; ?>*<?php echo $width; ?>*<?php echo $height; ?></li>
				<?php } ?>
				<li><img src="catalog/view/theme/default/image/icon3.png"><a class="icon" href="tel:0916094809">0916 09 48 09</a></li>
			  </ul>
			<div class="col-sm-6 nutguibaogia">
				<input class="send-pricelist" type="button" value="Gửi báo giá"/>
			</div>
			<div class="col-sm-12" style="margin-left: 42px;margin-top: 10px;">
			<!-- AddThis Button BEGIN -->
            <div class="addthis_toolbox addthis_default_style"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
            <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
            <!-- AddThis Button END -->
            </div>
			</div>
		  </div>
			<div class="row">   
				<div  class="col-sm-12 motasanpham2">
				    <div class="khungmotasanpham2 col-lg-4 col-sm-6 col-md-4 col-xs-12">
					<h3><?php echo $tab_description; ?></h3>
					</div>
					<hr>
					<div class="clearfix"></div>
					<?php echo $description; ?>		
				</div>
		</div>
		</div>
	</div>
	<?php echo $content_bottom; ?>
    <?php echo $column_right; ?>
</div>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
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
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
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