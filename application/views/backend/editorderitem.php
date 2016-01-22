<div class="row">
<div class="col s12">
<h4 class="pad-left-15">Edit Order Item</h4>
</div>
</div>
<div class="row">
<form class='col s12' method='post' action='<?php echo site_url("site/editorderitemsubmit");?>' enctype= 'multipart/form-data'>
<input type="hidden" id="normal-field" class="form-control" name="id" value="<?php echo set_value('id',$before->id);?>" style="display:none;">
<div class="row">
<div class="input-field col s6">
<label for="Discount">Discount</label>
<input type="text" id="Discount" name="discount" value='<?php echo set_value('discount',$before->discount);?>'>
</div>
</div>
<div class=" row">
<div class=" input-field col s12 m6">
<?php echo form_dropdown("order",$order,set_value('order',$before->order));?>
<label for="Order">Order</label>
</div>
</div>
<div class=" row">
<div class=" input-field col s12 m6">
<?php echo form_dropdown("product",$product,set_value('product',$before->product));?>
<label for="product">Product</label>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Quantity">Quantity</label>
<input type="text" id="Quantity" name="quantity" value='<?php echo set_value('quantity',$before->quantity);?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Price">Price</label>
<input type="text" id="Price" name="price" value='<?php echo set_value('price',$before->price);?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Final Price">Final Price</label>
<input type="text" id="Final Price" name="finalprice" value='<?php echo set_value('finalprice',$before->finalprice);?>'>
</div>
</div>
<div class="row">
<div class="col s6">
<button type="submit" class="btn btn-primary waves-effect waves-light  blue darken-4">Save</button>
<a href='<?php echo site_url("site/vieworderitem?id=").$this->input->get("productid"); ?>" class="btn btn-secondary waves-effect waves-light red">Cancel</a>
</div>
</div>
</form>
</div>
