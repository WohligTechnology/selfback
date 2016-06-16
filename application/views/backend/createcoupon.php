<div class="row">
    <div class="col s12">
        <h4 class="pad-left-15">Create Coupon</h4>
    </div>
    <form class='col s12' method='post' action='<?php echo site_url("site/createcouponsubmit");?>' enctype='multipart/form-data'>
             <div class="row">
            <div class="input-field col s12 m8">
                <?php echo form_dropdown('type', $type, set_value('type')); ?>
                    <label>Type*</label>
            </div>
        </div>  
           <div class="row">
            <div class="input-field col s12 m8">
                <?php echo form_dropdown('currency', $currency, set_value('currency')); ?>
                    <label>Currency*</label>
            </div>
        </div>
           <div class="row">
            <div class="input-field col s6">
                <label for="Name">Name*</label>
                <input type="text" id="Name" name="name" value='<?php echo set_value('name');?>'>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12 m8">
                <?php echo form_dropdown('status', $status, set_value('status')); ?>
                    <label>Status*</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s2">
                <label for="discount">Discount in %*</label>
                <input type="number" min="1" max="100" id="discount" name="discount" value='<?php echo set_value('discount');?>'>
            </div>
        </div>  
           <div class="row">
            <div class="input-field col s6">
                <label for="min">Minimum Cart Amount*</label>
                <input type="text" id="min" name="min" value='<?php echo set_value('min');?>'>
            </div>
        </div> 
           <div class="row">
            <div class="input-field col s6">
                <label for="max">Maximum Discount Amount*</label>
                <input type="text" id="max" name="max" value='<?php echo set_value('max');?>'>
            </div>
        </div>  
            <div class="row" style="display:none">
            <div class="input-field col s6">
                <label for="count">Count*</label>
                <input type="text" id="count" name="count" value='<?php echo set_value('count');?>'>
            </div>
        </div> 
        <div class="row">
            <div class="col s12 m6">
                <button type="submit" class="btn btn-primary waves-effect waves-light blue darken-4">Save</button>
                <a href="<?php echo site_url("site/viewcoupon"); ?>" class="btn btn-secondary waves-effect waves-light red">Cancel</a>
            </div>
        </div>
    </form>
</div>
