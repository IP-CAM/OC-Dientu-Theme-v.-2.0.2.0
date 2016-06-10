<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" onclick="$('#form').submit();" form="nganluong" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a> <a href="<?php echo $search; ?>" data-toggle="tooltip" title="<?php echo $button_search; ?>" class="btn btn-info"><i class="fa fa-search"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
<div class="box">
  <div class="left"></div>
  <div class="right"></div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      <table class="form" width="100%">
   
         <tr>
          <td><span class="required">*</span><strong><?php echo $entry_receiver; ?></strong></td>
          <td><input name="nganluong_receiver" size="50" type="text" value="<?php echo $nganluong_receiver; ?>"/>
            <?php if ($error_receiver) { ?>
            <span class="error"><?php echo $error_receiver; ?></span>
            <?php } ?>
          </td>
        </tr>
        <tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_merchant; ?></td>
          <td><input type="text" name="nganluong_merchant" value="<?php echo $nganluong_merchant; ?>" />
            <?php if ($error_merchant) { ?>
            <span class="error"><?php echo $error_merchant; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_security; ?></td>
          <td><input type="text" name="nganluong_security" value="<?php echo $nganluong_security; ?>" />
            <?php if ($error_security) { ?>
            <span class="error"><?php echo $error_security; ?></span>
            <?php } ?></td>
        </tr>
         <tr>
          <td><?php echo $entry_callback; ?></td>
          <td><textarea cols="40" rows="5" name="nganluong_callback"><?php echo $nganluong_callback; ?></textarea>
          <br />VD: http://mysite.com/index.php?route=payment/nganluong/callback
          </td>
        </tr>
          <td><strong><?php echo $entry_order_status; ?></strong></td>
          <td><select name="nganluong_order_status_id">
              <?php foreach ($order_statuses as $order_status) { ?>
              <?php if ($order_status['order_status_id'] == $nganluong_order_status_id) { ?>
              <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td><strong><?php echo $entry_status; ?></strong></td>
          <td><select name="nganluong_status">
              <?php if ($nganluong_status) { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td><strong><?php echo $entry_sort_order; ?></strong></td>
          <td><input type="text" name="nganluong_sort_order" value="<?php echo $nganluong_sort_order; ?>" size="1" /></td>
        </tr>
      </table>
    </form>
  </div>
</div>
</div>
</div>
<?php echo $footer; ?>