<div class="row">
<div class="col s12">
<h4 class="pad-left-15 capitalize">Create Recipe Image</h4>
</div>
<form class='col s12' method='post' action='<?php echo site_url("site/createrecipeimagesubmit");?>' enctype= 'multipart/form-data'>


<input type="hidden" name="recipe" value='<?php echo $this->input->get("id");?>'>
<div class="row">
  <div class="file-field input-field col m6 s12">
    <div class="btn blue darken-4">
      <span>Image</span>
      <input name="image" type="file" multiple>
    </div>
    <div class="file-path-wrapper">
      <input class="file-path validate" type="text" placeholder="Upload one or more files" value="<?php echo set_value('image');?>">
    </div>
  </div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="order">order</label>
<input type="text" id="order" name="order" value='<?php echo set_value('order');?>'>
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
<a href="<?php echo site_url("site/viewrecipeimage?id=").$this->input->get("id"); ?>" class="btn btn-secondary waves-effect waves-light red">Cancel</a>
</div>
</div>
</form>
</div>
