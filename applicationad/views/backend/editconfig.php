<div class="row">
<div class="col s12">
<h4 class="pad-left-15">Edit Config</h4>
</div>
</div>
<div class="row">
<form class='col s12' method='post' action='<?php echo site_url("site/editconfigsubmit");?>' enctype= 'multipart/form-data'>
<input type="hidden" id="normal-field" class="form-control" name="id" value="<?php echo set_value('id',$before->id);?>" style="display:none;">
<div class="row">
<div class="input-field col s6">
<label for="Text">Text</label>
<input type="text" id="Text" name="text" value='<?php echo set_value('text',$before->text);?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Content">Content</label>
<input type="text" id="Content" name="content" value='<?php echo set_value('content',$before->content);?>'>
</div>
</div>
<div class="row">
<div class="col s6">
<button type="submit" class="btn btn-primary waves-effect waves-light  blue darken-4">Save</button>
<a href='<?php echo site_url("site/viewconfig"); ?>' class='btn btn-secondary waves-effect waves-light red'>Cancel</a>
</div>
</div>
</form>
</div>
