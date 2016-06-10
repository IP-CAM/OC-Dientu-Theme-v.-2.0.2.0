<?php  if(1):?>

<div class="sale-tab">

  <!-- Nav tabs -->
  <ul class="nav" role="tablist">
    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Recent Sale<i></i></a></li>
    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Next Sale<i></i></a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="home">
      <?php if(isset($products[0])):?>
      <div class="product-content product-tab">
        <div class="image-product">
          <a href="<?php echo $products[0]['href']; ?>">
            <img src="<?php echo $products[0]['thumb']; ?>" alt="<?php echo $products[0]['name']; ?>" title="<?php echo $products[0]['name']; ?>" class="img-responsive"/>
          </a>
        </div>
        <div class="info-product">
          <h4><a class="name-card" href="<?php echo $products[0]['href']; ?>" ><?php echo $products[0]['name']; ?></a></h4>
          <div class="">
            <?php if ($products[0]['price'] != 0) { ?>
            <div class="price-group">
              <?php if( $products[0]['special']): ?>
                <span class="price"> <?php echo $products[0]['special']; ?></span><br/>
                <span class="price-sale"><?php echo $products[0]['price']; ?></span>
              <?php endif;?>
            </div>
            <span class="percent-right">
              <span class="price-percent">-<?php echo $products[0]['specialper']; ?> %</span>
            </span>
            <div class="clearfix"></div>
            <?php } else { ?>
            <span class="price">Giá: Call</span>
            <?php } ?>
          </div>
        </div>
      </div>
      <?php endif;?>
    </div>
    <div role="tabpanel" class="tab-pane" id="profile">
      <?php if(isset($products[1])):?>
      <div class="product-content product-tab">
        <div class="image-product">
          <a href="<?php echo $products[1]['href']; ?>">
            <img src="<?php echo $products[1]['thumb']; ?>" alt="<?php echo $products[1]['name']; ?>" title="<?php echo $products[1]['name']; ?>" class="img-responsive"/>
          </a>
        </div>
        <div class="info-product">
          <h4><a class="name-card" href="<?php echo $products[1]['href']; ?>" ><?php echo $products[1]['name']; ?></a></h4>
          <div class="">
            <?php if ($products[1]['price'] != 0) { ?>
            <div class="price-group">
              <?php if( $products[1]['special']): ?>
                <span class="price"><?php echo $products[1]['special']; ?></span><br/>
                <span class="price-sale"> <?php echo $products[1]['price']; ?></span>
              <?php endif;?>
            </div>
            <span class="percent-right">
              <span class="price-percent">-<?php echo $products[1]['specialper']; ?> %</span>
            </span>
            <div class="clearfix"></div>
            <?php } else { ?>
            <span class="price">Giá: Call</span>
            <?php } ?>
          </div>
        </div>
      </div>
      <?php endif;?>
    </div>
  </div>

</div>

<?php else:?>
<h3><?php echo $heading_title; ?></h3>
<div class="row">
  <?php foreach ($products as $product) { ?>
  <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
    <div class="product-thumb transition">
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
      <div class="caption">
        <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
        <p><?php echo $product['description']; ?></p>
        <?php if ($product['rating']) { ?>
        <div class="rating">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($product['rating'] < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($product['price']) { ?>
        <p class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
          <?php } ?>
          <?php if ($product['tax']) { ?>
          <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
          <?php } ?>
        </p>
        <?php } ?>
      </div>
      <div class="button-group">
        <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
      </div>
    </div>
  </div>
  <?php } ?>
</div>
<?php endif;?>