<div class="row">
<div class="col s12">
<h4 class="pad-left-15">Create Offer</h4>
</div>
<form class='col s12' method='post' action='<?php echo site_url("site/createoffersubmit");?>' enctype= 'multipart/form-data'>
<div class="row">
<div class="input-field col s6">
<label for="Title">Title</label>
<input type="text" id="Title" name="title" value='<?php echo set_value('title');?>'>
</div>
</div>
<div class="row">
<div class="input-field col s12">
<textarea name="description" class="materialize-textarea" length="400"><?php echo set_value( 'description');?></textarea>
<label>Description</label>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Price">Price</label>
<input type="text" id="Price" name="price" value='<?php echo set_value('price');?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Status">Status</label>
<input type="text" id="Status" name="status" value='<?php echo set_value('status');?>'>
</div>
</div>
<div class="row">
<div class="file-field input-field col s12 m6">
<div class="btn blue darken-4">
<span>Image</span>
<input type="file" name="image" multiple>
</div>
<div class="file-path-wrapper">
<input class="file-path validate" type="text" placeholder="Upload one or more files" value='<?php echo set_value('image');?>'>
</div>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="From Date">From Date</label>
<input type="date" id="From Date" name="fromdate" value='<?php echo set_value('fromdate');?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="To Date">To Date</label>
<input type="text" id="To Date" name="todate" value='<?php echo set_value('todate');?>'>
</div>
</div>
<div class="row">
<div class="col s12 m6">
<button type="submit" class="btn btn-primary waves-effect waves-light blue darken-4">Save</button>
<a href="<?php echo site_url("site/viewoffer"); ?>" class="btn btn-secondary waves-effect waves-light red">Cancel</a>
</div>
</div>
</form>
</div>
