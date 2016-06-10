<div class="titlefeature">
  <div class="container">
    <?php echo $heading_title; ?>
  </div>
</div>
<div class="featured"> 
  <div class="container">   
    <div class="row">
      <?php foreach ($products as $product) { ?>
        <div class="col-md-2 col-sm-3 col-xs-6">
          <div class="product-content">
            <div class="image-product">
                <a href="<?php echo $product['href']; ?>">
      		        <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive"/>
                </a>
            </div>
            <div class="info-product">
              <h4><a class="name-card" href="<?php echo $product['href']; ?>"> <?php echo $product['name']; ?></a></h4>
                <div class="">
                  <?php if ($product['price'] != 0) { ?>
                  <?php if( $product['special'] != ''): ?>
                    <div class="price">
                      <span class="price"><?php echo $product['special']; ?></span>
                    </div>
                    <div class="price-sale"><?php echo $product['price']; ?></div>
                    <span class="price-percent">-<?php echo $product['specialper']; ?> %</span>
                  <?php else:?>
                  <div class="price">
                    <span class="price"><?php echo $product['price']; ?></span>
                  </div>
                  <div class=""> &nbsp</div>
                  <div class="price-percent" style="background-color: #ffffff"> &nbsp</div>
                  <?php endif;?>

                    <?php } else { ?>
                    <span class="price">Giá: Call</span>
                  <?php } ?>
                </div>
              </div>
              <div class="button-cart">
                  <a href="<?php echo $product['href']; ?>"><button id="button-cart" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_cart; ?></span></button></a>
              </div>
            </div>
          </div>
      <?php } ?>
    </div>
  </div>
</div>