<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/supportOnline.css" />

<div class="box">
    <div class="box-heading"><?php echo $heading_title; ?></div>
    <div class="box-content">
        <div class="supportonline">
            <div id="supportonline<?php echo $module; ?>">
                <ul>
                    <?php foreach ($images as $image) { ?>
                    <li>
                        <div class="image-support">
                            <img src="catalog/view/theme/default/image/support_bg.png" title="image" alt="image" style="background: url(<?php echo $image['image']; ?>) no-repeat; background-size: 100%;width: 100%;" />
                        </div>
                        <div class="position">
                            <?php echo $image['position']; ?> - <span><?php echo $image['name']; ?></span> <br/>
                            <?php if($image['phone']){ ?>
                                Call: <?php echo $image['phone']; ?>
                            <?php } ?>
                            <br/>
                            <?php echo $image['email']; ?><br/>
                            <?php if($image['yahoo']){ ?>
                                <a href="ymsgr:sendim?<?php echo $image['yahoo']; ?>"><img src="http://opi.yahoo.com/online?u=<?php echo $image['yahoo']; ?>&amp;t=1" title="<?php echo $image['yahoo']; ?>"></a>
                            <?php } ?>
                            <?php if($image['skype']){ ?>
                                <a href="skype:<?php echo $image['skype']; ?>?chat"><img src="catalog/view/theme/default/image/skype.png"></a>
                            <?php } ?>
                        </div>
                    </li>
                    <div class="clear"></div>
                    <?php } ?>
                </ul>
            </div>
        </div>
    </div>
</div>

