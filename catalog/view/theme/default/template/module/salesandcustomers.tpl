<?php if($module_id == 471) { ?>
	<div id="salesandcustomers">	
		<div class="titlesalesandcustomers">
			<div class="container">
	    		<?php echo $heading_title; ?>
			</div>
		</div>
		<div class="contentsalesandcustomers">
			<div class="container">
	    		<?php echo $salesandcustomers; ?>
	    	</div>
		</div>
		<div class="newssalesandcustomers"> 
		  <div class="container">   
		    <div class="row">
		    	<div class="col-md-10 col-md-offset-1 col-sm-12 col-xs-12">
			      <?php foreach ($newss as $news) { ?>
			        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-xs-17 wrapcontentcustomers">
			            <div class="boxcustomershome">
			            	<div class="col-md-2 col-sm-2 col-xs-2 col-xs-18 checkcustomers">
			            		&nbsp;
			            	</div>
			            	<div class="col-md-9 col-sm-10 col-xs-10 col-xs-18 titlecustomers">
			              		<h4><?php echo $news['title']; ?></h4>
			              		<?php echo $news['description']; ?>
			              	</div>
			            </div>
			        </div>
			      <?php } ?>
		      </div>
		    </div>
		  </div>
		</div>
		<div class="imagesalesandcustomers">	
		</div>
	</div>
<?php } else if($module_id == 475) { ?>
	<div id="websitedongian">
		<div class="titlewebsitedongian">
			<div class="container">
				<span>Với <span class="threelight">3</span> bước đơn giản</span> <?php echo $heading_title; ?>
			</div>
		</div>
		<div class="contentwebsitedongian">
			<div class="container">
				<div class="row">
					<div class="col-md-7 pull-right col-sm-12 col-xs-12 timelinewebsite">
						<ul class="timeline-both-side">
							<?php 
							$i = 0;
							foreach ($newss as $news) { 
							$class = $i % 2 != 0 ? "class=opposite-side" : "";
							?>
					        	<li <?php echo $class; ?>>
					            	<div class="border-line"></div>
					                <div class="timeline-description">
					                	<div class="row">
							                <div class="col-md-4 col-sm-4 col-xs-12 titletimelineimage">
							                	<img src="<?php echo $news['thumb']; ?>"/>
							                </div>
							                <div class="col-md-8 col-sm-8 col-xs-12 titletimeline">
							                	<span><?php echo $news['title']; ?></span><br>
						                    	<?php echo $news['description']; ?>
							                </div>		
						                </div>			                   
					                </div>
					            </li>
					        <?php $i++; } ?>
					    </ul>
					</div>
				</div>
			</div>
		</div>
	</div>
<?php } else { ?>
	<div class="container">

	</div>
<?php } ?>