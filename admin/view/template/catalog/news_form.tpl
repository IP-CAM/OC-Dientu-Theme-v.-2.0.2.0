<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<div class="page-header">
    <div class="container-fluid">
        <div class="pull-right">
            <button type="submit" form="form-news" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-news" class="form-horizontal">
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
                <label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_name; ?></label>
                <div class="col-sm-10">
                    <textarea name="news_description[<?php echo $language['language_id']; ?>][title]" cols="80" rows="3"><?php echo isset($news_description[$language['language_id']]) ? $news_description[$language['language_id']]['title'] : ''; ?></textarea>
                    <?php if (isset($error_name[$language['language_id']])) { ?>
                    <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                    <?php } ?>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
                <div class="col-sm-10">
                    <textarea name="news_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>"><?php echo isset($news_description[$language['language_id']]) ? $news_description[$language['language_id']]['description'] : ''; ?></textarea>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-meta-description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_description; ?></label>
                <div class="col-sm-10">
                    <textarea name="news_description[<?php echo $language['language_id']; ?>][meta_description]" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($news_description[$language['language_id']]) ? $news_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-meta-keyword<?php echo $language['language_id']; ?>"><?php echo $entry_meta_keyword; ?></label>
                <div class="col-sm-10">
                    <textarea name="news_description[<?php echo $language['language_id']; ?>][meta_keyword]" rows="5" placeholder="<?php echo $entry_meta_keyword; ?>" id="input-meta-keyword<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($news_description[$language['language_id']]) ? $news_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-tag<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_tag; ?>"><?php echo $entry_tag; ?></span></label>
                <div class="col-sm-10">
                    <input type="text" name="news_tag[<?php echo $language['language_id'][tag]; ?>]" value="<?php echo isset($news_tag[$language['language_id']]) ? $news_tag[$language['language_id']] : ''; ?>" placeholder="<?php echo isset($news_description[$language['language_id']]) ? $news_description[$language['language_id']]['tag'] : ''; ?>" id="input-tag<?php echo $language['language_id']; ?>" class="form-control" />
                </div>
            </div>
        </div>
        <?php } ?>
    </div>
</div>
<div class="tab-pane" id="tab-data">
    <div class="form-group">
        <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_list; ?></label>
        <div class="col-sm-10">
            <div class="scrollbox">

                    <?php $class = 'odd'; ?>

                    <?php foreach ($sections as $section) { ?>

                    <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>

                    <div class="<?php echo $class; ?>">

                        <?php if (in_array($section['section_id'], $news_section)) { ?>

                        <input type="checkbox" name="news_section[]" value="<?php echo $section['section_id']; ?>" checked="checked" />

                        <?php echo $section['name']; ?>

                        <?php } else { ?>

                        <input type="checkbox" name="news_section[]" value="<?php echo $section['section_id']; ?>" />

                        <?php echo $section['name']; ?>

                        <?php } ?>

                    </div>

                    <?php } ?>

                </div>

                <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_keyword; ?></label>
        <div class="col-sm-10">
            <input type="text" name="keyword" value="<?php echo $keyword; ?>" class="form-control" size="60"/>
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
        <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
        <div class="col-sm-10">
            <select name="status" id="input-status" class="form-control">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } ?>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
        <div class="col-sm-10">
            <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" size="2" />
        </div>
    </div>
</div>
<div class="tab-pane" id="tab-links">
    <div class="form-group">
        <label class="col-sm-2 control-label" for="input-manufacturer"><span data-toggle="tooltip" title="<?php echo $help_manufacturer; ?>"><?php echo $entry_manufacturer; ?></span></label>
        <div class="col-sm-10">
            <input type="text" name="manufacturer" value="<?php echo $manufacturer ?>" placeholder="<?php echo $entry_manufacturer; ?>" id="input-manufacturer" class="form-control" />
            <input type="hidden" name="manufacturer_id" value="<?php echo $manufacturer_id; ?>" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="input-category"><span data-toggle="tooltip" title="<?php echo $help_category; ?>"><?php echo $entry_category; ?></span></label>
        <div class="col-sm-10">
            <input type="text" name="category" value="" placeholder="<?php echo $entry_category; ?>" id="input-category" class="form-control" />
            <div id="news-category" class="well well-sm" style="height: 150px; overflow: auto;">
                <?php foreach ($news_categories as $news_category) { ?>
                <div id="news-category<?php echo $news_category['category_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $news_category['name']; ?>
                    <input type="hidden" name="news_category[]" value="<?php echo $news_category['category_id']; ?>" />
                </div>
                <?php } ?>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="input-filter"><span data-toggle="tooltip" title="<?php echo $help_filter; ?>"><?php echo $entry_filter; ?></span></label>
        <div class="col-sm-10">
            <input type="text" name="filter" value="" placeholder="<?php echo $entry_filter; ?>" id="input-filter" class="form-control" />
            <div id="news-filter" class="well well-sm" style="height: 150px; overflow: auto;">
                <?php foreach ($news_filters as $news_filter) { ?>
                <div id="news-filter<?php echo $news_filter['filter_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $news_filter['name']; ?>
                    <input type="hidden" name="news_filter[]" value="<?php echo $news_filter['filter_id']; ?>" />
                </div>
                <?php } ?>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
        <div class="col-sm-10">
            <div class="well well-sm" style="height: 150px; overflow: auto;">
                <div class="checkbox">
                    <label>
                        <?php if (in_array(0, $news_store)) { ?>
                        <input type="checkbox" name="news_store[]" value="0" checked="checked" />
                        <?php echo $text_default; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="news_store[]" value="0" />
                        <?php echo $text_default; ?>
                        <?php } ?>
                    </label>
                </div>
                <?php foreach ($stores as $store) { ?>
                <div class="checkbox">
                    <label>
                        <?php if (in_array($store['store_id'], $news_store)) { ?>
                        <input type="checkbox" name="news_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                        <?php echo $store['name']; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="news_store[]" value="<?php echo $store['store_id']; ?>" />
                        <?php echo $store['name']; ?>
                        <?php } ?>
                    </label>
                </div>
                <?php } ?>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="input-download"><span data-toggle="tooltip" title="<?php echo $help_download; ?>"><?php echo $entry_download; ?></span></label>
        <div class="col-sm-10">
            <input type="text" name="download" value="" placeholder="<?php echo $entry_download; ?>" id="input-download" class="form-control" />
            <div id="news-download" class="well well-sm" style="height: 150px; overflow: auto;">
                <?php foreach ($news_downloads as $news_download) { ?>
                <div id="news-download<?php echo $news_download['download_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $news_download['name']; ?>
                    <input type="hidden" name="news_download[]" value="<?php echo $news_download['download_id']; ?>" />
                </div>
                <?php } ?>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="input-related"><span data-toggle="tooltip" title="<?php echo $help_related; ?>"><?php echo $entry_related; ?></span></label>
        <div class="col-sm-10">
            <input type="text" name="related" value="" placeholder="<?php echo $entry_related; ?>" id="input-related" class="form-control" />
            <div id="news-related" class="well well-sm" style="height: 150px; overflow: auto;">
                <?php foreach ($news_relateds as $news_related) { ?>
                <div id="news-related<?php echo $news_related['news_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $news_related['name']; ?>
                    <input type="hidden" name="news_related[]" value="<?php echo $news_related['news_id']; ?>" />
                </div>
                <?php } ?>
            </div>
        </div>
    </div>
</div>
<div class="tab-pane" id="tab-attribute">
    <div class="table-responsive">
        <table id="attribute" class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <td class="text-left"><?php echo $entry_attribute; ?></td>
                <td class="text-left"><?php echo $entry_text; ?></td>
                <td></td>
            </tr>
            </thead>
            <tbody>
            <?php $attribute_row = 0; ?>
            <?php foreach ($news_attributes as $news_attribute) { ?>
            <tr id="attribute-row<?php echo $attribute_row; ?>">
                <td class="text-left" style="width: 40%;"><input type="text" name="news_attribute[<?php echo $attribute_row; ?>][name]" value="<?php echo $news_attribute['name']; ?>" placeholder="<?php echo $entry_attribute; ?>" class="form-control" />
                    <input type="hidden" name="news_attribute[<?php echo $attribute_row; ?>][attribute_id]" value="<?php echo $news_attribute['attribute_id']; ?>" /></td>
                <td class="text-left"><?php foreach ($languages as $language) { ?>
                    <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                        <textarea name="news_attribute[<?php echo $attribute_row; ?>][news_attribute_description][<?php echo $language['language_id']; ?>][text]" rows="5" placeholder="<?php echo $entry_text; ?>" class="form-control"><?php echo isset($news_attribute['news_attribute_description'][$language['language_id']]) ? $news_attribute['news_attribute_description'][$language['language_id']]['text'] : ''; ?></textarea>
                    </div>
                    <?php } ?></td>
                <td class="text-left"><button type="button" onclick="$('#attribute-row<?php echo $attribute_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
            </tr>
            <?php $attribute_row++; ?>
            <?php } ?>
            </tbody>
            <tfoot>
            <tr>
                <td colspan="2"></td>
                <td class="text-left"><button type="button" onclick="addAttribute();" data-toggle="tooltip" title="<?php echo $button_attribute_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
            </tr>
            </tfoot>
        </table>
    </div>
</div>
<div class="tab-pane" id="tab-option">
<div class="row">
<div class="col-sm-2">
    <ul class="nav nav-pills nav-stacked" id="option">
        <?php $option_row = 0; ?>
        <?php foreach ($news_options as $news_option) { ?>
        <li><a href="#tab-option<?php echo $option_row; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-option<?php echo $option_row; ?>\']').parent().remove(); $('#tab-option<?php echo $option_row; ?>').remove(); $('#option a:first').tab('show');"></i> <?php echo $news_option['name']; ?></a></li>
        <?php $option_row++; ?>
        <?php } ?>
        <li>
            <input type="text" name="option" value="" placeholder="<?php echo $entry_option; ?>" id="input-option" class="form-control" />
        </li>
    </ul>
</div>
<div class="col-sm-10">
    <div class="tab-content">
        <?php $option_row = 0; ?>
        <?php $option_value_row = 0; ?>
        <?php foreach ($news_options as $news_option) { ?>
        <div class="tab-pane" id="tab-option<?php echo $option_row; ?>">
            <input type="hidden" name="news_option[<?php echo $option_row; ?>][news_option_id]" value="<?php echo $news_option['news_option_id']; ?>" />
            <input type="hidden" name="news_option[<?php echo $option_row; ?>][name]" value="<?php echo $news_option['name']; ?>" />
            <input type="hidden" name="news_option[<?php echo $option_row; ?>][option_id]" value="<?php echo $news_option['option_id']; ?>" />
            <input type="hidden" name="news_option[<?php echo $option_row; ?>][type]" value="<?php echo $news_option['type']; ?>" />
            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-required<?php echo $option_row; ?>"><?php echo $entry_required; ?></label>
                <div class="col-sm-10">
                    <select name="news_option[<?php echo $option_row; ?>][required]" id="input-required<?php echo $option_row; ?>" class="form-control">
                        <?php if ($news_option['required']) { ?>
                        <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                        <option value="0"><?php echo $text_no; ?></option>
                        <?php } else { ?>
                        <option value="1"><?php echo $text_yes; ?></option>
                        <option value="0" selected="selected"><?php echo $text_no; ?></option>
                        <?php } ?>
                    </select>
                </div>
            </div>
            <?php if ($news_option['type'] == 'text') { ?>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                <div class="col-sm-10">
                    <input type="text" name="news_option[<?php echo $option_row; ?>][value]" value="<?php echo $news_option['value']; ?>" placeholder="<?php echo $entry_option_value; ?>" id="input-value<?php echo $option_row; ?>" class="form-control" />
                </div>
            </div>
            <?php } ?>
            <?php if ($news_option['type'] == 'textarea') { ?>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                <div class="col-sm-10">
                    <textarea name="news_option[<?php echo $option_row; ?>][value]" rows="5" placeholder="<?php echo $entry_option_value; ?>" id="input-value<?php echo $option_row; ?>" class="form-control"><?php echo $news_option['value']; ?></textarea>
                </div>
            </div>
            <?php } ?>
            <?php if ($news_option['type'] == 'file') { ?>
            <div class="form-group" style="display: none;">
                <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                <div class="col-sm-10">
                    <input type="text" name="news_option[<?php echo $option_row; ?>][value]" value="<?php echo $news_option['value']; ?>" placeholder="<?php echo $entry_option_value; ?>" id="input-value<?php echo $option_row; ?>" class="form-control" />
                </div>
            </div>
            <?php } ?>
            <?php if ($news_option['type'] == 'date') { ?>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                <div class="col-sm-3">
                    <div class="input-group date">
                        <input type="text" name="news_option[<?php echo $option_row; ?>][value]" value="<?php echo $news_option['value']; ?>" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY-MM-DD" id="input-value<?php echo $option_row; ?>" class="form-control" />
                            <span class="input-group-btn">
                            <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                            </span></div>
                </div>
            </div>
            <?php } ?>
            <?php if ($news_option['type'] == 'time') { ?>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                <div class="col-sm-10">
                    <div class="input-group time">
                        <input type="text" name="news_option[<?php echo $option_row; ?>][value]" value="<?php echo $news_option['value']; ?>" placeholder="<?php echo $entry_option_value; ?>" data-date-format="HH:mm" id="input-value<?php echo $option_row; ?>" class="form-control" />
                            <span class="input-group-btn">
                            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                            </span></div>
                </div>
            </div>
            <?php } ?>
            <?php if ($news_option['type'] == 'datetime') { ?>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                <div class="col-sm-10">
                    <div class="input-group datetime">
                        <input type="text" name="news_option[<?php echo $option_row; ?>][value]" value="<?php echo $news_option['value']; ?>" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-value<?php echo $option_row; ?>" class="form-control" />
                            <span class="input-group-btn">
                            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                            </span></div>
                </div>
            </div>
            <?php } ?>
            <?php if ($news_option['type'] == 'select' || $news_option['type'] == 'radio' || $news_option['type'] == 'checkbox' || $news_option['type'] == 'image') { ?>
            <div class="table-responsive">
                <table id="option-value<?php echo $option_row; ?>" class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <td class="text-left"><?php echo $entry_option_value; ?></td>
                        <td class="text-right"><?php echo $entry_quantity; ?></td>
                        <td class="text-left"><?php echo $entry_subtract; ?></td>
                        <td class="text-right"><?php echo $entry_price; ?></td>
                        <td class="text-right"><?php echo $entry_option_points; ?></td>
                        <td class="text-right"><?php echo $entry_weight; ?></td>
                        <td></td>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($news_option['news_option_value'] as $news_option_value) { ?>
                    <tr id="option-value-row<?php echo $option_value_row; ?>">
                        <td class="text-left"><select name="news_option[<?php echo $option_row; ?>][news_option_value][<?php echo $option_value_row; ?>][option_value_id]" class="form-control">
                                <?php if (isset($option_values[$news_option['option_id']])) { ?>
                                <?php foreach ($option_values[$news_option['option_id']] as $option_value) { ?>
                                <?php if ($option_value['option_value_id'] == $news_option_value['option_value_id']) { ?>
                                <option value="<?php echo $option_value['option_value_id']; ?>" selected="selected"><?php echo $option_value['name']; ?></option>
                                <?php } else { ?>
                                <option value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></option>
                                <?php } ?>
                                <?php } ?>
                                <?php } ?>
                            </select>
                            <input type="hidden" name="news_option[<?php echo $option_row; ?>][news_option_value][<?php echo $option_value_row; ?>][news_option_value_id]" value="<?php echo $news_option_value['news_option_value_id']; ?>" /></td>
                        <td class="text-right"><input type="text" name="news_option[<?php echo $option_row; ?>][news_option_value][<?php echo $option_value_row; ?>][quantity]" value="<?php echo $news_option_value['quantity']; ?>" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>
                        <td class="text-left"><select name="news_option[<?php echo $option_row; ?>][news_option_value][<?php echo $option_value_row; ?>][subtract]" class="form-control">
                                <?php if ($news_option_value['subtract']) { ?>
                                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                                <option value="0"><?php echo $text_no; ?></option>
                                <?php } else { ?>
                                <option value="1"><?php echo $text_yes; ?></option>
                                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                                <?php } ?>
                            </select></td>
                        <td class="text-right"><select name="news_option[<?php echo $option_row; ?>][news_option_value][<?php echo $option_value_row; ?>][price_prefix]" class="form-control">
                                <?php if ($news_option_value['price_prefix'] == '+') { ?>
                                <option value="+" selected="selected">+</option>
                                <?php } else { ?>
                                <option value="+">+</option>
                                <?php } ?>
                                <?php if ($news_option_value['price_prefix'] == '-') { ?>
                                <option value="-" selected="selected">-</option>
                                <?php } else { ?>
                                <option value="-">-</option>
                                <?php } ?>
                            </select>
                            <input type="text" name="news_option[<?php echo $option_row; ?>][news_option_value][<?php echo $option_value_row; ?>][price]" value="<?php echo $news_option_value['price']; ?>" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>
                        <td class="text-right"><select name="news_option[<?php echo $option_row; ?>][news_option_value][<?php echo $option_value_row; ?>][points_prefix]" class="form-control">
                                <?php if ($news_option_value['points_prefix'] == '+') { ?>
                                <option value="+" selected="selected">+</option>
                                <?php } else { ?>
                                <option value="+">+</option>
                                <?php } ?>
                                <?php if ($news_option_value['points_prefix'] == '-') { ?>
                                <option value="-" selected="selected">-</option>
                                <?php } else { ?>
                                <option value="-">-</option>
                                <?php } ?>
                            </select>
                            <input type="text" name="news_option[<?php echo $option_row; ?>][news_option_value][<?php echo $option_value_row; ?>][points]" value="<?php echo $news_option_value['points']; ?>" placeholder="<?php echo $entry_points; ?>" class="form-control" /></td>
                        <td class="text-right"><select name="news_option[<?php echo $option_row; ?>][news_option_value][<?php echo $option_value_row; ?>][weight_prefix]" class="form-control">
                                <?php if ($news_option_value['weight_prefix'] == '+') { ?>
                                <option value="+" selected="selected">+</option>
                                <?php } else { ?>
                                <option value="+">+</option>
                                <?php } ?>
                                <?php if ($news_option_value['weight_prefix'] == '-') { ?>
                                <option value="-" selected="selected">-</option>
                                <?php } else { ?>
                                <option value="-">-</option>
                                <?php } ?>
                            </select>
                            <input type="text" name="news_option[<?php echo $option_row; ?>][news_option_value][<?php echo $option_value_row; ?>][weight]" value="<?php echo $news_option_value['weight']; ?>" placeholder="<?php echo $entry_weight; ?>" class="form-control" /></td>
                        <td class="text-left"><button type="button" onclick="$(this).tooltip('destroy');$('#option-value-row<?php echo $option_value_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                    </tr>
                    <?php $option_value_row++; ?>
                    <?php } ?>
                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan="6"></td>
                        <td class="text-left"><button type="button" onclick="addOptionValue('<?php echo $option_row; ?>');" data-toggle="tooltip" title="<?php echo $button_option_value_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                    </tfoot>
                </table>
            </div>
            <select id="option-values<?php echo $option_row; ?>" style="display: none;">
                <?php if (isset($option_values[$news_option['option_id']])) { ?>
                <?php foreach ($option_values[$news_option['option_id']] as $option_value) { ?>
                <option value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></option>
                <?php } ?>
                <?php } ?>
            </select>
            <?php } ?>
        </div>
        <?php $option_row++; ?>
        <?php } ?>
    </div>
</div>
</div>
</div>
<div class="tab-pane" id="tab-recurring">
    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <td class="text-left"><?php echo $entry_recurring; ?></td>
                <td class="text-left"><?php echo $entry_customer_group; ?></td>
                <td class="text-left"></td>
            </tr>
            </thead>
            <tbody>
            <?php $recurring_row = 0; ?>
            <?php foreach ($news_recurrings as $news_recurring) { ?>

            <tr id="recurring-row<?php echo $recurring_row; ?>">
                <td class="text-left"><select name="news_recurring[<?php echo $recurring_row; ?>][recurring_id]" class="form-control">
                        <?php foreach ($recurrings as $recurring) { ?>
                        <?php if ($recurring['recurring_id'] == $news_recurring['recurring_id']) { ?>
                        <option value="<?php echo $recurring['recurring_id']; ?>" selected="selected"><?php echo $recurring['name']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>
                        <?php } ?>
                        <?php } ?>
                    </select></td>
                <td class="text-left"><select name="news_recurring[<?php echo $recurring_row; ?>][customer_group_id]" class="form-control">
                        <?php foreach ($customer_groups as $customer_group) { ?>
                        <?php if ($customer_group['customer_group_id'] == $news_recurring['customer_group_id']) { ?>
                        <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                        <?php } ?>
                        <?php } ?>
                    </select></td>
                <td class="text-left"><button type="button" onclick="$('#recurring-row<?php echo $recurring_row; ?>').remove()" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
            </tr>
            <?php $recurring_row++; ?>
            <?php } ?>
            </tbody>
            <tfoot>
            <tr>
                <td colspan="2"></td>
                <td class="text-left"><button type="button" onclick="addRecurring()" data-toggle="tooltip" title="<?php echo $button_recurring_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
            </tr>
            </tfoot>
        </table>
    </div>
</div>
<div class="tab-pane" id="tab-discount">
    <div class="table-responsive">
        <table id="discount" class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <td class="text-left"><?php echo $entry_customer_group; ?></td>
                <td class="text-right"><?php echo $entry_quantity; ?></td>
                <td class="text-right"><?php echo $entry_priority; ?></td>
                <td class="text-right"><?php echo $entry_price; ?></td>
                <td class="text-left"><?php echo $entry_date_start; ?></td>
                <td class="text-left"><?php echo $entry_date_end; ?></td>
                <td></td>
            </tr>
            </thead>
            <tbody>
            <?php $discount_row = 0; ?>
            <?php foreach ($news_discounts as $news_discount) { ?>
            <tr id="discount-row<?php echo $discount_row; ?>">
                <td class="text-left"><select name="news_discount[<?php echo $discount_row; ?>][customer_group_id]" class="form-control">
                        <?php foreach ($customer_groups as $customer_group) { ?>
                        <?php if ($customer_group['customer_group_id'] == $news_discount['customer_group_id']) { ?>
                        <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                        <?php } ?>
                        <?php } ?>
                    </select></td>
                <td class="text-right"><input type="text" name="news_discount[<?php echo $discount_row; ?>][quantity]" value="<?php echo $news_discount['quantity']; ?>" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>
                <td class="text-right"><input type="text" name="news_discount[<?php echo $discount_row; ?>][priority]" value="<?php echo $news_discount['priority']; ?>" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>
                <td class="text-right"><input type="text" name="news_discount[<?php echo $discount_row; ?>][price]" value="<?php echo $news_discount['price']; ?>" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>
                <td class="text-left" style="width: 20%;"><div class="input-group date">
                        <input type="text" name="news_discount[<?php echo $discount_row; ?>][date_start]" value="<?php echo $news_discount['date_start']; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                          <span class="input-group-btn">
                          <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                          </span></div></td>
                <td class="text-left" style="width: 20%;"><div class="input-group date">
                        <input type="text" name="news_discount[<?php echo $discount_row; ?>][date_end]" value="<?php echo $news_discount['date_end']; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                          <span class="input-group-btn">
                          <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                          </span></div></td>
                <td class="text-left"><button type="button" onclick="$('#discount-row<?php echo $discount_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
            </tr>
            <?php $discount_row++; ?>
            <?php } ?>
            </tbody>
            <tfoot>
            <tr>
                <td colspan="6"></td>
                <td class="text-left"><button type="button" onclick="addDiscount();" data-toggle="tooltip" title="<?php echo $button_discount_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
            </tr>
            </tfoot>
        </table>
    </div>
</div>
<div class="tab-pane" id="tab-special">
    <div class="table-responsive">
        <table id="special" class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <td class="text-left"><?php echo $entry_customer_group; ?></td>
                <td class="text-right"><?php echo $entry_priority; ?></td>
                <td class="text-right"><?php echo $entry_price; ?></td>
                <td class="text-left"><?php echo $entry_date_start; ?></td>
                <td class="text-left"><?php echo $entry_date_end; ?></td>
                <td></td>
            </tr>
            </thead>
            <tbody>
            <?php $special_row = 0; ?>
            <?php foreach ($news_specials as $news_special) { ?>
            <tr id="special-row<?php echo $special_row; ?>">
                <td class="text-left"><select name="news_special[<?php echo $special_row; ?>][customer_group_id]" class="form-control">
                        <?php foreach ($customer_groups as $customer_group) { ?>
                        <?php if ($customer_group['customer_group_id'] == $news_special['customer_group_id']) { ?>
                        <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                        <?php } ?>
                        <?php } ?>
                    </select></td>
                <td class="text-right"><input type="text" name="news_special[<?php echo $special_row; ?>][priority]" value="<?php echo $news_special['priority']; ?>" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>
                <td class="text-right"><input type="text" name="news_special[<?php echo $special_row; ?>][price]" value="<?php echo $news_special['price']; ?>" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>
                <td class="text-left" style="width: 20%;"><div class="input-group date">
                        <input type="text" name="news_special[<?php echo $special_row; ?>][date_start]" value="<?php echo $news_special['date_start']; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                          <span class="input-group-btn">
                          <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                          </span></div></td>
                <td class="text-left" style="width: 20%;"><div class="input-group date">
                        <input type="text" name="news_special[<?php echo $special_row; ?>][date_end]" value="<?php echo $news_special['date_end']; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                          <span class="input-group-btn">
                          <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                          </span></div></td>
                <td class="text-left"><button type="button" onclick="$('#special-row<?php echo $special_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
            </tr>
            <?php $special_row++; ?>
            <?php } ?>
            </tbody>
            <tfoot>
            <tr>
                <td colspan="5"></td>
                <td class="text-left"><button type="button" onclick="addSpecial();" data-toggle="tooltip" title="<?php echo $button_special_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
            </tr>
            </tfoot>
        </table>
    </div>
</div>
<div class="tab-pane" id="tab-image">
    <div class="table-responsive">
        <table id="images" class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <td class="text-left"><?php echo $entry_image; ?></td>
                <td class="text-right"><?php echo $entry_sort_order; ?></td>
                <td></td>
            </tr>
            </thead>
            <tbody>
            <?php $image_row = 0; ?>
            <?php foreach ($news_images as $news_image) { ?>
            <tr id="image-row<?php echo $image_row; ?>">
                <td class="text-left"><a href="" id="thumb-image<?php echo $image_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $news_image['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="news_image[<?php echo $image_row; ?>][image]" value="<?php echo $news_image['image']; ?>" id="input-image<?php echo $image_row; ?>" /></td>
                <td class="text-right"><input type="text" name="news_image[<?php echo $image_row; ?>][sort_order]" value="<?php echo $news_image['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>
                <td class="text-left"><button type="button" onclick="$('#image-row<?php echo $image_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
            </tr>
            <?php $image_row++; ?>
            <?php } ?>
            </tbody>
            <tfoot>
            <tr>
                <td colspan="2"></td>
                <td class="text-left"><button type="button" onclick="addImage();" data-toggle="tooltip" title="<?php echo $button_image_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
            </tr>
            </tfoot>
        </table>
    </div>
</div>
<div class="tab-pane" id="tab-reward">
    <div class="form-group">
        <label class="col-lg-2 control-label" for="input-points"><span data-toggle="tooltip" title="<?php echo $help_points; ?>"><?php echo $entry_points; ?></span></label>
        <div class="col-lg-10">
            <input type="text" name="points" value="<?php echo $points; ?>" placeholder="<?php echo $entry_points; ?>" id="input-points" class="form-control" />
        </div>
    </div>
    <div class="table-responsive">
        <table class="table table-bordered table-hover">
            <thead>
            <tr>
                <td class="text-left"><?php echo $entry_customer_group; ?></td>
                <td class="text-right"><?php echo $entry_reward; ?></td>
            </tr>
            </thead>
            <tbody>
            <?php foreach ($customer_groups as $customer_group) { ?>
            <tr>
                <td class="text-left"><?php echo $customer_group['name']; ?></td>
                <td class="text-right"><input type="text" name="news_reward[<?php echo $customer_group['customer_group_id']; ?>][points]" value="<?php echo isset($news_reward[$customer_group['customer_group_id']]) ? $news_reward[$customer_group['customer_group_id']]['points'] : ''; ?>" class="form-control" /></td>
            </tr>
            <?php } ?>
            </tbody>
        </table>
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
                <td class="text-left"><select name="news_layout[0]" class="form-control">
                        <option value=""></option>
                        <?php foreach ($layouts as $layout) { ?>
                        <?php if (isset($news_layout[0]) && $news_layout[0] == $layout['layout_id']) { ?>
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
                <td class="text-left"><select name="news_layout[<?php echo $store['store_id']; ?>]" class="form-control">
                        <option value=""></option>
                        <?php foreach ($layouts as $layout) { ?>
                        <?php if (isset($news_layout[$store['store_id']]) && $news_layout[$store['store_id']] == $layout['layout_id']) { ?>
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
    <?php foreach ($languages as $language) { ?>
        $('#input-description<?php echo $language['language_id']; ?>').summernote({height: 300});
    <?php } ?>
    //--></script>
<script type="text/javascript"><!--
    // Manufacturer
    $('input[name=\'manufacturer\']').autocomplete({
        'source': function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/manufacturer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
                dataType: 'json',
                success: function(json) {
                    json.unshift({
                        manufacturer_id: 0,
                        name: '<?php echo $text_none; ?>'
                    });

                    response($.map(json, function(item) {
                        return {
                            label: item['name'],
                            value: item['manufacturer_id']
                        }
                    }));
                }
            });
        },
        'select': function(item) {
            $('input[name=\'manufacturer\']').val(item['label']);
            $('input[name=\'manufacturer_id\']').val(item['value']);
        }
    });

    // Category
    $('input[name=\'category\']').autocomplete({
        'source': function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            label: item['name'],
                            value: item['category_id']
                        }
                    }));
                }
            });
        },
        'select': function(item) {
            $('input[name=\'category\']').val('');

            $('#news-category' + item['value']).remove();

            $('#news-category').append('<div id="news-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="news_category[]" value="' + item['value'] + '" /></div>');
        }
    });

    $('#news-category').delegate('.fa-minus-circle', 'click', function() {
        $(this).parent().remove();
    });

    // Filter
    $('input[name=\'filter\']').autocomplete({
        'source': function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/filter/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            label: item['name'],
                            value: item['filter_id']
                        }
                    }));
                }
            });
        },
        'select': function(item) {
            $('input[name=\'filter\']').val('');

            $('#news-filter' + item['value']).remove();

            $('#news-filter').append('<div id="news-filter' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="news_filter[]" value="' + item['value'] + '" /></div>');
        }
    });

    $('#news-filter').delegate('.fa-minus-circle', 'click', function() {
        $(this).parent().remove();
    });

    // Downloads
    $('input[name=\'download\']').autocomplete({
        'source': function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/download/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            label: item['name'],
                            value: item['download_id']
                        }
                    }));
                }
            });
        },
        'select': function(item) {
            $('input[name=\'download\']').val('');

            $('#news-download' + item['value']).remove();

            $('#news-download').append('<div id="news-download' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="news_download[]" value="' + item['value'] + '" /></div>');
        }
    });

    $('#news-download').delegate('.fa-minus-circle', 'click', function() {
        $(this).parent().remove();
    });

    // Related
    $('input[name=\'related\']').autocomplete({
        'source': function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/news/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            label: item['name'],
                            value: item['news_id']
                        }
                    }));
                }
            });
        },
        'select': function(item) {
            $('input[name=\'related\']').val('');

            $('#news-related' + item['value']).remove();

            $('#news-related').append('<div id="news-related' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="news_related[]" value="' + item['value'] + '" /></div>');
        }
    });

    $('#news-related').delegate('.fa-minus-circle', 'click', function() {
        $(this).parent().remove();
    });
    //--></script>
<script type="text/javascript"><!--
    var attribute_row = <?php echo $attribute_row; ?>;

    function addAttribute() {
        html  = '<tr id="attribute-row' + attribute_row + '">';
        html += '  <td class="text-left" style="width: 20%;"><input type="text" name="news_attribute[' + attribute_row + '][name]" value="" placeholder="<?php echo $entry_attribute; ?>" class="form-control" /><input type="hidden" name="news_attribute[' + attribute_row + '][attribute_id]" value="" /></td>';
        html += '  <td class="text-left">';
    <?php foreach ($languages as $language) { ?>
            html += '<div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span><textarea name="news_attribute[' + attribute_row + '][news_attribute_description][<?php echo $language['language_id']; ?>][text]" rows="5" placeholder="<?php echo $entry_text; ?>" class="form-control"></textarea></div>';
        <?php } ?>
        html += '  </td>';
        html += '  <td class="text-left"><button type="button" onclick="$(\'#attribute-row' + attribute_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
        html += '</tr>';

        $('#attribute tbody').append(html);

        attributeautocomplete(attribute_row);

        attribute_row++;
    }

    function attributeautocomplete(attribute_row) {
        $('input[name=\'news_attribute[' + attribute_row + '][name]\']').autocomplete({
            'source': function(request, response) {
                $.ajax({
                    url: 'index.php?route=catalog/attribute/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
                    dataType: 'json',
                    success: function(json) {
                        response($.map(json, function(item) {
                            return {
                                category: item.attribute_group,
                                label: item.name,
                                value: item.attribute_id
                            }
                        }));
                    }
                });
            },
            'select': function(item) {
                $('input[name=\'news_attribute[' + attribute_row + '][name]\']').val(item['label']);
                $('input[name=\'news_attribute[' + attribute_row + '][attribute_id]\']').val(item['value']);
            }
        });
    }

    $('#attribute tbody tr').each(function(index, element) {
        attributeautocomplete(index);
    });
    //--></script>
<script type="text/javascript"><!--
    var option_row = <?php echo $option_row; ?>;

    $('input[name=\'option\']').autocomplete({
        'source': function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/option/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            category: item['category'],
                            label: item['name'],
                            value: item['option_id'],
                            type: item['type'],
                            option_value: item['option_value']
                        }
                    }));
                }
            });
        },
        'select': function(item) {
            html  = '<div class="tab-pane" id="tab-option' + option_row + '">';
            html += '	<input type="hidden" name="news_option[' + option_row + '][news_option_id]" value="" />';
            html += '	<input type="hidden" name="news_option[' + option_row + '][name]" value="' + item['label'] + '" />';
            html += '	<input type="hidden" name="news_option[' + option_row + '][option_id]" value="' + item['value'] + '" />';
            html += '	<input type="hidden" name="news_option[' + option_row + '][type]" value="' + item['type'] + '" />';

            html += '	<div class="form-group">';
            html += '	  <label class="col-sm-2 control-label" for="input-required' + option_row + '"><?php echo $entry_required; ?></label>';
            html += '	  <div class="col-sm-10"><select name="news_option[' + option_row + '][required]" id="input-required' + option_row + '" class="form-control">';
            html += '	      <option value="1"><?php echo $text_yes; ?></option>';
            html += '	      <option value="0"><?php echo $text_no; ?></option>';
            html += '	  </select></div>';
            html += '	</div>';

            if (item['type'] == 'text') {
                html += '	<div class="form-group">';
                html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
                html += '	  <div class="col-sm-10"><input type="text" name="news_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="form-control" /></div>';
                html += '	</div>';
            }

            if (item['type'] == 'textarea') {
                html += '	<div class="form-group">';
                html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
                html += '	  <div class="col-sm-10"><textarea name="news_option[' + option_row + '][value]" rows="5" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="form-control"></textarea></div>';
                html += '	</div>';
            }

            if (item['type'] == 'file') {
                html += '	<div class="form-group" style="display: none;">';
                html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
                html += '	  <div class="col-sm-10"><input type="text" name="news_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="form-control" /></div>';
                html += '	</div>';
            }

            if (item['type'] == 'date') {
                html += '	<div class="form-group">';
                html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
                html += '	  <div class="col-sm-3"><div class="input-group date"><input type="text" name="news_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY-MM-DD" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
                html += '	</div>';
            }

            if (item['type'] == 'time') {
                html += '	<div class="form-group">';
                html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
                html += '	  <div class="col-sm-10"><div class="input-group time"><input type="text" name="news_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="HH:mm" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
                html += '	</div>';
            }

            if (item['type'] == 'datetime') {
                html += '	<div class="form-group">';
                html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
                html += '	  <div class="col-sm-10"><div class="input-group datetime"><input type="text" name="news_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
                html += '	</div>';
            }

            if (item['type'] == 'select' || item['type'] == 'radio' || item['type'] == 'checkbox' || item['type'] == 'image') {
                html += '<div class="table-responsive">';
                html += '  <table id="option-value' + option_row + '" class="table table-striped table-bordered table-hover">';
                html += '  	 <thead>';
                html += '      <tr>';
                html += '        <td class="text-left"><?php echo $entry_option_value; ?></td>';
                html += '        <td class="text-right"><?php echo $entry_quantity; ?></td>';
                html += '        <td class="text-left"><?php echo $entry_subtract; ?></td>';
                html += '        <td class="text-right"><?php echo $entry_price; ?></td>';
                html += '        <td class="text-right"><?php echo $entry_option_points; ?></td>';
                html += '        <td class="text-right"><?php echo $entry_weight; ?></td>';
                html += '        <td></td>';
                html += '      </tr>';
                html += '  	 </thead>';
                html += '  	 <tbody>';
                html += '    </tbody>';
                html += '    <tfoot>';
                html += '      <tr>';
                html += '        <td colspan="6"></td>';
                html += '        <td class="text-left"><button type="button" onclick="addOptionValue(' + option_row + ');" data-toggle="tooltip" title="<?php echo $button_option_value_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>';
                html += '      </tr>';
                html += '    </tfoot>';
                html += '  </table>';
                html += '</div>';

                html += '  <select id="option-values' + option_row + '" style="display: none;">';

                for (i = 0; i < item['option_value'].length; i++) {
                    html += '  <option value="' + item['option_value'][i]['option_value_id'] + '">' + item['option_value'][i]['name'] + '</option>';
                }

                html += '  </select>';
                html += '</div>';
            }

            $('#tab-option .tab-content').append(html);

            $('#option > li:last-child').before('<li><a href="#tab-option' + option_row + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'a[href=\\\'#tab-option' + option_row + '\\\']\').parent().remove(); $(\'#tab-option' + option_row + '\').remove(); $(\'#option a:first\').tab(\'show\')"></i> ' + item['label'] + '</li>');

            $('#option a[href=\'#tab-option' + option_row + '\']').tab('show');

            $('.date').datetimepicker({
                pickTime: false
            });

            $('.time').datetimepicker({
                pickDate: false
            });

            $('.datetime').datetimepicker({
                pickDate: true,
                pickTime: true
            });

            option_row++;
        }
    });
    //--></script>
<script type="text/javascript"><!--
    var option_value_row = <?php echo $option_value_row; ?>;

    function addOptionValue(option_row) {
        html  = '<tr id="option-value-row' + option_value_row + '">';
        html += '  <td class="text-left"><select name="news_option[' + option_row + '][news_option_value][' + option_value_row + '][option_value_id]" class="form-control">';
        html += $('#option-values' + option_row).html();
        html += '  </select><input type="hidden" name="news_option[' + option_row + '][news_option_value][' + option_value_row + '][news_option_value_id]" value="" /></td>';
        html += '  <td class="text-right"><input type="text" name="news_option[' + option_row + '][news_option_value][' + option_value_row + '][quantity]" value="" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>';
        html += '  <td class="text-left"><select name="news_option[' + option_row + '][news_option_value][' + option_value_row + '][subtract]" class="form-control">';
        html += '    <option value="1"><?php echo $text_yes; ?></option>';
        html += '    <option value="0"><?php echo $text_no; ?></option>';
        html += '  </select></td>';
        html += '  <td class="text-right"><select name="news_option[' + option_row + '][news_option_value][' + option_value_row + '][price_prefix]" class="form-control">';
        html += '    <option value="+">+</option>';
        html += '    <option value="-">-</option>';
        html += '  </select>';
        html += '  <input type="text" name="news_option[' + option_row + '][news_option_value][' + option_value_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>';
        html += '  <td class="text-right"><select name="news_option[' + option_row + '][news_option_value][' + option_value_row + '][points_prefix]" class="form-control">';
        html += '    <option value="+">+</option>';
        html += '    <option value="-">-</option>';
        html += '  </select>';
        html += '  <input type="text" name="news_option[' + option_row + '][news_option_value][' + option_value_row + '][points]" value="" placeholder="<?php echo $entry_points; ?>" class="form-control" /></td>';
        html += '  <td class="text-right"><select name="news_option[' + option_row + '][news_option_value][' + option_value_row + '][weight_prefix]" class="form-control">';
        html += '    <option value="+">+</option>';
        html += '    <option value="-">-</option>';
        html += '  </select>';
        html += '  <input type="text" name="news_option[' + option_row + '][news_option_value][' + option_value_row + '][weight]" value="" placeholder="<?php echo $entry_weight; ?>" class="form-control" /></td>';
        html += '  <td class="text-left"><button type="button" onclick="$(this).tooltip(\'destroy\');$(\'#option-value-row' + option_value_row + '\').remove();" data-toggle="tooltip" rel="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
        html += '</tr>';

        $('#option-value' + option_row + ' tbody').append(html);
        $('[rel=tooltip]').tooltip();

        option_value_row++;
    }
    //--></script>
<script type="text/javascript"><!--
    var discount_row = <?php echo $discount_row; ?>;

    function addDiscount() {
        html  = '<tr id="discount-row' + discount_row + '">';
        html += '  <td class="text-left"><select name="news_discount[' + discount_row + '][customer_group_id]" class="form-control">';
    <?php foreach ($customer_groups as $customer_group) { ?>
            html += '    <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';
        <?php } ?>
        html += '  </select></td>';
        html += '  <td class="text-right"><input type="text" name="news_discount[' + discount_row + '][quantity]" value="" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>';
        html += '  <td class="text-right"><input type="text" name="news_discount[' + discount_row + '][priority]" value="" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>';
        html += '  <td class="text-right"><input type="text" name="news_discount[' + discount_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>';
        html += '  <td class="text-left"><div class="input-group date"><input type="text" name="news_discount[' + discount_row + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
        html += '  <td class="text-left"><div class="input-group date"><input type="text" name="news_discount[' + discount_row + '][date_end]" value="" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
        html += '  <td class="text-left"><button type="button" onclick="$(\'#discount-row' + discount_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
        html += '</tr>';

        $('#discount tbody').append(html);

        $('.date').datetimepicker({
            pickTime: false
        });

        discount_row++;
    }
    //--></script>
<script type="text/javascript"><!--
    var special_row = <?php echo $special_row; ?>;

    function addSpecial() {
        html  = '<tr id="special-row' + special_row + '">';
        html += '  <td class="text-left"><select name="news_special[' + special_row + '][customer_group_id]" class="form-control">';
    <?php foreach ($customer_groups as $customer_group) { ?>
            html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';
        <?php } ?>
        html += '  </select></td>';
        html += '  <td class="text-right"><input type="text" name="news_special[' + special_row + '][priority]" value="" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>';
        html += '  <td class="text-right"><input type="text" name="news_special[' + special_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>';
        html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="news_special[' + special_row + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
        html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="news_special[' + special_row + '][date_end]" value="" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
        html += '  <td class="text-left"><button type="button" onclick="$(\'#special-row' + special_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
        html += '</tr>';

        $('#special tbody').append(html);

        $('.date').datetimepicker({
            pickTime: false
        });

        special_row++;
    }
    //--></script>
<script type="text/javascript"><!--
    var image_row = <?php echo $image_row; ?>;

    function addImage() {
        html  = '<tr id="image-row' + image_row + '">';
        html += '  <td class="text-left"><a href="" id="thumb-image' + image_row + '"data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /><input type="hidden" name="news_image[' + image_row + '][image]" value="" id="input-image' + image_row + '" /></td>';
        html += '  <td class="text-right"><input type="text" name="news_image[' + image_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>';
        html += '  <td class="text-left"><button type="button" onclick="$(\'#image-row' + image_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
        html += '</tr>';

        $('#images tbody').append(html);

        image_row++;
    }
    //--></script>
<script type="text/javascript"><!--
    var recurring_row = <?php echo $recurring_row; ?>;

    function addRecurring() {
        recurring_row++;

        html  = '';
        html += '<tr id="recurring-row' + recurring_row + '">';
        html += '  <td class="left">';
        html += '    <select name="news_recurring[' + recurring_row + '][recurring_id]" class="form-control">>';
    <?php foreach ($recurrings as $recurring) { ?>
            html += '      <option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>';
        <?php } ?>
        html += '    </select>';
        html += '  </td>';
        html += '  <td class="left">';
        html += '    <select name="news_recurring[' + recurring_row + '][customer_group_id]" class="form-control">>';
    <?php foreach ($customer_groups as $customer_group) { ?>
            html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>';
        <?php } ?>
        html += '    <select>';
        html += '  </td>';
        html += '  <td class="left">';
        html += '    <a onclick="$(\'#recurring-row' + recurring_row + '\').remove()" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></a>';
        html += '  </td>';
        html += '</tr>';

        $('#tab-recurring table tbody').append(html);
    }
    //--></script>
<script type="text/javascript"><!--
    $('.date').datetimepicker({
        pickTime: false
    });

    $('.time').datetimepicker({
        pickDate: false
    });

    $('.datetime').datetimepicker({
        pickDate: true,
        pickTime: true
    });
    //--></script>
<script type="text/javascript"><!--
    $('#language a:first').tab('show');
    $('#option a:first').tab('show');
    //--></script></div>
<?php echo $footer; ?>