<?php echo $header; ?>

<div id="home-header">
    <div class="container">
        <div class="row bordertop">
            <?php echo $column_left; ?>
            <?php if ($column_left && $column_right) { ?>
            <?php $class = 'col-sm-6'; ?>
            <?php } elseif ($column_left || $column_right) { ?>
            <?php $class = 'col-sm-12'; ?>
            <?php } else { ?>
            <?php $class = 'col-sm-12'; ?>
            <?php } ?>
            <div id="content" class="<?php echo $class; ?> col-xs-12 col-md-9">
                <div class="row">
                    <div class="col-md-9 col-sm-9 col-xs-12 hidden-xs">
                        <?php echo $content_left_home; ?>
                    </div>
                    <div class="col-md-3 col-sm-3 hidden-xs no-padding">
                        <?php echo $content_right_home; ?>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 no-padding-right">
                        <?php echo $content_top; ?>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="home-background"></div>
</div>

<div class="container">
    <div class="row">
        <?php echo $content_bottom; ?>
    </div>
</div>

<?php echo $footer; ?>