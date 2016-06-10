<div class="lastcatheader">
   <span class="titlelastcat"><?php echo $heading_title; ?></span><i class="hidden-md hidden-sm hidden-xs"></i>
</div>

<div class="pro-by-cat">
  <div class="container">
    <div class="row bordertopgrey">
      <div class="col-md-3 product-cat-nav">
        <?php foreach($children as $child):?>
       <a href="<?php echo $child['href']; ?>"> <span>+</span> <?php echo $child['name']; ?></a>
        <?php endforeach;?>
      </div>
      <div class="col-md-9">
        <div class="row">
          <?php foreach ($products as $product) { ?>

            <div class="col-md-15 col-sm-3 col-xs-6 product-content">
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

          <?php } ?>
        </div>
      </div>
    </div>
  </div>
</div>