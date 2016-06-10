<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-10'; ?>
    <?php } ?>
    <div id="content-success" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="bg-grey">
        <h1 class="mess-title"><?php echo $heading_title; ?></h1>
        <?php echo $text_message; ?>
      </div>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-orange"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>

<?php  if(isset($link_pay)&&isset($code_pay)&&$code_pay=="nganluong"){ echo '<script language="javascript">location.href ="'.$link_pay.'";</script>'; } ?>