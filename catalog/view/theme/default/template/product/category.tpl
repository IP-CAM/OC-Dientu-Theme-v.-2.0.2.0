<?php echo $header; ?>
<div class="container">
   
  <div class="row">
	<?php 
	  if($category_id != 0){ 
			echo $column_left;
	  }	  
	?>
	<div class="col-md-9 noidungtieudesp">
	<p><b><?php echo $heading_title; ?></b></p>
	</div>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <?php if($category_id==0) { ?>
    <div id="content" class="ct-parent col-md-12">
    <div style="display: none;">
        <?php if (isset($useo_heading_title2)) {?><h2 class = "useo_h2"><?php echo $useo_heading_title2; ?></h2><!-- Ultimate Seo Package --><?php } ?>
    </div>
	<?php 
	  if($category_id == 0){ 
			echo $content_top;
	}	  
	  ?>
      <?php if ($categories) { ?>	  
        <?php
		foreach($categories as $category) { ?>
        <div class="row" style="">
            <?php if(isset($category['thongbao'])) { ?>
                <p class="thongbao"><?php echo $category['thongbao']; ?></p>
            <?php }else { ?>
            <div class="tieude">
                <a href="<?php echo $category['href']; ?>">
                    <h2><?php echo $category['name']; ?></h2>
                </a>
            </div>

            <?php foreach ($category['products'] as $product) { ?>
            <div class="product-layout product-grid col-lg-15 col-md-15 col-sm-6 col-xs-6">
                <div class="product-thumb">
                    <div class="image">
                        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
                        <?php if ($product['price_sale'] != 0) { ?>
                        <div class="rate-sale">
                            <?php echo $product['rate_sale']; ?><span>%</span>
                        </div>
                        <?php } ?>
                    </div>
                    <div>
                        <div class="info-product info-category">
                            <div class="caption">
                                <h4><b><?php echo $product['model']; ?></b></h4>
                                <p>
                                    <?php if ($product['price'] != 0) { ?>
                                    <span class="price"><?php echo $product['price']; ?></span>
                                    <?php } else { ?>
                                    <span class="price">Giá: Call</span>
                                </p>
                                <?php } ?>
                            </div>
                            <div class="button-cart" style="display: none;">
                                <a href="<?php echo $product['href']; ?>"><button id="button-cart" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_cart; ?></span></button></a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <?php } ?>
            <?php } ?>
        </div>
        <?php } ?>

      <?php } ?>

      </div>
<?php } else { ?>
        <div class="col-md-9 category-description"><?php echo $descriptions;?>    
        <div class="xemthemspthuchienct">
      <b><a class="pull-right" href="#" style="color:red;">>>> Xem thêm </a></b>
    </div>  
    </div>
    <div id="content" class="ct-chidren col-md-9">
    <div style="display: none;">
        <?php if (isset($useo_heading_title2)) {?><h2 class = "useo_h2"><?php echo $useo_heading_title2; ?></h2><!-- Ultimate Seo Package --><?php } ?>
    </div>
            <?php foreach ($products as $product) { ?>
            <div class="product-layout product-grid col-lg-15 col-md-15 col-sm-6 col-xs-6">
                <div class="product-thumb">
                    <div class="image">
                        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
                        <?php if ($product['price_sale'] != 0) { ?>
                        <div class="rate-sale">
                            <?php echo $product['rate_sale']; ?><span>%</span>
                        </div>
                        <?php } ?>
                    </div>
                    <div>
                        <div class="info-product info-category">
                            <div class="caption">
                                <h4><b><?php echo $product['model']; ?></b></h4>
                                <p>
                                    <?php if ($product['price'] != 0) { ?>
                                    <span class="price"><?php echo $product['price']; ?></span>
                                    <?php } else { ?>
                                    <span class="price">Giá: Call</span>
                                </p>
                                <?php } ?>
                            </div>
                            <div class="button-cart" style="display: none;">
                                <a href="<?php echo $product['href']; ?>"><button id="button-cart" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_cart; ?></span></button></a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <?php } ?>
      </div>
<?php } ?>
    <?php echo $column_right; ?></div>
    <?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>
