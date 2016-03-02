<div class="row">
<div class="col s12">
<h4 class="pad-left-15">Edit Category</h4>
</div>
</div>
<div class="row">
<form class='col s12' method='post' action='<?php echo site_url("site/editcategorysubmit");?>' enctype= 'multipart/form-data'>
<input type="hidden" id="normal-field" class="form-control" name="id" value="<?php echo set_value('id',$before->id);?>" style="display:none;">
<div class="row">
<div class="input-field col s6">
<label for="Order">Order</label>
<input type="text" id="Order" name="order" value='<?php echo set_value('order',$before->order);?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Name">Name</label>
<input type="text" id="Name" name="name" value='<?php echo set_value('name',$before->name);?>'>
</div>
</div>
<div class="row">
    <div class="col s12 m6">
        <label>Description</label>
        <textarea class="materialize-textarea"  name="description" placeholder="Enter text ...">
              <?php echo set_value('about', $before->description);?>
        </textarea>
    </div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Parent">Parent</label>
<input type="text" id="Parent" name="parent" value='<?php echo set_value('parent',$before->parent);?>'>
</div>
</div>
 <div class="row">
            <div class="input-field col s12 m8">
                <?php echo form_dropdown('status', $status, set_value('status',$before->status)); ?>
                 <label>Status</label>
            </div>
        </div>
<div class="row">
			<div class="file-field input-field col m6 s12">
				<span class="img-center big image1">
                   			<?php if ($before->image1 == '') {
} else {
    ?><img src="<?php echo base_url('uploads').'/'.$before->image1;
    ?>">
						<?php
} ?></span>
				<div class="btn blue darken-4">
					<span>Image1</span>
					<input name="image1" type="file" multiple>
				</div>
				<div class="file-path-wrapper">
					<input class="file-path validate image11" type="text" placeholder="Upload one or more files" value="<?php echo set_value('image1', $before->image1);?>">
				</div>
<!--				<div class="md4"><a class="waves-effect waves-light btn red clearimg input-field ">Clear Image</a></div>-->
			</div>

		</div>
    <div class="row">
			<div class="file-field input-field col m6 s12">
				<span class="img-center big image1">
                   			<?php if ($before->image2 == '') {
} else {
    ?><img src="<?php echo base_url('uploads').'/'.$before->image2;
    ?>">
						<?php
} ?></span>
				<div class="btn blue darken-4">
					<span>Image2</span>
					<input name="image2" type="file" multiple>
				</div>
				<div class="file-path-wrapper">
					<input class="file-path validate image21" type="text" placeholder="Upload one or more files" value="<?php echo set_value('image2', $before->image2);?>">
				</div>
<!--				<div class="md4"><a class="waves-effect waves-light btn red clearimg input-field ">Clear Image</a></div>-->
			</div>

		</div>
<div class="row">
<div class="col s6">
<button type="submit" class="btn btn-primary waves-effect waves-light  blue darken-4">Save</button>
<a href='<?php echo site_url("site/viewcategory"); ?>' class='btn btn-secondary waves-effect waves-light red'>Cancel</a>
</div>
</div>
</form>
</div>
