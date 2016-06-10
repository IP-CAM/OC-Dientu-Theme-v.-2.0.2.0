<div class="titlefeature">
  <div class="container">
    <?php echo $heading_title; ?>
  </div>
</div>
<div class="featured"> 
  <div class="container">   
    <div class="row">
      <?php foreach ($products as $product) { ?>
        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6 col-xs-17">
          <div class="product-content">
            <div class="image-product">
                <a href="<?php echo $product['href']; ?>">
      		        <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive"/>
                </a>
            </div>
            <div class="info-product">
              <h4><?php echo $product['name']; ?></h4>
              <div class="row">
                <div class="modelproduct col-md-5 col-sm-5 col-xs-12">
                    Mã số: <?php echo $product['model']; ?>
                </div>
                <div class="alignright col-md-7 col-sm-7 col-xs-12">
                  <?php if ($product['price'] != 0) { ?>
                    <span class="price"><?php echo $product['price']; ?></span>
                    <?php } else { ?>
                    <span class="price">Giá: Call</span>
                  <?php } ?>
                </div>
              </div>
              <div class="button-cart" style="display: none;">
                  <a href="<?php echo $product['href']; ?>"><button id="button-cart" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_cart; ?></span></button></a>
              </div>
            </div>
          </div>
        </div>
      <?php } ?>
    </div>
  </div>
</div>