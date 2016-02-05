<div class="row">
<div class="col s12">
<h4 class="pad-left-15 capitalize">Edit subtype</h4>
</div>
</div>
<div class="row">
<form class='col s12' method='post' action='<?php echo site_url("site/editsubtypesubmit");?>' enctype= 'multipart/form-data'>
<input type="hidden" id="normal-field" class="form-control" name="id" value="<?php echo set_value('id',$before->id);?>" style="display:none;">
<div class="row">
<div class="input-field col s6">
<label for="name">name</label>
<input type="text" id="name" name="name" value='<?php echo set_value('name',$before->name);?>'>
</div>
</div>


<div class="row">
           <div class="col s12 m6">
               <label>Description</label>
               <textarea id="some-textarea" name="description" placeholder="Enter text ...">
                   <?php echo set_value('description',$before->description);?>
               </textarea>
           </div>
       </div>
<div class="row">
			<div class="file-field input-field col m6 s12">
				<span class="img-center big image1">
                   			<?php if ($before->image == '') {
} else {
    ?><img src="<?php echo base_url('uploads').'/'.$before->image;
    ?>">
						<?php
} ?></span>
				<div class="btn blue darken-4">
					<span>Image</span>
					<input name="image" type="file" multiple>
				</div>
				<div class="file-path-wrapper">
					<input class="file-path validate image11" type="text" placeholder="Upload one or more files" value="<?php echo set_value('image1', $before->image1);?>">
				</div>
<!--				<div class="md4"><a class="waves-effect waves-light btn red clearimg input-field ">Clear Image</a></div>-->
			</div>

		</div>

<div class="row">
<div class="input-field col s6">
<label for="order">order</label>
<input type="text" id="order" name="order" value='<?php echo set_value('order',$before->order);?>'>
</div>
</div>

<div class="row">
<div class="input-field col s6">
  <select id="status" name="status"  value="<?php echo set_value('status');?>">
      <option value="0">Enable</option>
      <option value="1">Disable</option>

  </select>
<label for="status">status</label>
<!-- <input type="text" id="status" name="status" value='<?php //echo set_value('status');?>'> -->
</div>
</div>
<!-- <div class="row">
<div class="input-field col s6">
<label for="status">status</label>
<input type="text" id="status" name="status" value='<?php //echo set_value('status',$before->status);?>'>
</div>
</div> -->
<div class="row">
<div class="col s6">
<button type="submit" class="btn btn-primary waves-effect waves-light  blue darken-4">Save</button>
<a href='<?php echo site_url("site/viewsubtype"); ?>' class='btn btn-secondary waves-effect waves-light red'>Cancel</a>
</div>
</div>
</form>
</div>
