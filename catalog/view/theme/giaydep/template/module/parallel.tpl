
<div id="paradise" class="parallel">
  <div class="title-parallel">
    <?php echo $heading_title; ?>
  </div>

  <?php foreach ($products as $product) { ?>
    <div class="product-content product-tab product-cat product-parallel">
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
                    <span class="price"> <?php echo $product['special']; ?></span><br/>
                    <span class="price-sale"><?php echo $product['price']; ?></span>
                </div>
                <span class="percent-right">
                  <span class="price-percent">-<?php echo $product['specialper']; ?> %</span>
                </span>
                <div class="clearfix"></div>
                <?php else:?>
                    <div class="price"><?php echo $product['price']; ?></div>
                    <div class=""> &nbsp</div>
                <?php endif;?>
                <?php } else { ?>
                <span class="price">Giá: Call</span>
                <?php } ?>
            </div>
            <h4 class="alignleft"><a class="name-card" href="<?php echo $product['href']; ?>" ><?php echo $product['name']; ?></a></h4>
        </div>
    </div>
  <?php } ?>
</div>

<script>

</script>
