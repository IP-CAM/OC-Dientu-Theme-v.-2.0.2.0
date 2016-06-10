<?php echo $header; ?>
<?php echo $content_top; ?>
<?php echo $content_bottom; ?>
<div class="container">
    <div class="row">
        <?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>">
            <div class="row">
                <div class="col-md-9 col-sm-9 col-xs-12">
                    <?php echo $content_left_home; ?>
                </div>
                <div class="col-md-3 col-sm-3 hidden-xs">
                    <?php echo $content_right_home; ?>
                </div>
            </div>
    	</div>
        <?php echo $column_right; ?>
	</div>
</div>
<?php echo $footer; ?>