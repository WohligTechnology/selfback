<div class="row">
    <div class="col s12">
        <h4 class="pad-left-15">Edit Product</h4>
    </div>
</div>
<div class="row">
    <form class='col s12' method='post' action='<?php echo site_url("site/editproductsubmit");?>' enctype='multipart/form-data'>
        <input type="hidden" id="normal-field" class="form-control" name="id" value="<?php echo set_value('id',$before->id);?>" style="display:none;">



        <div class="row">
            <div class="input-field col s6">
                <label for="Name">Name</label>
                <input type="text" id="Name" name="name" value='<?php echo set_value(' name ',$before->name);?>'>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s6">
                <label for="sku">Sku</label>
                <input type="text" id="sku" name="sku" value='<?php echo set_value(' sku ',$before->sku);?>'>
            </div>
        </div>



        <div class="row">
            <div class="col s12 m6">
                <label>About</label>
                <textarea class="materialize-textarea"  name="about" placeholder="Enter text ...">
                    <?php echo set_value('about', $before->about);?>
                </textarea>
            </div>
        </div>

        <div class="row">
            <div class="col s12 m6">
                <label>Nutritional Value</label>
                <textarea class="materialize-textarea"  name="nutritionalvalue" placeholder="Enter text ...">
                    <?php echo set_value('nutritionalvalue', $before->nutritionalvalue);?>
                </textarea>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12 m8">
                <?php echo form_dropdown('visibility', $visibility, set_value('visibility',$before->visibility)); ?>
                    <label> Visibility</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12 m8">
                <?php echo form_dropdown('status', $status, set_value('status',$before->status)); ?>
                    <label>Status</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s6">
                <label for="Quantity">Quantity</label>
                <input type="text" id="Quantity" name="quantity" value='<?php echo set_value('quantity ',$before->quantity);?>'>
            </div>
        </div>


        <div class="row">
            <div class="input-field col s6">
                <label for="Quantity">Weight</label>
                <input type="text" id="weight" name="weight" value='<?php echo set_value('weight',$before->weight);;?>'>
            </div>
        </div>


        <!-- <div class="row">
            <div class="input-field col s12 m8">
                <?php //echo form_dropdown('type', $type, set_value('type',$before->type)); ?>
                    <label>Type</label>
            </div>
        </div> -->
        <div class="row">
            <div class="input-field col s6">
                <label for="Price">Price</label>
                <input type="text" id="Price" name="price" value='<?php echo set_value(' price ',$before->price);?>'>
            </div>
        </div>
         <div class="row">
            <div class="input-field col s6">
                <label for="discountprice">Discount Price</label>
                <input type="text" id="discountprice" name="discountprice" value='<?php echo set_value('discountprice',$before->discountprice);?>'>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12 m8">
                <?php echo form_dropdown('category', $category, set_value('category',$before->category),"id=catid"); ?>
                    <label> Category</label>
            </div>
        </div>  
              <div class="row">
            <div class="input-field col s12 m8">
                <?php echo form_dropdown('subcategory', $subcategory, set_value('subcategory',$before->subcategory),"id=catid"); ?>
                    <label>Sub Category</label>
            </div>
        </div>
        <!-- <div class="row">
            <div class="input-field col s12 m8">
                <?php //echo form_dropdown('color', $color, set_value('color',$before->color)); ?>
                    <label>Color</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12 m8">
                <?php //echo form_dropdown('size', $size, set_value('size',$before->size)); ?>
                    <label>Size</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12 m8">
                <?php //echo form_dropdown('sizechart', $sizechart, set_value('sizechart',$before->sizechart)); ?>
                    <label>Size Chart</label>
            </div>
        </div> -->
        <div class="row" style="display:none">
            <div class="input-field col s12 m8">
                <?php echo form_multiselect('relatedproduct[]',$relatedproduct,$selectedrelatedproduct); ?>
                    <label>Related Product</label>
            </div>
        </div>
         <div class="row">
            <div class="input-field col s6">
                <label for="baseproduct">Base Product</label>
                <input type="text" id="baseproduct" name="baseproduct" value='<?php echo set_value('baseproduct',$before->baseproduct);?>'>
            </div>
        </div>

        <!--    // IMAGE 1-->

        <div class="row">
            <div class="file-field input-field col m6 s12">
                <span class="img-center big image1">
                   			<?php
if ($before->image1 == '') {
} else {
?><img src="<?php
    echo base_url('uploads') . '/' . $before->image1;
?>">
						<?php
}
?></span>
                <div class="btn blue darken-4">
                    <span>Image1</span>
                    <input name="image1" type="file" multiple>
                </div>
                <div class="file-path-wrapper">
                    <input class="file-path validate image11" type="text" placeholder="Upload one or more files" value="<?php
echo set_value('image1', $before->image1);
?>">
                </div>

            </div>

        </div>

        <!--    // IMAGE 2-->

        <div class="row">
            <div class="file-field input-field col m6 s12">
                <span class="img-center big image1">
                   			<?php
if ($before->image2 == '') {
} else {
?><img src="<?php
    echo base_url('uploads') . '/' . $before->image2;
?>">
						<?php
}
?></span>
                <div class="btn blue darken-4">
                    <span>Image2</span>
                    <input name="image2" type="file" multiple>
                </div>
                <div class="file-path-wrapper">
                    <input class="file-path validate image21" type="text" placeholder="Upload one or more files" value="<?php
echo set_value('image2', $before->image2);
?>">
                </div>

            </div>

        </div>

        <!--    // IMAGE 3-->
<!--

        <div class="row">
            <div class="file-field input-field col m6 s12">
                <span class="img-center big image1">
                   			<?php
if ($before->image3 == '') {
} else {
?><img src="<?php
    echo base_url('uploads') . '/' . $before->image3;
?>">
						<?php
}
?></span>
                <div class="btn blue darken-4">
                    <span>Image3</span>
                    <input name="image3" type="file" multiple>
                </div>
                <div class="file-path-wrapper">
                    <input class="file-path validate image31" type="text" placeholder="Upload one or more files" value="<?php
echo set_value('image3', $before->image3);
?>">
                </div>

            </div>

        </div>
-->

        <!--    // IMAGE 4-->

<!--
        <div class="row">
            <div class="file-field input-field col m6 s12">
                <span class="img-center big image1">
                   			<?php
if ($before->image4 == '') {
} else {
?><img src="<?php
    echo base_url('uploads') . '/' . $before->image4;
?>">
						<?php
}
?></span>
                <div class="btn blue darken-4">
                    <span>Image4</span>
                    <input name="image4" type="file" multiple>
                </div>
                <div class="file-path-wrapper">
                    <input class="file-path validate image41" type="text" placeholder="Upload one or more files" value="<?php
echo set_value('image4', $before->image4);
?>">
                </div>

            </div>

        </div>
-->

        <!--    // IMAGE 5-->

        <!-- <div class="row">
            <div class="file-field input-field col m6 s12">
                <span class="img-center big image1">
                   			<?php
if ($before->image5 == '') {
} else {
?><img src="<?php
    echo base_url('uploads') . '/' . $before->image5;
?>">
						<?php
}
?></span>
                <div class="btn blue darken-4">
                    <span>Image5</span>
                    <input name="image5" type="file" multiple>
                </div>
                <div class="file-path-wrapper">
                    <input class="file-path validate image51" type="text" placeholder="Upload one or more files" value="<?php
echo set_value('image5', $before->image5);
?>">
                </div>

            </div>

        </div> -->
        <div class="row">
            <div class="col s6">
                <button type="submit" class="btn btn-primary waves-effect waves-light  blue darken-4">Save</button>
                <a href='<?php echo site_url("site/viewproduct"); ?>' class='btn btn-secondary waves-effect waves-light red'>Cancel</a>
            </div>
        </div>
    </form>
</div>
