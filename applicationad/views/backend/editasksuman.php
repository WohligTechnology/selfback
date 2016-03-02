<div class="row">
<div class="col s12">
<h4 class="pad-left-15">Edit Ask Suman</h4>
</div>
</div>
<div class="row">
<form class='col s12' method='post' action='<?php echo site_url("site/editasksumansubmit");?>' enctype= 'multipart/form-data'>
<input type="hidden" id="normal-field" class="form-control" name="id" value="<?php echo set_value('id',$before->id);?>" style="display:none;">
<!-- <div class=" row">
<div class=" input-field col s6">
<?php //echo form_dropdown("category",$category,set_value('category',$before->category));?>
<label>Category</label>
</div>
</div> -->

<div class="row">
<div class="input-field col s6">
<label for="Name">Category</label>
<input type="text" id="category" name="category" value='<?php echo set_value('category',$before->category);?>'>
</div>
</div>

<div class="row">
<div class="input-field col s6">
<label for="Name">Name</label>
<input type="text" id="name" name="name" value='<?php echo set_value('name',$before->name);?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="Email Id">Email Id</label>
<input type="email" id="Email Id" name="email" value='<?php echo set_value('email',$before->email);?>'>
</div>
</div>

<div class="row">
    <div class="col s12 m6">
        <label>Question</label>
        <textarea class="materialize-textarea"  name="question" placeholder="Enter text ...">
            <?php echo set_value('question', $before->question);?>
        </textarea>
    </div>
</div>

<div class="row">
<div class="col s6">
<button type="submit" class="btn btn-primary waves-effect waves-light  blue darken-4">Save</button>
<a href='<?php echo site_url("site/viewasksuman"); ?>' class='btn btn-secondary waves-effect waves-light red'>Cancel</a>
</div>
</div>
</form>
</div>
