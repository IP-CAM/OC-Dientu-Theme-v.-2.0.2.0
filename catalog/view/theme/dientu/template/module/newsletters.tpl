<script>
		function subscribe()
		{
			var emailpattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			var email = $('#txtemail').val();
			if(email != "")
			{
				if(!emailpattern.test(email))
				{
					alert("Invalid Email");
					return false;
				}
				else
				{
					$.ajax({
						url: 'index.php?route=module/newsletters/news',
						type: 'post',
						data: 'email=' + $('#txtemail').val(),
						dataType: 'json',
						
									
						success: function(json) {
						
						alert(json.message);
						
						}
						
					});
					return false;
				}
			}
			else
			{
				alert("Email Is Require");
				$(email).focus();
				return false;
			}
			

		}
	</script>
	
<div class="subscrible">
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<h2>Đăng ký nhận tin hoặc tư vấn miễn phí</h2>
			</div>
			<div class="col-md-5">
			<form action="" method="post">
				<div class="form-group required">
						<div class="input-group">
							<input type="email" name="txtemail" id="txtemail" value="" placeholder="" class="form-control input-md"  />
							  <span class="input-group-btn">
								  <button type="submit" class="btn btn-default btn-md" onclick="return subscribe();">Đăng ký</i></button>
							  </span>
						</div>

					</div>
			</div>
			<div class="col-md-2">

			</div>
			</form>

		</div>
	</div>
</div>
