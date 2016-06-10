<div id="slideshow<?php echo $module; ?>" class="owl-carousel" style="opacity: 1;">
    <?php foreach ($banners as $banner) { ?>
    <div class="item">
        <?php if ($banner['link']) { ?>
        <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" title="<?php echo $banner['title']; ?>"/>
        </a>
        <div class="bannertitle">
            <?php echo $banner['description']; ?>
        </div>
        <?php } else { ?>
        <img src="<?php echo $banner['image']; ?>" title="<?php echo $banner['title']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
        <div class="bannertitle">
            <?php echo $banner['description']; ?>
        </div>
        <?php } ?>				
    </div>			
    <?php } ?>
</div>  
<script type="text/javascript">
$('#slideshow<?php echo $module; ?>').owlCarousel({
	items: 6,
	autoPlay: 3000,
	singleItem: true,
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: true
});
</script>