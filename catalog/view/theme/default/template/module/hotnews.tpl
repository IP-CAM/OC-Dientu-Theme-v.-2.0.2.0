<?php if($module_id==224) { ?>
<div id="id<?php echo $module_id;  ?>" class="row">
    <div class="col-md-12 col-sm-12 col-xs-12 hotnews">
        <div class="nentin" style="height:35px; background-color:#dddddd; width:100%;margin-bottom:15px;">
		<h2 style="padding-left:15px;color:#72a546; text-transform:uppercase;padding-top:5px;"><b><?php echo $heading_title; ?></b></h2>
		</div>
        <?php foreach ($results as $result) { ?>
        <div class="product-layout col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="hotnewcate col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="imagehownewcate col-md-12 col-sm-12 col-xs-12" style="text-align: center;">
                    <a href="<?php echo $result['href']; ?>">
						<img src="<?php echo $result['thumb']; ?>" alt="<?php echo $result['name']; ?>" title="<?php echo $result['name']; ?>" style="max-width: 100%; width: auto;"/>
					</a>
                </div>
                <div class="info-product col-md-12 col-sm-12 col-xs-12" style="text-align: left;">
                        <h4 style="margin-top:5px;">
                            <a class="ahotnew2" href="<?php echo $result['href']; ?>">
                                <?php echo $result['name']; ?>
                            </a>
                        </h4>
                </div>
            </div>
        </div>
        <?php } ?>
    </div>
</div>
<script>
</script>
<?php } else { ?>
<div id="id<?php echo $module_id;  ?>" class="row">
    <div class="col-md-12 col-sm-12 col-xs-12 hotnews">
        <div class="nentin" style="height:35px; background-color:#dddddd; width:100%;margin-bottom:15px;">
        <h2 style="padding-left:15px;color:#72a546; text-transform:uppercase;padding-top:5px;"><b><?php echo $heading_title; ?></b></h2>
        </div>
        <?php foreach ($results as $result) { ?>
        <div class="product-layout col-lg-4 col-md-4 col-sm-6 col-xs-12">
            <div class="hotnewcate col-md-12 col-sm-12 col-xs-12">
                <div class="imagehownewcate col-md-4 col-sm-4 col-xs-12">
                    <a href="<?php echo $result['href']; ?>">
                        <img src="<?php echo $result['thumb']; ?>" alt="<?php echo $result['name']; ?>" title="<?php echo $result['name']; ?>" />
                    </a>
                </div>
                <div class="info-product col-md-8 col-sm-8 col-xs-12" style="text-align: left;">
                    <div class="caption" style="padding-top: 0;">
                        <h4 style="margin-top:5px;"><a class="ahotnew" href="<?php echo $result['href']; ?>"><?php echo $result['name']; ?></a></h4>
                        <?php echo $result['description']; ?>
                    </div>
                    <div class="pull-right">
                        <a style="color: #F00;" href="<?php echo $result['href']; ?>">>>> Đọc thêm</a>
                    </div>
                </div>
            </div>
        </div>
        <?php } ?>
    </div>
</div>
<script>
</script>
<?php } ?>