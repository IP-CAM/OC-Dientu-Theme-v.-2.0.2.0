<footer xmlns="http://www.w3.org/1999/html">
  <div class="top-footer">
    <div class="container">
      <div class="row slogan-header">
        <div class="col-md-4 slogan">
          <span class="slogan-ic1 mnft_ic">
            CAM KẾT 100% CHÍNH HÃNG<br/>
            <span>nguồn gốc, xuất xứ sản phẩm rõ ràng</span>
          </span>
        </div>
        <div class="col-md-4 slogan">
          <span class="slogan-ic2 mnft_ic">
            ĐÓNG GÓI CẨN THẬN<br/>
            <span>đảm bảo độ an toàn cho sản phẩm</span>
          </span>
        </div>
        <div class="col-md-4 slogan">
          <span class="slogan-ic3 mnft_ic">
            XEM HÀNG TRƯỚC KHI NHẬN<br/>
            <span>quyền lợi tối đa cho khách hàng</span>
          </span>
        </div>
      </div>
      <div class="row slogan-content">
        <div class="col-md-4 info-top">
          <div class="info-header">thông tin cần biết</div>
          <?php foreach ($informations as $information) { ?>
          <a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a>
          <?php } ?>

        </div>
        <div class="col-md-4 info-top">
          <div class="info-header">Chăm sóc khách hàng</div>
            <span>Hotline: <?php echo $hotline; ?></span>
            <span> Email: <?php echo $email;?></span>
          <span>Thời gian phục vụ <?php echo $timeopen?></span>
        </div>
        <div class="col-md-4 info-top">
          <div class="info-header">Hệ thống showroom</div>
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
        <div class="infomation-footer titlefooter">
            <h5 class="titlheighfooter"><?php echo $name; ?></h5>
            <ul class="list-unstyled">
              <li><i class="fa fa-map-marker" aria-hidden="true"></i> Địa chỉ: <?php echo $address; ?></li>
              <li><i class="fa fa-phone" aria-hidden="true"></i> Tel: <?php echo $hotline; ?></li>
		          <li><i class="fa fa-envelope-o" aria-hidden="true"></i> Email: <?php echo $email;?></li>
            </ul>
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