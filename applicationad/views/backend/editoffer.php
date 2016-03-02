<div class="row">
<div class="col s12">
<h4 class="pad-left-15">Edit Offer</h4>
</div>
</div>
<div class="row">
<form class='col s12' method='post' action='<?php echo site_url("site/editoffersubmit");?>' enctype= 'multipart/form-data'>
<input type="hidden" id="normal-field" class="form-control" name="id" value="<?php echo set_value('id',$before->id);?>" style="display:none;">
<div class="row">
<div class="input-field col s6">
<label for="Title">Title</label>
<input type="text" id="Title" name="title" value='<?php echo set_value('title',$before->title);?>'>
</div>
</div>
<div class="row">
<div class="col s12 m6">
<label>Description</label>
<textarea name="description" placeholder="Enter text ..."><?php echo set_value( 'description',$before->description);?></textarea>
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
<label for="Status">Status</label>
<input type="text" id="Status" name="status" value='<?php echo set_value('status',$before->status);?>'>
</div>
</div>
<input type="file" id="normal-field" class="form-control" name="image" value='<?php echo set_value('image',$before->image);?>'>
<div class="row">
<div class="file-field input-field col s12 m6">
<span class="img-center big">
image; ?>" ></span>
<div class="btn blue darken-4">
<span>Image</span>
<input type="file" name="image" multiple>
</div>
<div class="file-path-wrapper">
<input class="file-path validate" type="text" placeholder="Upload one or more files" value='<?php echo set_value('image',$before->image);?>'>
<?php if($before->image == "") { } else { ?> <?php } ?>
</div>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="From Date">From Date</label>
<input type="date" id="From Date" name="fromdate" value='<?php echo set_value('fromdate',$before->fromdate);?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="To Date">To Date</label>
<input type="text" id="To Date" name="todate" value='<?php echo set_value('todate',$before->todate);?>'>
</div>
</div>
<div class="row">
<div class="col s6">
<button type="submit" class="btn btn-primary waves-effect waves-light  blue darken-4">Save</button>
<a href='<?php echo site_url("site/viewoffer"); ?>' class='btn btn-secondary waves-effect waves-light red'>Cancel</a>
</div>
</div>
</form>
</div>
