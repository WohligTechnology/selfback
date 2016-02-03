<div class="row">
    <div class="col s12">
        <h4 class="pad-left-15">Create Product</h4>
    </div>
    <form class='col s12' method='post' action='<?php echo site_url("site/createproductsubmit");?>' enctype='multipart/form-data'>


        <div class="row">
            <div class="input-field col s6">
                <label for="Name">Name</label>
                <input type="text" id="Name" name="name" value='<?php echo set_value(' name ');?>'>
            </div>
        </div>
    <div class="row">
            <div class="input-field col s6">
                <label for="sku">Sku</label>
                <input type="text" id="sku" name="sku" value='<?php echo set_value(' sku ');?>'>
            </div>
        </div>
        <div class="row">
            <div class="col s12 m6">
                <label>About</label>
                <textarea class="materialize-textarea"  name="about" placeholder="Enter text ...">
                    <?php echo set_value('about');?>
                </textarea>
            </div>
        </div>

        <div class="row">
            <div class="col s12 m6">
                <label>Nutritional Value</label>
                <textarea class="materialize-textarea"  name="nutritionalvalue" placeholder="Enter text ...">
                    <?php echo set_value('nutritionalvalue');?>
                </textarea>
            </div>
        </div>


        <div class="row">
            <div class="input-field col s12 m8">
                <?php echo form_dropdown('visibility', $visibility, set_value('visibility')); ?>
                    <label> Visibility</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12 m8">
                <?php echo form_dropdown('status', $status, set_value('status')); ?>
                    <label>Status</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s6">
                <label for="Quantity">Quantity</label>
                <input type="text" id="Quantity" name="quantity" value='<?php echo set_value(' quantity ');?>'>
            </div>
        </div>

        <div class="row">
            <div class="input-field col s6">
                <label for="Quantity">Weight</label>
                <input type="text" id="weight" name="weight" value='<?php echo set_value('weight');?>'>
            </div>
        </div>
        <!-- <div class="row">
            <div class="input-field col s12 m8">
                <?php //echo form_dropdown('type', $type, set_value('type')); ?>
                    <label>Type</label>
            </div>
        </div> -->


        <div class="row">
            <div class="input-field col s6">
                <label for="Price">Price</label>
                <input type="text" id="Price" name="price" value='<?php echo set_value(' price ');?>'>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s6">
                <label for="discountprice">Discount Price</label>
                <input type="text" id="discountprice" name="discountprice" value='<?php echo set_value('discountprice');?>'>
            </div>
        </div>

        <div class="row">
            <div class="input-field col s12 m8">
                <?php echo form_dropdown('category', $category, set_value('category'),"id=catid"); ?>
                    <label> Category</label>
            </div>
        </div>
         <div class="row">
            <div class="input-field col s12 m6">
                <select name="subcategory" id="subcategory">
                    <option value="">Select Subcategory</option>
                </select>
                <label>Sub Category</label>
            </div>
        </div>
<!--
        <div class="row">
            <div class="input-field col s12 m8">
                <?php echo form_dropdown('subcategory', $subcategory, set_value('subcategory')); ?>
                    <label>Sub Category</label>
            </div>
        </div>
-->
        <!-- <div class="row">
            <div class="input-field col s12 m8">
                <?php //echo form_dropdown('color', $color, set_value('color')); ?>
                    <label>Color</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12 m8">
                <?php //echo form_dropdown('size', $size, set_value('size')); ?>
                    <label>Size</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12 m8">
                <?php //echo form_dropdown('sizechart', $sizechart, set_value('sizechart')); ?>
                    <label>Size Chart</label>
            </div>
        </div> -->
        <div class="row" style="display:none">
            <div class="input-field col s12 m8">

                <?php echo form_multiselect('relatedproduct[]', $relatedproduct); ?>
                <label>Related Product</label>
            </div>
        </div>
        <script>
            $('select').material_select();
        </script>
        <div class="row">
            <div class="input-field col s6">
                <label for="baseproduct">Base Product</label>
                <input type="text" id="baseproduct" name="baseproduct" value='<?php echo set_value('baseproduct');?>'>
            </div>
        </div>

        <div class="row">
            <div class="file-field input-field col s12 m6">
                <div class="btn blue darken-4">
                    <span>Image1</span>
                    <input type="file" name="image1" multiple>
                </div>
                <div class="file-path-wrapper">
                    <input class="file-path validate" type="text" placeholder="Upload one or more files" value='<?php echo set_value(' image1 ');?>'>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="file-field input-field col s12 m6">
                <div class="btn blue darken-4">
                    <span>Image2</span>
                    <input type="file" name="image2" multiple>
                </div>
                <div class="file-path-wrapper">
                    <input class="file-path validate" type="text" placeholder="Upload one or more files" value='<?php echo set_value(' image2 ');?>'>
                </div>
            </div>
        </div>

<!--
        <div class="row">
            <div class="file-field input-field col s12 m6">
                <div class="btn blue darken-4">
                    <span>Image3</span>
                    <input type="file" name="image3" multiple>
                </div>
                <div class="file-path-wrapper">
                    <input class="file-path validate" type="text" placeholder="Upload one or more files" value='<?php echo set_value(' image3 ');?>'>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="file-field input-field col s12 m6">
                <div class="btn blue darken-4">
                    <span>Image4</span>
                    <input type="file" name="image4" multiple>
                </div>
                <div class="file-path-wrapper">
                    <input class="file-path validate" type="text" placeholder="Upload one or more files" value='<?php echo set_value(' image4 ');?>'>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="file-field input-field col s12 m6">
                <div class="btn blue darken-4">
                    <span>Image5</span>
                    <input type="file" name="image5" multiple>
                </div>
                <div class="file-path-wrapper">
                    <input class="file-path validate" type="text" placeholder="Upload one or more files" value='<?php echo set_value(' image5 ');?>'>
                </div>
            </div>
        </div>
-->
        <div class="row">
            <div class="col s12 m6">
                <button type="submit" class="btn btn-primary waves-effect waves-light blue darken-4">Save</button>
                <a href="<?php echo site_url("site/viewproduct"); ?>" class="btn btn-secondary waves-effect waves-light red">Cancel</a>
            </div>
        </div>
    </form>
</div>
 <script>
         function populate(data) {
        var $forquestion = $("select[name=subcategory]");
        $forquestion.html("");
        $forquestion.append("<option value=''>Select Subcategory</option>");
        for (var i = 0; i < data.length; i++) {

            $forquestion.append("<option value='" + data[i].id + "'>" + data[i].name + "</option>");
            $('select').material_select();
        }
    }
  $(document).ready(function () {
        var $cat = $("select[name=category]");
        var new_base_url = "<?php echo site_url(); ?>";

        $cat.change(function () {
            $.getJSON(new_base_url + '/site/getCategoryBySubCategory', {
                id: $("#catid").val()
            }, function (data) {
                populate(data);
            });
        });

    });
    </script>
