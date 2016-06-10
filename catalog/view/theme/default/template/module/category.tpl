<?php if($module_id==187) { ?>
<div id="id<?php echo $module_id; ?>" class="hovercategory col-md-3" style="padding-left: 0px ! important; padding-right: 0px ! important; margin-top: -3px;">
     <div class="bgheading">
      <h3 style="color: white; margin-top: 11px;"><?php echo $heading_title; ?></h3>
<div class="col-md-12 list-group categoryhidden">
  <?php foreach ($categories as $category) { ?>
  <?php if ($category['category_id'] == $category_id) { ?>
  <a href="<?php echo $category['href']; ?>" class="list-group-item th active" ><?php echo $category['name']; ?></a>
  <?php if ($category['children']) { ?>
  <?php foreach ($category['children'] as $child) { ?>
  <?php if ($child['category_id'] == $child_id) { ?>
  <a href="<?php echo $child['href']; ?>" class="list-group-item th active">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
  <?php } else { ?>
  <a href="<?php echo $child['href']; ?>" class="list-group-item th">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
  <?php } ?>
  <?php } ?>
  <?php } ?>
  <?php } else { ?>
  <a href="<?php echo $category['href']; ?>" class="list-group-item th"><?php echo $category['name']; ?></a>
	  <?php if ($category['children']) { ?>
	  <?php foreach ($category['children'] as $child) { ?>
	  <a href="<?php echo $child['href']; ?>" class="list-group-item th">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
	  <?php } ?>
	  <?php } ?>
  <?php } ?>
  <?php } ?>
</div>
	  </div>
</div>
<?php } else if($module_id==415) { ?>
  <div id="id<?php echo $module_id; ?>" class="col-md-3 hidden-sm hidden-xs">
     <div class="bgheading">
      <h3 style="color:white;"><?php echo $heading_title; ?></h3>
    </div>
<div class="list-group catehome catehome2">
  <?php foreach ($categories as $category) { ?>
  <?php if ($category['category_id'] == $category_id) { ?>
  <a href="<?php echo $category['href']; ?>" class="list-group-item th catenamehome active" ><i class="fa fa-chevron-right" aria-hidden="true" style="color: #4C4747;"></i>&nbsp;<?php echo $category['name']; ?></a>
  <?php if ($category['children']) { ?>
  <?php foreach ($category['children'] as $child) { ?>
  <?php if ($child['category_id'] == $child_id) { ?>
  <a href="<?php echo $child['href']; ?>" class="list-group-item th catenamehome active">&nbsp;&nbsp;&nbsp;<?php echo $child['name']; ?></a>
  <?php } else { ?>
  <a href="<?php echo $child['href']; ?>" class="list-group-item th">&nbsp;&nbsp;&nbsp;<?php echo $child['name']; ?></a>
  <?php } ?>
  <?php } ?>
  <?php } ?>
  <?php } else { ?>
  <a href="<?php echo $category['href']; ?>" class="list-group-item th catenamehome"><i class="fa fa-chevron-right" aria-hidden="true" style="color: #4C4747;"></i>&nbsp;<?php echo $category['name']; ?></a>
    <?php if ($category['children']) { ?>
    <?php foreach ($category['children'] as $child) { ?>
    <a href="<?php echo $child['href']; ?>" class="list-group-item th">&nbsp;&nbsp;&nbsp;<?php echo $child['name']; ?></a>
    <?php } ?>
    <?php } ?>
  <?php } ?>
  <?php } ?>
</div>
</div>
<?php } else { ?>
<div id="id<?php echo $module_id; ?>">
     <div class="bgheading">
      <h3 style="color:white;"><?php echo $heading_title; ?></h3>
	  </div>
<div class="list-group catehome">
  <?php foreach ($categories as $category) { ?>
  <?php if ($category['category_id'] == $category_id) { ?>
  <a href="<?php echo $category['href']; ?>" class="list-group-item th catenamehome active" ><i class="fa fa-chevron-right" aria-hidden="true" style="color: #4C4747;"></i>&nbsp;<?php echo $category['name']; ?></a>
  <?php if ($category['children']) { ?>
  <?php foreach ($category['children'] as $child) { ?>
  <?php if ($child['category_id'] == $child_id) { ?>
  <a href="<?php echo $child['href']; ?>" class="list-group-item th catenamehome active">&nbsp;&nbsp;&nbsp;<?php echo $child['name']; ?></a>
  <?php } else { ?>
  <a href="<?php echo $child['href']; ?>" class="list-group-item th">&nbsp;&nbsp;&nbsp;<?php echo $child['name']; ?></a>
  <?php } ?>
  <?php } ?>
  <?php } ?>
  <?php } else { ?>
  <a href="<?php echo $category['href']; ?>" class="list-group-item th catenamehome"><i class="fa fa-chevron-right" aria-hidden="true" style="color: #4C4747;"></i>&nbsp;<?php echo $category['name']; ?></a>
	  <?php if ($category['children']) { ?>
	  <?php foreach ($category['children'] as $child) { ?>
	  <a href="<?php echo $child['href']; ?>" class="list-group-item th">&nbsp;&nbsp;&nbsp;<?php echo $child['name']; ?></a>
	  <?php } ?>
	  <?php } ?>
  <?php } ?>
  <?php } ?>
</div>
</div>
<?php } ?>