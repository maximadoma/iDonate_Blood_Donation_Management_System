<?php 
include 'db_connect.php'; 
if(isset($_GET['id'])){
$qry = $conn->query("SELECT * FROM requests where id= ".$_GET['id']);
foreach($qry->fetch_array() as $k => $val){
	$$k=$val;
}
}
?>
<div class="container-fluid">
	<form action="" id="manage-request">
		<input type="hidden" name="id" value="<?php echo isset($id) ? $id : '' ?>">
		<div id="msg"></div>
		<div class="form-group">
			<label for="" class="control-label">Requester Name</label>
			<input type="text" class="form-control" name="requester_name"  value="<?php echo isset($requester_name) ? $requester_name :'' ?>" required>
		</div>
		<div class="form-group">
	        <label for="" class="control-label">Blood Type</label>
			<select name="blood_type" id="" class="custom-select select2" required>
				<option value=""></option>
				<option <?php echo isset($blood_type) && $blood_type == 'A+' ? ' selected' : '' ?>>A+</option>
				<option <?php echo isset($blood_type) && $blood_type == 'B+' ? ' selected' : '' ?>>B+</option>
				<option <?php echo isset($blood_type) && $blood_type == 'O+' ? ' selected' : '' ?>>O+</option>
				<option <?php echo isset($blood_type) && $blood_type == 'AB+' ? ' selected' : '' ?>>AB+</option>
				<option <?php echo isset($blood_type) && $blood_type == 'A-' ? ' selected' : '' ?>>A-</option>
				<option <?php echo isset($blood_type) && $blood_type == 'B-' ? ' selected' : '' ?>>B-</option>
				<option <?php echo isset($blood_type) && $blood_type == 'O-' ? ' selected' : '' ?>>O-</option>
				<option <?php echo isset($blood_type) && $blood_type == 'AB-' ? ' selected' : '' ?>>AB-</option>
			</select>
		</div>

		<div class="form-group">
			<label for="" class="control-label">Available Bag(s)</label>
			<input type="number" class="form-control text-right" step="any" name="a_quantity"  value="0" readonly="">
		</div>

		<div class="form-group">
			<label for="" class="control-label">Quantity</label>
			<input type="number" class="form-control" name="quantity"  value="<?php echo isset($quantity)?>" required>
		</div>
		<div class="form-group">
			<label for="" class="control-label">Physician Name</label>
			<input type="text" class="form-control" name="physician_name"  value="<?php echo isset($physician_name) ? $physician_name :'' ?>" required>
		</div>
		<?php if(isset($status)): ?>
		<div class="form-group">
	        <label for="" class="control-label">Status</label>
			<select name="status" id="" class="custom-select select2" required>
				<option value="0" <?php echo $status == 0 ? 'selected' : ''  ?>>Pending</option>
				<option value="1" <?php echo $status == 1 ? 'selected' : ''  ?>>Approved</option>
			</select>
		</div>
	<?php endif; ?>
</div>
	</form>
</div>
<script>
	$(document).ready(function(){
		if('<?php echo isset($blood_type)? 1:0 ?>' == 1)
			$('[name="blood_type"]').trigger('change')	
	})
	$('[name="blood_type"]').change(function(){
		var _id = $(this).val()
	console.log(_id)
		$.ajax({
			url:'ajax.php?action=get_available',
			method:'POST',
			data:{blood_type:$(this).val(),id:'<?php echo isset($id)? $id : '' ?>'},
			success:function(resp){
				if(resp > 0){
					$('[name="a_quantity"]').val(resp)
				}else{
					$('[name="a_quantity"]').val(0)
				}
			}
		})
	})
	$('#manage-request').submit(function(e){
		e.preventDefault()
		start_load()
		$('#msg').html('')
		if($('[name="quantity"]').val() > $('[name="a_quantity"]').val()){
			$('#msg').html('<div class="alert alert-danger">Blood volume is greater than available volume.</div>')
			end_load()
			return false;
		}
		$.ajax({
			url:'ajax.php?action=save_request',
			data: new FormData($(this)[0]),
		    cache: false,
		    contentType: false,
		    processData: false,
		    method: 'POST',
		    type: 'POST',
			success:function(resp){
				if(resp==1){
					alert_toast("Data successfully saved.",'success')
						setTimeout(function(){
							location.reload()
						},1000)
				}
			}
		})
	})
</script>