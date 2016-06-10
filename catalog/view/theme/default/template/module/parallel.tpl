
<div id="paradise" class="parallel">
  <div class="tieudehome">
  <div class="khungspdthuchien bacgroundhome col-md-6 col-sm-6 col-xs-12">
  <h3><?php echo $heading_title; ?></h3>
  </div>
  </div>
  <?php foreach ($products as $product) { ?>
  <div class="product-layout col-lg-15 col-md-15 col-sm-6 col-xs-6">
    <div class="product-content">
      <div class="image-product">
          <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
          <?php if ($product['price_sale'] != 0) { ?>
              <div class="rate-sale">
                  <?php echo $product['rate_sale']; ?><span>%</span>
              </div>
          <?php } ?>
      </div>
      <div class="info-product">
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
      </div>
    </div>
  </div>
  <?php } ?>
</div>

<script>

</script>
