<footer>
  <div class="infofooter">
    <div class="container">
      <div class="row">
        <div class="col-sm-5 infomation-footer titlefooter">
            <h5 class="titlheighfooter"><?php echo $text_information; ?></h5>
            <ul class="list-unstyled">
              <li><i class="fa fa-map-marker" aria-hidden="true"></i> Địa chỉ: <?php echo $address; ?></li>
              <li><i class="fa fa-phone" aria-hidden="true"></i> Tel: <?php echo $hotline; ?></li>
		          <li><i class="fa fa-envelope-o" aria-hidden="true"></i> Email: <?php echo $email;?></li>
            </ul>
        </div>
        <div class="col-sm-3 about-us titlefooter">
            <h5 class="titlheighfooter"><?php echo $text_extra; ?></h5>
            <ul class="list-unstyled">
  			      <?php if ($informations) { ?>
                <?php foreach ($informations as $information) { ?>
                  <li><i class="fa fa-angle-right" aria-hidden="true"></i><a href="<?php echo $information['href']; ?>"> <?php echo $information['title']; ?></a></li>
                <?php } ?>
              <?php } ?>
            </ul>
        </div>
        <div class="col-sm-4 support titlefooter">
            <h5 class="titlheighfooter"><?php echo $text_service; ?></h5>
            <ul class="list-unstyled">
  			      <li><i class="fa fa-university" aria-hidden="true"></i> <b><?php echo $addresssr2;?></b></li>
              <li>&nbsp;&nbsp;&nbsp;&nbsp; Số tài khoản: <?php echo $telesr2;?></li>
              <li>&nbsp;&nbsp;&nbsp;&nbsp; Chủ tài khoản: <?php echo $nametk;?></li>
  				    <li><i class="fa fa-university" aria-hidden="true"></i> <b><?php echo $addressvp;?></b></li>
              <li>&nbsp;&nbsp;&nbsp;&nbsp; Số tài khoản: <?php echo $televp;?></li>
              <li>&nbsp;&nbsp;&nbsp;&nbsp; Chủ tài khoản: <?php echo $nametk2;?></li>
              <li><i class="fa fa-university" aria-hidden="true"></i> <b><?php echo $addressdd;?></b></li>
              <?php if($teledd) { ?> 
                <li>&nbsp;&nbsp;&nbsp;&nbsp; Số tài khoản: <?php echo $teledd;?></li>
              <?php } ?>
              <?php if($nametk3) { ?>
                <li>&nbsp;&nbsp;&nbsp;&nbsp; Chủ tài khoản: <?php echo $nametk3;?></li>
              <?php } ?>
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
  <div class="copyright">
    <div class="container">
    &copy; Copyright 2013 - 2016. TGMweb - Kho giao diện Web mẫu lớn nhất Việt Nam
    </div>
  </div>
</footer>
<script src="catalog/view/javascript/bootstrap/js/bootstrap-dropdown-multilevel.js" type="text/javascript"> </script>
</body>
</html>