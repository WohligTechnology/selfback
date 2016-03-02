<div class="row">
<div class="col s12">
<h4 class="pad-left-15 capitalize">Edit Video</h4>
</div>
</div>
<div class="row">
<form class='col s12' method='post' action='<?php echo site_url("site/editvideosubmit");?>' enctype= 'multipart/form-data'>
<input type="hidden" id="normal-field" class="form-control" name="id" value="<?php echo set_value('id',$before->id);?>" style="display:none;">
<div class="row">
<div class="input-field col s6">
<label for="name">name</label>
<input type="text" id="name" name="name" value='<?php echo set_value('name',$before->name);?>'>
</div>
</div>



<div class="row">
<div class="input-field col s6">
<label for="year">Link</label>
<input type="text" id="link" name="link" value='<?php echo set_value('order',$before->link);?>'>
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
<a href='<?php echo site_url("site/viewvideo"); ?>' class='btn btn-secondary waves-effect waves-light red'>Cancel</a>
</div>
</div>
</form>
</div>
