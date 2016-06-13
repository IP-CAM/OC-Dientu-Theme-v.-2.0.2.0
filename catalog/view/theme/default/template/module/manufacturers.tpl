
<?php if ($brands) : ?>
<div class="titlemanu">
		Các thương hiệu hàng đầu
</div>
<div class="manu">
	<div class="container">
		<div class="row">
			<?php foreach ($brands as $brand): ?>
				<?php if ($brand['manufacturer']): ?>
					<?php foreach ($brand['manufacturer'] as $manufacturer):?>
						<div class="col-lg-18 col-md-18 col-sm-2 col-xs-4 manu-block">
							<div class="manu-content">
								<div class="image-product">
									<a href="<?php echo $manufacturer['href']; ?>">
										<img src="<?php echo $manufacturer['image']; ?>" class="img-responsive" alt="<?php echo $manufacturer['name']; ?>" title="<?php echo $manufacturer['name']; ?>">
									</a>
								</div>
							</div>
						</div>
					<?php endforeach; ?>
				<?php endif;?>
			<?php endforeach; ?>
		</div>
	</div>
</div>
<?php endif;?>