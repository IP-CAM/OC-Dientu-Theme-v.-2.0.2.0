
<div class=" parallel">
    <h2><?php echo $heading_title; ?></h2>
  <?php foreach ($products as $product) { ?>
  <div class="product-layout col-lg-4 col-md-4 col-sm-6 col-xs-12">
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
              <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
              <p>
                  <?php if ($product['price_sale'] != 0) { ?>
                  <span class="price"><?php echo $product['price_sale']; ?></span>
                  <span class="price-sale"><del><?php echo $product['price']; ?></del></span>
                  <?php } else { ?>
                  <span class="price"><?php echo $product['price']; ?></span>
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
