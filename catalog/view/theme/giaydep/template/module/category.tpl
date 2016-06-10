<?php if($module_id==562) { ?>
  <div class="navi-box">
  <div class="cate-title" title="Danh mục sản phẩm">Danh mục<i></i></div>
  <div class="catemenuBaza nav-for-page" id="baza-navcat" style="display: none">
    <div class="catesmenu">
      <ul class="level1">
        <?php foreach ($categories as $category): ?>
          <?php if ($category['category_id'] == $category_id):?>
          <li class="araSubmenu" data-color="#65D8DF" data-id="gjnG9NG4">
            <a class="navimn1 active" title="<?php echo $category['name']; ?>" href="<?php echo $category['href']; ?>" target="_blank"><span class="mn-icon-n0"></span><?php echo $category['name']; ?></a>
              <?php if ($category['children']): ?>
              <ul class="level2" style="width: 200px; display: none;">
                <?php foreach ($category['children'] as $child):?>
                  <?php if ($child['category_id'] == $child_id):?>
                    <li><a href="<?php echo $child['href']; ?>" target="_blank" class="active"><?php echo $child['name']; ?></a></li>
                  <?php else:?>
                    <li><a href="<?php echo $child['href']; ?>" target="_blank" class=""><?php echo $child['name']; ?></a></li>
                  <?php endif?>
                <?php endforeach;?>
              </ul>
              <?php endif;?>
          </li>

          <?php else:?>
            <li class="araSubmenu" data-color="#65D8DF" data-id="gjnG9NG4">
              <a class="navimn1" title="<?php echo $category['name']; ?>" href="<?php echo $category['href']; ?>" target="_blank"><span class="mn-icon-n0"></span><?php echo $category['name']; ?></a>
              <?php if ($category['children']): ?>
              <ul class="level2" style="width: 200px; display: none;">
                <?php foreach ($category['children'] as $child):?>
                <li><a href="<?php echo $child['href']; ?>" target="_blank" class=""><?php echo $child['name']; ?></a></li>
                <?php endforeach;?>
              </ul>
              <?php endif;?>
            </li>
          <?php endif?>
        <?php endforeach;?>
      </ul>
    </div>
  </div>
</div>

<script type="text/javascript">
  $(document).ready(function(){
    $(".cate-title").mouseenter(function(){
      $("#baza-navcat").css("display","block")
    });

    $(".navimn1").mouseenter(function(){
      $(this).next().css("display","block")
    });

    $(".navimn1").mouseleave(function(){
      if (!$(this).next().is(":hover")) {
        $(this).next().css("display","none");
      }

    });

    $("ul.level1").mouseleave(function(){
      $("#baza-navcat").css("display","none")
    });

    $(".cate-title").mouseleave(function(){
      if (!$(this).next().is(":hover")) {
        $(this).next().css("display","none");
      }
    });
  });
</script>


<?php } else if($module_id==566) { //chi tiet san pham?>
<div class="navi-box red-box">
  <div class="cate-title" title="Danh mục sản phẩm">Danh mục<i></i></div>
  <div class="catemenuBaza nav-for-page" id="baza-navcat" style="display: none">
    <div class="catesmenu">
      <ul class="level1">
        <?php foreach ($categories as $category): ?>
        <?php if ($category['category_id'] == $category_id):?>
        <li class="araSubmenu" data-color="#65D8DF" data-id="gjnG9NG4">
          <a class="navimn1 active" title="<?php echo $category['name']; ?>" href="<?php echo $category['href']; ?>" target="_blank"><span class="mn-icon-n0"></span><?php echo $category['name']; ?></a>
          <?php if ($category['children']): ?>
          <ul class="level2" style="width: 200px; display: none;">
            <?php foreach ($category['children'] as $child):?>
            <?php if ($child['category_id'] == $child_id):?>
            <li><a href="<?php echo $child['href']; ?>" target="_blank" class="active"><?php echo $child['name']; ?></a></li>
            <?php else:?>
            <li><a href="<?php echo $child['href']; ?>" target="_blank" class=""><?php echo $child['name']; ?></a></li>
            <?php endif?>
            <?php endforeach;?>
          </ul>
          <?php endif;?>
        </li>

        <?php else:?>
        <li class="araSubmenu" data-color="#65D8DF" data-id="gjnG9NG4">
          <a class="navimn1" title="<?php echo $category['name']; ?>" href="<?php echo $category['href']; ?>" target="_blank"><span class="mn-icon-n0"></span><?php echo $category['name']; ?></a>
          <?php if ($category['children']): ?>
          <ul class="level2" style="width: 200px; display: none;">
            <?php foreach ($category['children'] as $child):?>
            <li><a href="<?php echo $child['href']; ?>" target="_blank" class=""><?php echo $child['name']; ?></a></li>
            <?php endforeach;?>
          </ul>
          <?php endif;?>
        </li>
        <?php endif?>
        <?php endforeach;?>
      </ul>
    </div>
  </div>
</div>

<script type="text/javascript">
  $(document).ready(function(){
    $(".cate-title").mouseenter(function(){
      $("#baza-navcat").css("display","block")
    });

    $(".navimn1").mouseenter(function(){
      $(this).next().css("display","block")
    });

    $(".navimn1").mouseleave(function(){
      if (!$(this).next().is(":hover")) {
        $(this).next().css("display","none");
      }

    });

    $("ul.level1").mouseleave(function(){
      $("#baza-navcat").css("display","none")
    });

    $(".cate-title").mouseleave(function(){
      if (!$(this).next().is(":hover")) {
        $(this).next().css("display","none");
      }
    });
  });
</script>

<?php } else { ?>
<div id="id<?php echo $module_id; ?>">
     <div class="bgheading">
      <h3 class="cat-title"><?php echo $heading_title; ?></h3>
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