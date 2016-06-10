<?php echo $header; ?>
<div class="container">
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
			<div class="col-md-12 titletintuc">
			<h3><?php echo $heading_title; ?></h3>
			</div>
			<?php if (isset($sections) && count($sections)>0) { ?>
			<div class="section-content col-md-12 col-sm-12 mtv pn">
                <div class="section">
                    <div class="col-sm-12 col-lg-12 col-md-12 tintuctuvan pn">
                        <?php if ($section['chidren'][0]['thumb']) { ?>
                        <div class="imagetv col-sm-3 ">
                            <a href="<?php echo $section['chidren'][0]['href']; ?>"><img src="<?php echo $section['chidren'][0]['thumb']; ?>" title="<?php echo $section['chidren'][0]['title']; ?>" alt="<?php echo $section['chidren'][0]['title']; ?>" /></a>
                        </div>
                        
                        <div class="col-sm-9">
                            <div class="titletv"><a href="<?php echo $section['chidren'][0]['href']; ?>"><?php echo $section['chidren'][0]['title']; ?></a></div>
                            <div class="descriptiontv"><?php echo $section['chidren'][0]['description']; ?></div>
                            <a class="readmore pull-right" href="<?php echo $section['chidren'][0]['href']; ?>">>>> Đọc thêm</a>
						<?php } ?>
                        </div>
                    </div>
					<div class="col-sm-12 col-lg-12 col-md-12 tvreleated">
					<ul>
					<?php foreach($section['chidren'] as $key=>$chi ){ ?>
						<?php if($key>0){ ?>
							<li> <a href="<?php echo $chi['href']; ?>"> <?php echo $chi['title']; ?> </a></li>
						<?php } ?>
					<?php } ?>
					</ul>
                    </div>

                </div>
			</div>	
			<div class="section-list-content">
                <div class="section-list">
                    <?php foreach ($sections as $item) { ?>
					<div class="titletvqt"><a class="tvqt" href="<?php echo $item['href']; ?>"><?php echo $item['name']; ?></a></div>
                    <div class="col-sm-12 col-lg-12 col-md-12 tintuctuvan pn">

                        <?php if ($item['chidren'][0]['thumb']) { ?>

                        <div class="imagetv col-sm-3 ">

                            <a href="<?php echo $item['chidren'][0]['href']; ?>"><img src="<?php echo $item['chidren'][0]['thumb']; ?>" title="<?php echo $item['chidren'][0]['title']; ?>" alt="<?php echo $item['chidren'][0]['title']; ?>" /></a>

                        </div>                        
                        <div class="col-sm-9">
                            <div class="titletv"><a href="<?php echo $item['chidren'][0]['href']; ?>"><?php echo $item['chidren'][0]['title']; ?></a></div>
                            <div class="descriptiontv"><?php echo $item['chidren'][0]['description']; ?></div>
                            <a class="readmore pull-right" href="<?php echo $item['chidren'][0]['href']; ?>">>>> Đọc thêm</a>
                        </div>						
						<?php } ?>
                    </div>
					<div class="col-sm-12 col-lg-12 col-md-12 tvreleated">
					<ul>
					<?php foreach($item['chidren'] as $key => $chi ){ ?>
						<?php if($key>0){ ?>
							<li> <a href="<?php echo $chi['href']; ?>"> <?php echo $chi['title']; ?> </a></li>
						<?php } ?>
					<?php } ?>
					</ul>
                    </div>

                    <?php } ?>

                </div>
			</div>

			<?php }else if (isset($newss) && count($newss)>0){ ?>
            <div class="news-list-content row">

                <div class="news-list row">
                    <?php foreach ($newss as $news) { ?>

                    <div class="col-sm-12 col-lg-12 col-md-12" style="margin-top: 10px;">

                        <?php if ($news['thumb']) { ?>

                        <div class="image col-sm-3 hinhtintuc  ">

                            <a href="<?php echo $news['href']; ?>"><img src="<?php echo $news['thumb']; ?>" title="<?php echo $news['title']; ?>" alt="<?php echo $news['title']; ?>" /></a>

                        </div>

                        <?php } ?>
                        <div class="col-sm-9 khungtintuc">
                            <div class="title"><a href="<?php echo $news['href']; ?>"><?php echo $news['title']; ?></a></div>

                            <!-- <div class="date">Đăng ngày: <?php echo $news['date_added']; ?></div> -->

                            <div class="description"><b><?php echo $news['description']; ?></b></div>
                        </div>
						<a class="pull-right" href="<?php echo $news['href']; ?>">>>> Đọc thêm</a>

                    </div>

                    <?php } ?>

                </div>

                <div class="pagination"><?php echo $pagination; ?></div>
			</div>
			<?php } else { ?>

			<div class="content"><?php echo $text_empty; ?></div>

			<div class="buttons">

				<div class="right"><a href="<?php echo $continue; ?>" class="button"><span><?php echo $button_continue; ?></span></a></div>

			</div>

			<?php } ?>
            </div>            
    </div>
	<?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>
