<div class="row">
<div class="col s12">
<h4 class="pad-left-15">Create Related Products</h4>
</div>
<form class='col s12' method='post' action='<?php echo site_url("site/createproductimagesubmit");?>' enctype= 'multipart/form-data'>


 <div class="row">
            <div class="input-field col s12 m8">
                <?php echo form_dropdown('relatedproduct', $relatedproduct, set_value('relatedproduct')); ?>
                 <label>Product</label>
            </div>
        </div>
 <div class="row" style="display:block">
            <div class="input-field col s12 m8">
                <?php echo form_dropdown('product', $product, set_value('product',$this->input->get("id"))); ?>
                 <label> Product</label>
            </div>
        </div>



 <!-- <div class="row">
            <div class="input-field col s12 m8">
                <?php //echo form_dropdown('design', $design, set_value('design')); ?>
                 <label>Design</label>
            </div>
        </div> -->

<div class="row">
<div class="col s12 m6">
<button type="submit" class="btn btn-primary waves-effect waves-light blue darken-4">Save</button>
<a href="<?php echo site_url("site/viewproductimage?id=").$this->input->get("id"); ?>" class="btn btn-secondary waves-effect waves-light red">Cancel</a>
</div>
</div>
</form>
</div>
