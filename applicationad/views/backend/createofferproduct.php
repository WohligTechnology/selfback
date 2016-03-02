<div class="row">
<div class="col s12">
<h4 class="pad-left-15">Create offerproduct</h4>
</div>
<form class='col s12' method='post' action='<?php echo site_url("site/createofferproductsubmit");?>' enctype= 'multipart/form-data'>
<div class=" row">
<div class=" input-field col s6">
<?php echo form_dropdown("offer",$offer,set_value('offer'));?>
<label>Offer</label>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Product">Product</label>
<input type="text" id="Product" name="product" value='<?php echo set_value('product');?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Quantity">Quantity</label>
<input type="text" id="Quantity" name="quantity" value='<?php echo set_value('quantity');?>'>
</div>
</div>
<div class="row">
<div class="col s12 m6">
<button type="submit" class="btn btn-primary waves-effect waves-light blue darken-4">Save</button>
<a href="<?php echo site_url("site/viewofferproduct"); ?>" class="btn btn-secondary waves-effect waves-light red">Cancel</a>
</div>
</div>
</form>
</div>
