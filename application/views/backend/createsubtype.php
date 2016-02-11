<div class="row">
<div class="col s12">
<h4 class="pad-left-15 capitalize">Create Health Packages Type</h4>
</div>
<form class='col s12' method='post' action='<?php echo site_url("site/createsubtypesubmit");?>' enctype= 'multipart/form-data'>
<div class="row">
<div class="input-field col s6">
<label for="name">name</label>
<input type="text" id="name" name="name" value='<?php echo set_value('name');?>'>
</div>
</div>

<div class="row">
           <div class="col s12 m6">
               <label>Description</label>
               <textarea id="some-textarea" name="description" placeholder="Enter text ...">
                   <?php echo set_value('description');?>
               </textarea>
           </div>
       </div>

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
<a href="<?php echo site_url("site/viewsubtype"); ?>" class="btn btn-secondary waves-effect waves-light red">Cancel</a>
</div>
</div>
</form>
</div>
