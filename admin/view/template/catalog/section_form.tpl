<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<div class="page-header">
    <div class="container-fluid">
        <div class="pull-right">
            <button type="submit" form="form-section" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
            <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
        </div>
        <div class="panel-body">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-section" class="form-horizontal">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
                    <li><a href="#tab-data" data-toggle="tab"><?php echo $tab_data; ?></a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="tab-general">
                        <ul class="nav nav-tabs" id="language">
                            <?php foreach ($languages as $language) { ?>
                            <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                            <?php } ?>
                        </ul>
                        <div class="tab-content">
                            <?php foreach ($languages as $language) { ?>
                            <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                                <div class="form-group required">
                                    <label class="col-sm-2 control-label" for="input-title<?php echo $language['language_id']; ?>"><?php echo $entry_title; ?></label>
                                    <div class="col-sm-10">
                                        <input type="text" name="section_description[<?php echo $language['language_id']; ?>][name]" size="100" value="<?php echo isset($section_description[$language['language_id']]) ? $section_description[$language['language_id']]['name'] : ''; ?>" />
                                        <?php if (isset($error_title[$language['language_id']])) { ?>
                                        <div class="text-danger"><?php echo $error_title[$language['language_id']]; ?></div>
                                        <?php } ?>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="input-description"><?php echo $entry_description; ?></label>
                                    <div class="col-sm-10">
                                        <textarea name="section_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($section_description[$language['language_id']]) ? $section_description[$language['language_id']]['description'] : ''; ?></textarea>
                                        <?php if (isset($error_description[$language['language_id']])) { ?>
                                        <div class="text-danger"><?php echo $error_description[$language['language_id']]; ?></div>
                                        <?php } ?>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="input-meta-description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_description; ?></label>
                                    <div class="col-sm-10">
                                        <textarea name="section_description[<?php echo $language['language_id']; ?>][meta_description]" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($section_description[$language['language_id']]) ? $section_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="input-meta-keyword<?php echo $language['language_id']; ?>"><?php echo $entry_meta_keyword; ?></label>
                                    <div class="col-sm-10">
                                        <textarea name="section_description[<?php echo $language['language_id']; ?>][meta_keyword]" rows="5" placeholder="<?php echo $entry_meta_keyword; ?>" id="input-meta-keyword<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($section_description[$language['language_id']]) ? $section_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
                                    </div>
                                </div>
                            </div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab-data">
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_parent; ?></label>
                            <div class="col-sm-10">
                                <select name="parent_id">

                                    <option value="0"><?php echo $text_none; ?></option>

                                    <?php foreach ($sections as $section) { ?>

                                    <?php if ($section['section_id'] == $parent_id) { ?>

                                    <option value="<?php echo $section['section_id']; ?>" selected="selected"><?php echo $section['name']; ?></option>

                                    <?php } else { ?>

                                    <option value="<?php echo $section['section_id']; ?>"><?php echo $section['name']; ?></option>

                                    <?php } ?>

                                    <?php } ?>

                                </select>
                                </div>
                            </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-image"><?php echo $entry_image; ?></label>
                            <div class="col-sm-10">
                                <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                <input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-keyword"><span data-toggle="tooltip" title="<?php echo $help_keyword; ?>"><?php echo $entry_keyword; ?></span></label>
                            <div class="col-sm-10">
                                <input type="text" name="keyword" value="<?php echo $keyword; ?>" placeholder="<?php echo $entry_keyword; ?>" id="input-keyword" class="form-control" />
                                <?php if ($error_keyword) { ?>
                                <div class="text-danger"><?php echo $error_keyword; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <!--<div class="form-group">
                            <label class="col-sm-2 control-label" for="input-bottom"><span data-toggle="tooltip" title="<?php echo $help_bottom; ?>"><?php echo $entry_bottom; ?></span></label>
                            <div class="col-sm-10">
                                <div class="checkbox">
                                    <label>
                                        <?php if ($bottom) { ?>
                                        <input type="checkbox" name="bottom" value="1" checked="checked" id="input-bottom" />
                                        <?php } else { ?>
                                        <input type="checkbox" name="bottom" value="1" id="input-bottom" />
                                        <?php } ?>
                                        &nbsp; </label>
                                </div>
                            </div>
                        </div>-->
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                            <div class="col-sm-10">
                                <select name="status" id="input-status" class="form-control">
                                    <?php if ($status) { ?>
                                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                    <option value="0"><?php echo $text_disabled; ?></option>
                                    <?php } else { ?>
                                    <option value="1"><?php echo $text_enabled; ?></option>
                                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab-design">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <td class="text-left"><?php echo $entry_store; ?></td>
                                    <td class="text-left"><?php echo $entry_layout; ?></td>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td class="text-left"><?php echo $text_default; ?></td>
                                    <td class="text-left"><select name="section_layout[0]" class="form-control">
                                            <option value=""></option>
                                            <?php foreach ($layouts as $layout) { ?>
                                            <?php if (isset($section_layout[0]) && $section_layout[0] == $layout['layout_id']) { ?>
                                            <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                                            <?php } else { ?>
                                            <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                                            <?php } ?>
                                            <?php } ?>
                                        </select></td>
                                </tr>
                                <?php foreach ($stores as $store) { ?>
                                <tr>
                                    <td class="text-left"><?php echo $store['name']; ?></td>
                                    <td class="text-left"><select name="section_layout[<?php echo $store['store_id']; ?>]" class="form-control">
                                            <option value=""></option>
                                            <?php foreach ($layouts as $layout) { ?>
                                            <?php if (isset($section_layout[$store['store_id']]) && $section_layout[$store['store_id']] == $layout['layout_id']) { ?>
                                            <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                                            <?php } else { ?>
                                            <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                                            <?php } ?>
                                            <?php } ?>
                                        </select></td>
                                </tr>
                                <?php } ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript"><!--

    function image_upload(field, thumb) {

        $('#dialog').remove();



        $('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');



        $('#dialog').dialog({

            title: '<?php echo $text_image_manager; ?>',

            close: function (event, ui) {

                if ($('#' + field).attr('value')) {

                    $.ajax({

                        url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),

                        dataType: 'text',

                        success: function(data) {

                            $('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');

                        }

                    });

                }

            },

            bgiframe: false,

            width: 800,

            height: 400,

            resizable: false,

            modal: false

        });

    };

    //--></script>

<script type="text/javascript"><!--
    <?php foreach ($languages as $language) { ?>
        $('#input-description<?php echo $language['language_id']; ?>').summernote({
            height: 300
        });
    <?php } ?>
    //--></script>
<script type="text/javascript"><!--
    $('#language a:first').tab('show');
    //--></script></div>
<?php echo $footer; ?>