<div class="row mglhome">
<div class="featuredhome">
<div class="headingbox headingboxhome">
<img src="image/menutitle.png" style="margin-left: -20px;">
<hr style="width:100%;height:5px; background:#72a546; border:none;float:right;margin-top:-40px;margin-right: -41px;">
<div class="sp_bcnhat" style="position: absolute;top: 10px;left: 16px;font-size: 22px; color:white;text-transform: uppercase;"><?php echo $heading_title; ?>
</div>
</div>
    <ul>
    <?php foreach ($news as $new) { ?>
    <li><a href="<?php echo $new['href']; ?>"><?php echo $new['title']; ?></a></li>
    <!-- <div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-6">
        <div class="product-content">
            <div class="image-product">
                <a href="<?php echo $new['href']; ?>"><img src="<?php echo $new['thumb']; ?>" alt="<?php echo $new['name']; ?>" title="<?php echo $new['name']; ?>" class="img-responsive"/></a>
            </div>
            <div class="news">
                <div class="news-description">
                    <h4><a href="<?php echo $new['href']; ?>"><?php echo $new['title']; ?></a></h4>
                </div>
            </div>
        </div>
    </div> -->
    <?php } ?>
    </ul>
</div>
</div>