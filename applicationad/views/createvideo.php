<div class="row">
<div class="col s12">
<h4 class="pad-left-15 capitalize">Create News</h4>
</div>
<form class='col s12' method='post' action='<?php echo site_url("site/createvideosubmit");?>' enctype= 'multipart/form-data'>
<div class="row">
<div class="input-field col s6">
<label for="name">Title</label>
<input type="text" id="name" name="name" value='<?php echo set_value('name');?>'>
</div>
</div>

<div class="row">
<div class="input-field col s6">
<label for="year">Year</label>
<input type="text" id="link" name="link" value='<?php echo set_value('link');?>'>
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
<div class="row">
<div class="col s12 m6">
<button type="submit" class="btn btn-primary waves-effect waves-light blue darken-4">Save</button>
<a href="<?php echo site_url("site/viewvideo"); ?>" class="btn btn-secondary waves-effect waves-light red">Cancel</a>
</div>
</div>
</form>
</div>
