<?php echo $header; ?>
<div id="cat-nav">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <?php
              if($category_id != 0){
                    echo $content_top;
              }
        ?>
            </div>
        </div>

    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="pro-filter">
            <?php foreach ($sorts as $sorts):?>
            <a class="<?php echo $sorts['class'];?>" href="<?php echo $sorts['href'];?>"> <?php echo $sorts['text']; ?> </a>
            <?php endforeach;?>
            </div>
    </div>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
    </div>

    <div class="row">
        <div id="content-category" class="ct-chidren col-md-12">
            <?php foreach ($products as $product): ?>
            <div class="col-md-15 col-sm-4 col-xs-6 no-padding">
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
            <?php endforeach;?>
            <?php echo $column_right; ?>
        </div>

    <?php echo $content_bottom; ?>
    </div>

</div>

<?php echo $footer; ?>
