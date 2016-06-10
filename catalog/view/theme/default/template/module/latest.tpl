<?php if($module_id==212){ ?>
<div id="id<?php echo $module_id; ?>" class="row col-md-9 col-sm-9 col-xs-12" >
<div class="tieudehome">
<div class="khungspdthuchien bacgroundhome col-md-6 col-sm-6 col-xs-12">
<h3><?php echo $heading_title; ?></h3>
</div>
<!-- <div class="xemthemspthuchien col-md-6 col-sm-6 col-xs-12">
  <b><a class="pull-right" href="#">>>> Xem thêm </a></b>
 </div> -->
</div>
  <?php
  $i=0;
  foreach ($products as $product) { 
  $i++;
  if($i<4){
  ?>
  <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
    <div class="product-thumb transition">
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
    </div>
  </div>
  <?php } ?>
  <?php } ?>
</div>
<?php } else if($module_id==0){ ?>
<div id="id<?php echo $module_id; ?>" class="row col-md-12 col-sm-12 col-xs-12 pdsphome">
<div class="tieudehome">
<div class="khungspdthuchien bacgroundhome col-md-6 col-sm-12 col-xs-12">
<h3><?php echo $heading_title; ?></h3>
</div>
<div class="xemthemspthuchienct col-md-12 col-sm-12 col-xs-12">
      <b><a class="pull-right" href="<?php echo $spdth; ?>" style="color:red;">>>> Xem thêm </a></b>
    </div>
</div>
<ul id="flexiselDemo3">
  <?php
  $i=0;
  foreach ($products as $product) { 
  $i++;
  if($i<5){
  ?>
  <li>
  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-left: 5px; padding-right: 5px;">
    <div class="product-thumb transition">
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
    </div>
  </div>
  </li>
  <?php } ?>
  <?php } ?>
</ul>
</div>
<script type="text/javascript">
$(window).load(function() {
    $("#flexiselDemo3").flexisel({
        visibleItems: 4,
        animationSpeed: 1000,
        autoPlay: true,
        autoPlaySpeed: 3000,            
        pauseOnHover: true,
        enableResponsiveBreakpoints: true,
        responsiveBreakpoints: { 
            portrait: { 
                changePoint:480,
                visibleItems: 2
            }, 
            landscape: { 
                changePoint:640,
                visibleItems: 2
            },
            tablet: { 
                changePoint:768,
                visibleItems: 3
            }
        }
    });
});
</script>
<?php }else{ ?>
<div id="id<?php echo $module_id; ?>" class="row" >
  <div class="tieudehome">
  <div class="khungspdthuchien bacgroundhome col-md-6 col-sm-6 col-xs-12">
  <h3><?php echo $heading_title; ?></h3>
  </div>
  </div>
  <?php foreach ($products as $product) {  ?>  
  <div class="col-lg-15 col-md-15 col-sm-6 col-xs-6 mbtv">
    <div class="product-thumb2 transition">
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" width="100%"/></a></div>
    </div>
  </div>
  <?php } ?>
</div>
<?php } ?>
