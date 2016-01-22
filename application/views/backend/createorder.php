<div class="row">
<div class="col s12">
<h4 class="pad-left-15">Create Order</h4>
</div>
<form class='col s12' method='post' action='<?php echo site_url("site/createordersubmit");?>' enctype= 'multipart/form-data'>
<div class=" row">
<div class=" input-field col s6">
<?php echo form_dropdown("user",$user,set_value('user'));?>
<label>User</label>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="First Name">First Name</label>
<input type="text" id="First Name" name="firstname" value='<?php echo set_value('firstname');?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Last Name">Last Name</label>
<input type="text" id="Last Name" name="lastname" value='<?php echo set_value('lastname');?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Email Id">Email Id</label>
<input type="text" id="Email Id" name="email" value='<?php echo set_value('email');?>'>
</div>
</div>
<div class="row">
<div class="input-field col s12">
<textarea name="billingaddress" class="materialize-textarea" length="400"><?php echo set_value( 'billingaddress');?></textarea>
<label>Billing Address</label>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Billing Contact">Billing Contact</label>
<input type="text" id="Billing Contact" name="billingcontact" value='<?php echo set_value('billingcontact');?>'>
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
<label for="Billing Pincode">Billing Pincode</label>
<input type="text" id="Billing Pincode" name="billingpincode" value='<?php echo set_value('billingpincode');?>'>
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
<!--
<div class="row">
<div class="input-field col s12">
<textarea name="shippingaddress" class="materialize-textarea" length="400"><?php echo set_value( 'shippingaddress');?></textarea>
<label>Shipping Address</label>
</div>
</div>
-->
     <div class="row">
			<div class="input-field col m6 s12">
				<label for="shippingline1">Shipping Line 1</label>
				<input type="text" id="shippingline1" name="shippingline1" value="<?php echo set_value('shippingline1');?>">
			</div>
		</div>
        <div class="row">
			<div class="input-field col m6 s12">
				<label for="shippingline2">Shipping Line 2</label>
				<input type="text" id="shippingline2" name="shippingline2" value="<?php echo set_value('shippingline2');?>">
			</div>
		</div>
        <div class="row">
			<div class="input-field col m6 s12">
				<label for="shippingline3">Shipping Line 3</label>
				<input type="text" id="shippingline3" name="shippingline3" value="<?php echo set_value('shippingline3');?>">
			</div>
		</div> 
<div class="row">
<div class="input-field col s6">
<label for="Shipping Name">Shipping Name</label>
<input type="text" id="Shipping Name" name="shippingname" value='<?php echo set_value('shippingname');?>'>
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
<label for="Shipping Contact">Shipping Contact</label>
<input type="text" id="Shipping Contact" name="shippingcontact" value='<?php echo set_value('shippingcontact');?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="shippingstate">shippingstate</label>
<input type="text" id="shippingstate" name="shippingstate" value='<?php echo set_value('shippingstate');?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Shipping Pincode">Shipping Pincode</label>
<input type="text" id="Shipping Pincode" name="shippingpincode" value='<?php echo set_value('shippingpincode');?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Tracking Code">Tracking Code</label>
<input type="text" id="Tracking Code" name="trackingcode" value='<?php echo set_value('trackingcode');?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Default Currency">Default Currency</label>
<input type="text" id="Default Currency" name="defaultcurrency" value='<?php echo set_value('defaultcurrency');?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Shipping Method">Shipping Method</label>
<input type="text" id="Shipping Method" name="shippingmethod" value='<?php echo set_value('shippingmethod');?>'>
</div>
</div>
<div class=" row">
<div class=" input-field col s6">
<?php echo form_dropdown("orderstatus",$orderstatus,set_value('orderstatus'));?>
<label>Order Status</label>
</div>
</div>
    <div class="row">
<div class="input-field col s6">
<label for="transactionid">Transaction Id</label>
<input type="text" id="transactionid" name="transactionid" value='<?php echo set_value('transactionid');?>'>
</div>
</div>
    <div class=" row">
<div class=" input-field col s6">
<?php echo form_dropdown("paymentmode",$paymentmode,set_value('paymentmode'));?>
<label>Payment Mode</label>
</div>
</div>
<div class="row">
<div class="col s12 m6">
<button type="submit" class="btn btn-primary waves-effect waves-light blue darken-4">Save</button>
<a href="<?php echo site_url("site/vieworder"); ?>" class="btn btn-secondary waves-effect waves-light red">Cancel</a>
</div>
</div>
</form>
</div>
