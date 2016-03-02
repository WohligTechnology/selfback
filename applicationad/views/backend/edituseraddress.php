<div class="row">
<div class="col s12">
<h4 class="pad-left-15">Edit useraddress</h4>
</div>
</div>
<div class="row">
<form class='col s12' method='post' action='<?php echo site_url("site/edituseraddresssubmit");?>' enctype= 'multipart/form-data'>
<input type="hidden" id="normal-field" class="form-control" name="id" value="<?php echo set_value('id',$before->id);?>" style="display:none;">
<div class=" row">
<div class=" input-field col s12 m6">
<?php echo form_dropdown("user",$user,set_value('user',$before->user));?>
<label for="User">User</label>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Name">Name</label>
<input type="text" id="Name" name="name" value='<?php echo set_value('name',$before->name);?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Billing City">Billing City</label>
<input type="text" id="Billing City" name="billingcity" value='<?php echo set_value('billingcity',$before->billingcity);?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Billing State">Billing State</label>
<input type="text" id="Billing State" name="billingstate" value='<?php echo set_value('billingstate',$before->billingstate);?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Billing Country">Billing Country</label>
<input type="text" id="Billing Country" name="billingcountry" value='<?php echo set_value('billingcountry',$before->billingcountry);?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Shipping City">Shipping City</label>
<input type="text" id="Shipping City" name="shippingcity" value='<?php echo set_value('shippingcity',$before->shippingcity);?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Shipping State">Shipping State</label>
<input type="text" id="Shipping State" name="shippingstate" value='<?php echo set_value('shippingstate',$before->shippingstate);?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Shipping Country">Shipping Country</label>
<input type="text" id="Shipping Country" name="shippingcountry" value='<?php echo set_value('shippingcountry',$before->shippingcountry);?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Shipping Pincode">Shipping Pincode</label>
<input type="text" id="Shipping Pincode" name="shippingpincode" value='<?php echo set_value('shippingpincode',$before->shippingpincode);?>'>
</div>
</div>
<div class="row">
<div class="col s12 m6">
<label>Billing Address</label>
<textarea name="billingaddress" placeholder="Enter text ..."><?php echo set_value( 'billingaddress',$before->billingaddress);?></textarea>
</div>
</div>
<div class="row">
<div class="col s12 m6">
<label>Shipping Address</label>
<textarea name="shippingaddress" placeholder="Enter text ..."><?php echo set_value( 'shippingaddress',$before->shippingaddress);?></textarea>
</div>
</div>
<div class="row">
<div class="col s6">
<button type="submit" class="btn btn-primary waves-effect waves-light  blue darken-4">Save</button>
<a href='<?php echo site_url("site/viewuseraddress"); ?>' class='btn btn-secondary waves-effect waves-light red'>Cancel</a>
</div>
</div>
</form>
</div>
