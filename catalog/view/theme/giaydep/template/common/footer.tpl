<footer xmlns="http://www.w3.org/1999/html">
  <?php echo $footer_top; ?>

  <div class="top-footer slogan-content">
    <div class="container">
      <div class="row">
        <div class="col-md-4 info-top">
          <div class="info-header">công ty linh kiện điện tử việt nam</div>
          <span>Hotline: <?php echo $hotline; ?></span>
          <span> Email: <?php echo $email;?></span>
          <span>Thời gian phục vụ <?php echo $timeopen?></span>

        </div>
        <div class="col-md-2 info-top">
          <div class="info-header">Giới thiệu chung</div>
          <?php foreach ($informations as $information) { ?>
          <a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a>
          <?php } ?>

        </div>

        <div class="col-md-2 info-top">
          <div class="info-header">Hỗ trợ mua hàng</div>
          <span>Hotline: <?php echo $hotline; ?></span>
          <span> Email: <?php echo $email;?></span>
          <span>Thời gian phục vụ <?php echo $timeopen?></span>
        </div>

        <div class="col-md-4 info-top">
          <div class="info-header">Các hình thức thanh toán</div>
          <span><?php echo $name; ?></span>
          <span>Địa chỉ: <?php echo $address; ?></span>
          <span>Tel: <?php echo $phone?></span>
          <span>Email: <?php echo $email?></span>
        </div>
      </div>
    </div>
  </div>

  <div class="infofooter">
    <div class="container">
      <div class="row">
        <div class="infomation-footer">
           &copy; Bản quyền thuộc về <span class="name-footer"><?php echo $name; ?></span>  | Cung cấp bởi TGMSS
        </div>
        <script type="text/javascript">
        (function($){$.fn.equalHeights=function(minHeight,maxHeight){tallest=(minHeight)?minHeight:0;this.each(function(){if($(this).height()>tallest){tallest=$(this).height()}});if((maxHeight)&&tallest>maxHeight)tallest=maxHeight;return this.each(function(){$(this).height(tallest)})}})(jQuery)
        $(window).load(function(){
        if($(".titlheighfooter").length){
        $(".titlheighfooter").equalHeights()}
        })
        </script>
      </div>
    </div>
  </div>
</footer>
<script src="catalog/view/javascript/bootstrap/js/bootstrap-dropdown-multilevel.js" type="text/javascript"> </script>
</body>
</html>