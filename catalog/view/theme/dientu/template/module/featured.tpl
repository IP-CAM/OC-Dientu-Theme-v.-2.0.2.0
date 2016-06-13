<?php if($name_featured == 'Banner bottom'):?>
<div class="featured-bottom border">
  <div class="row">
  <?php foreach ($products as $product): ?>
            <div class="col-md-3 col-sm-3 col-xs-6 product-content no-border">
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
                  <?php else:?>
                  <div class="price">
                    <span class="price"><?php echo $product['price']; ?></span>
                  </div>
                  <?php endif;?>

                  <?php } else { ?>
                  <span class="price">Giá: Call</span>
                  <?php } ?>
                </div>
              </div>
            </div>
  <?php endforeach;?>
  </div>
</div>
<?php else: if($name_featured == 'Banner right'):?>
<div class="featured-right border">
    <?php foreach ($products as $product): ?>
    <div class="product-vertical clearfix">
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
          <?php else:?>
          <div class="price">
            <span class="price"><?php echo $product['price']; ?></span>
          </div>
          <?php endif;?>

          <?php } else { ?>
          <span class="price">Giá: Call</span>
          <?php } ?>
        </div>
      </div>
    </div>
    <?php endforeach;?>
</div>

    <?php else:?>

      <div class="titlefeature">
        <div class="container">
          <?php echo $heading_title; ?>
        </div>
      </div>
      <div class="featured">
        <div class="container">
          <div class="row">
            <?php foreach ($products as $product) { ?>
              <div class="col-md-2 col-sm-3 col-xs-6 no-padding-lr">
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
                        <?php else:?>
                        <div class="price">
                          <span class="price"><?php echo $product['price']; ?></span>
                        </div>
                        <?php endif;?>

                          <?php } else { ?>
                          <span class="price">Giá: Call</span>
                        <?php } ?>
                      </div>
                    </div>
                  </div>
                </div>
            <?php } ?>
          </div>
        </div>
      </div>
      <?php endif;?>
<?php endif;?>