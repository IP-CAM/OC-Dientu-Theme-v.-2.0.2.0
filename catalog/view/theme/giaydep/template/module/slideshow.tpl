
<div id="slideshow<?php echo $module; ?>" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

        <?php $active = 'active'; foreach ($banners as $banner): ?>
            <div class="item <?php echo $active; ?>">
                <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>">
                <div class="carousel-caption">
                    ...
                </div>
            </div>
        <?php $active = ""; endforeach;?>
    </div>
    <!-- Controls -->
    <a class="left carousel-control" href="#slideshow<?php echo $module; ?>" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#slideshow<?php echo $module; ?>" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>

</div>

<script type="text/javascript">
//$('#slideshow<?php echo $module; ?>').owlCarousel({
//	items: 6,
//	autoPlay: 3000,
//	singleItem: true,
//	navigation: true,
//	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
//	pagination: true
//});

$('#slideshow<?php echo $module; ?>').carousel({
    interval: 2000
})
</script>