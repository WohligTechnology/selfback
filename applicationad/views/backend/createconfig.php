<div class="row">
<div class="col s12">
<h4 class="pad-left-15">Create Config</h4>
</div>
<form class='col s12' method='post' action='<?php echo site_url("site/createconfigsubmit");?>' enctype= 'multipart/form-data'>
<div class="row">
<div class="input-field col s6">
<label for="Text">Text</label>
<input type="text" id="Text" name="text" value='<?php echo set_value('text');?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Content">Content</label>
<input type="text" id="Content" name="content" value='<?php echo set_value('content');?>'>
</div>
</div>
<div class="row">
<div class="col s12 m6">
<button type="submit" class="btn btn-primary waves-effect waves-light blue darken-4">Save</button>
<a href="<?php echo site_url("site/viewconfig"); ?>" class="btn btn-secondary waves-effect waves-light red">Cancel</a>
</div>
</div>
</form>
</div>
