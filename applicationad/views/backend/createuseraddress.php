<div class="row">
<div class="col s12">
<h4 class="pad-left-15">Create useraddress</h4>
</div>
<form class='col s12' method='post' action='<?php echo site_url("site/createuseraddresssubmit");?>' enctype= 'multipart/form-data'>
<div class=" row">
<div class=" input-field col s6">
<?php echo form_dropdown("user",$user,set_value('user'));?>
<label>User</label>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Name">Name</label>
<input type="text" id="Name" name="name" value='<?php echo set_value('name');?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Billing City">Billing City</label>
<input type="text" id="Billing City" name="billingcity" value='<?php echo set_value('billingcity');?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Billing State">Billing State</label>
<input type="text" id="Billing State" name="billingstate" value='<?php echo set_value('billingstate');?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Billing Country">Billing Country</label>
<input type="text" id="Billing Country" name="billingcountry" value='<?php echo set_value('billingcountry');?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Shipping City">Shipping City</label>
<input type="text" id="Shipping City" name="shippingcity" value='<?php echo set_value('shippingcity');?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Shipping State">Shipping State</label>
<input type="text" id="Shipping State" name="shippingstate" value='<?php echo set_value('shippingstate');?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Shipping Country">Shipping Country</label>
<input type="text" id="Shipping Country" name="shippingcountry" value='<?php echo set_value('shippingcountry');?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Shipping Pincode">Shipping Pincode</label>
<input type="text" id="Shipping Pincode" name="shippingpincode" value='<?php echo set_value('shippingpincode');?>'>
</div>
</div>
<div class="row">
<div class="input-field col s12">
<textarea name="billingaddress" class="materialize-textarea" length="400"><?php echo set_value( 'billingaddress');?></textarea>
<label>Billing Address</label>
</div>
</div>
<div class="row">
<div class="input-field col s12">
<textarea name="shippingaddress" class="materialize-textarea" length="400"><?php echo set_value( 'shippingaddress');?></textarea>
<label>Shipping Address</label>
</div>
</div>
<div class="row">
<div class="col s12 m6">
<button type="submit" class="btn btn-primary waves-effect waves-light blue darken-4">Save</button>
<a href="<?php echo site_url("site/viewuseraddress"); ?>" class="btn btn-secondary waves-effect waves-light red">Cancel</a>
</div>
</div>
</form>
</div>
