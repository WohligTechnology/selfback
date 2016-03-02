<div class="row">
<div class="col s12">
<h4 class="pad-left-15">Edit Order</h4>
</div>
</div>
<div class="row">
<form class='col s12' method='post' action='<?php echo site_url("site/editordersubmit");?>' enctype= 'multipart/form-data'>
<input type="hidden" id="normal-field" class="form-control" name="id" value="<?php echo set_value('id',$before->id);?>" style="display:none;">
<div class=" row">
<div class=" input-field col s12 m6">
<?php echo form_dropdown("user",$user,set_value('user',$before->user));?>
<label for="User">User</label>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="First Name">First Name</label>
<input type="text" id="First Name" name="firstname" value='<?php echo set_value('firstname',$before->firstname);?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Last Name">Last Name</label>
<input type="text" id="Last Name" name="lastname" value='<?php echo set_value('lastname',$before->lastname);?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Email Id">Email Id</label>
<input type="text" id="Email Id" name="email" value='<?php echo set_value('email',$before->email);?>'>
</div>
</div>
<!--
<div class="row">
<div class="col s12 m6">
<label>Billing Address</label>
<textarea name="billingaddress" placeholder="Enter text ..."><?php echo set_value( 'billingaddress',$before->billingaddress);?></textarea>
</div>
</div>
-->
     <div class="row">
			<div class="input-field col m6 s12">
				<label for="billingline1">Billing line 1</label>
				<input type="text" id="billingline1" name="billingline1" value="<?php echo set_value('billingline1',$before->billingline1);?>">
			</div>
		</div>
        <div class="row">
			<div class="input-field col m6 s12">
				<label for="billingline2">Billing line 2</label>
				<input type="text" id="billingline2" name="billingline2" value="<?php echo set_value('billingline2',$before->billingline2);?>">
			</div>
		</div>
        <div class="row">
			<div class="input-field col m6 s12">
				<label for="billingline3">Billing line 3</label>
				<input type="text" id="billingline3" name="billingline3" value="<?php echo set_value('billingline3',$before->billingline3);?>">
			</div>
		</div>
<div class="row">
<div class="input-field col s6">
<label for="Billing Contact">Billing Contact</label>
<input type="text" id="Billing Contact" name="billingcontact" value='<?php echo set_value('billingcontact',$before->billingcontact);?>'>
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
<label for="Billing Pincode">Billing Pincode</label>
<input type="text" id="Billing Pincode" name="billingpincode" value='<?php echo set_value('billingpincode',$before->billingpincode);?>'>
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
<div class="col s12 m6">
<label>Shipping Address</label>
<textarea name="shippingaddress" placeholder="Enter text ..."><?php echo set_value( 'shippingaddress',$before->shippingaddress);?></textarea>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Shipping Name">Shipping Name</label>
<input type="text" id="Shipping Name" name="shippingname" value='<?php echo set_value('shippingname',$before->shippingname);?>'>
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
<label for="Shipping Contact">Shipping Contact</label>
<input type="text" id="Shipping Contact" name="shippingcontact" value='<?php echo set_value('shippingcontact',$before->shippingcontact);?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="shippingstate">shippingstate</label>
<input type="text" id="shippingstate" name="shippingstate" value='<?php echo set_value('shippingstate',$before->shippingstate);?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Shipping Pincode">Shipping Pincode</label>
<input type="text" id="Shipping Pincode" name="shippingpincode" value='<?php echo set_value('shippingpincode',$before->shippingpincode);?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Tracking Code">Tracking Code</label>
<input type="text" id="Tracking Code" name="trackingcode" value='<?php echo set_value('trackingcode',$before->trackingcode);?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Default Currency">Default Currency</label>
<input type="text" id="Default Currency" name="defaultcurrency" value='<?php echo set_value('defaultcurrency',$before->defaultcurrency);?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Shipping Method">Shipping Method</label>
<input type="text" id="Shipping Method" name="shippingmethod" value='<?php echo set_value('shippingmethod',$before->shippingmethod);?>'>
</div>
</div>
<div class=" row">
<div class=" input-field col s6">
<?php echo form_dropdown("orderstatus",$orderstatus,set_value('orderstatus',$before->orderstatus));?>
<label>Order Status</label>
</div>
</div>
      <div class="row">
<div class="input-field col s6">
<label for="transactionid">Transaction Id</label>
<input type="text" id="transactionid" name="transactionid" value='<?php echo set_value('transactionid',$before->transactionid);?>'>
</div>
</div>
     <div class=" row">
<div class=" input-field col s6">
<?php echo form_dropdown("paymentmode",$paymentmode,set_value('paymentmode',$before->paymentmode));?>
<label>Payment Mode</label>
</div>
</div>
<div class="row">
<div class="col s6">
<button type="submit" class="btn btn-primary waves-effect waves-light  blue darken-4">Save</button>
<a href='<?php echo site_url("site/vieworder"); ?>' class='btn btn-secondary waves-effect waves-light red'>Cancel</a>
</div>
</div>
</form>
</div>
