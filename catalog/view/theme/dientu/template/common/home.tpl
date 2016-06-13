<?php echo $header; ?>

<div id="home-header">
    <div class="container">
        <div class="row">
            <?php echo $column_left; ?>
            <?php if ($column_left && $column_right) { ?>
            <?php $class = 'col-sm-6'; ?>
            <?php } elseif ($column_left || $column_right) { ?>
            <?php $class = 'col-sm-12'; ?>
            <?php } else { ?>
            <?php $class = 'col-sm-12'; ?>
            <?php } ?>
            <div id="content" class="<?php echo $class; ?> col-xs-12 col-md-9 no-padding-lr">
                <div class="row slogan-top">
                    <div class="col-md-3 col-sm-3 col-xs-12"><i class="fa fa-star" aria-hidden="true"></i> Sản phẩm chính hãng</span></div>
                    <div class="col-md-3 col-sm-3 col-xs-12"><i class="fa fa-exchange" aria-hidden="true"></i> Bảo hành dài hạn</div>
                    <div class="col-md-3 col-sm-3 col-xs-12"><i class="fa fa-truck" aria-hidden="true"></i> Giao hàng toàn quốc</div>
                    <div class="col-md-3 col-sm-3 col-xs-12"><i class="fa fa-life-ring" aria-hidden="true"></i> Hỗ trợ 24/7</div>
                </div>
                <div class="row">
                    <div class="col-md-9 col-sm-9 col-xs-12 hidden-xs">
                        <?php echo $home_left; ?>
                        <?php echo $content_top; ?>
                    </div>
                    <div class="col-md-3 col-sm-3 hidden-xs no-padding">
                        <?php echo $home_right; ?>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <?php echo $content_bottom; ?>
    </div>
</div>

<?php echo $footer; ?>