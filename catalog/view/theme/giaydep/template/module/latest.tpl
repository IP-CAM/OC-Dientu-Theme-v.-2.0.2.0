<div class="new-wrapper">
    <div class="no-padding-right">
        <div class="newheader">
            <span><?php echo $heading_title; ?></span>
        </div>
        <div class="border-new">
            <?php foreach ($products as $product):?>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 new-block">
                <a href="<?php echo $product['href']; ?>">
                <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"/>
                </a>
                <div class="new-info">
                    <div class="product-name"><?php echo $product['name']; ?></div>
                    <span class="price"><?php echo $product['price']; ?></span>
                </div>
            </div>
            <?php endforeach; ?>
        </div>
    </div>
</div>