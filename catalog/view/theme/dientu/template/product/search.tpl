<?php echo $header; ?>
<div class="bg-heading">
    <div class="container">
        <span class="search-title"> Tìm kiếm</span>
    </div>
</div>

<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>

    <div id="content-search" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <!--<h1><?php// echo $heading_title; ?></h1>-->
        <div class="row">
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
<div class="bg-grey search-head-wraper">
      <div class="row no-margin-lr">

       <label class="control-label label-search" for="input-search"><?php echo $entry_search; ?></label>
        <div class="col-sm-4">
            <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" />
        </div>
        <div class="col-sm-3">
          <select name="category_id" class="form-control">
            <option value="0"><?php echo $text_category; ?></option>
            <?php foreach ($categories as $category_1) { ?>
            <?php if ($category_1['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_1['children'] as $category_2) { ?>
            <?php if ($category_2['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_2['children'] as $category_3) { ?>
            <?php if ($category_3['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php } ?>
          </select>
        </div>

      </div>

      <p style="margin-left: 67px;">
        <label class="checkbox-inline">
          <?php if ($description) { ?>
          <input type="checkbox" name="description" value="1" id="description" checked="checked" />
          <?php } else { ?>
          <input type="checkbox" name="description" value="1" id="description" />
          <?php } ?>
          <?php echo $entry_description; ?></label>
          <label class="checkbox-inline">
              <?php if ($sub_category) { ?>
              <input type="checkbox" name="sub_category" value="1" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="sub_category" value="1" />
              <?php } ?>
              <?php echo $text_sub_category; ?></label>
      </p>
      <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-primary" />
</div>
      <h2 class="mess-title"><?php echo $text_search; ?></h2>
      <?php if ($products) { ?>
      <!-- <p><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></p> -->
      <div class="row">
        <div class="col-sm-3 hidden-xs">

        </div>
        <div class="col-sm-1 col-sm-offset-2 text-right">
          <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
        </div>
        <div class="col-sm-3 text-right">
          <select id="input-sort" class="form-control col-sm-3" onchange="location = this.value;">
            <?php foreach ($sorts as $sorts) { ?>
            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
            <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-sm-1 text-right">
          <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
        </div>
        <div class="col-sm-2 text-right">
          <select id="input-limit" class="form-control" onchange="location = this.value;">
            <?php foreach ($limits as $limits) { ?>
            <?php if ($limits['value'] == $limit) { ?>
            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
      </div>
      <br />
      <div class="row" style="padding-left: 15px">
        <?php foreach ($products as $product) { ?>
          <div class="col-md-15">
              <div class="product-content product-tab product-cat">
                  <a data-toggle="tooltip" class="pull-right heart-font" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                      <i class="fa fa-heart-o" aria-hidden="true"></i>
                  </a>
                  <div class="image-product">
                      <a href="<?php echo $product['href']; ?>">
                          <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive"/>
                      </a>
                  </div>
                  <div class="info-product">
                      <div class="">
                          <?php if ($product['price'] != 0) { ?>
                          <?php if( $product['special']): ?>
                          <div class="price-group">
                              <?php if( $product['special']): ?>
                              <span class="price"> <?php echo $product['special']; ?></span><br/>
                              <span class="price-sale"><?php echo $product['price']; ?></span>
                              <?php endif;?>
                          </div>
                                    <span class="percent-right">
                                      <span class="price-percent">-<?php echo $product['specialper']; ?> %</span>
                                    </span>
                          <div class="clearfix"></div>
                          <?php else:?>
                          <div class="price">
                              <span class="price"><?php echo $product['price']; ?></span>
                          </div>
                          <div class=""> &nbsp</div>
                          <?php endif;?>
                          <?php } else { ?>
                          <span class="price">Giá: Call</span>
                          <?php } ?>
                      </div>
                      <h4><a class="name-card" href="<?php echo $product['href']; ?>" ><?php echo $product['name']; ?></a></h4>
                  </div>
              </div>
          </div>
        <?php } ?>
      </div>
      <div class="row">
        <!--<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>-->
      </div>
      <?php } else if ($news) { ?>
	<div class="row">
          <?php foreach($news as $newss) { ?>
          <div class="product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12">
              <div class="product-thumb">
                  <div class="image"><a href="<?php echo $newss['href']; ?>"><img src="<?php echo $newss['thumb']; ?>" alt="<?php echo $newss['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
                  <div>
                      <div class="info-product info-category">
                          <div class="caption">
                              <h4><a href="<?php echo $newss['href']; ?>"><?php echo $newss['title']; ?></a></h4>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
          <?php } ?>
 </div>
        <div class="row">
           <!-- <div class="col-sm-6 text-left"><?php //echo $pagination; ?></div>
            <div class="col-sm-6 text-right"><?php// echo $results; ?></div>-->
        </div>
     <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';

	var search = $('#content input[name=\'search\']').prop('value');

	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').prop('value');

	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}

	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');

	if (sub_category) {
		url += '&sub_category=true';
	}

	var filter_description = $('#content input[name=\'description\']:checked').prop('value');

	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
--></script>
<?php echo $footer; ?>