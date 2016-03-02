<div class="row">
<div class="col s12">
<h4 class="pad-left-15">Create Recipes</h4>
</div>
<form class='col s12' method='post' action='<?php echo site_url("site/createrecipessubmit");?>' enctype= 'multipart/form-data'>

<div class="row">
<div class="input-field col s6">
<label for="Name">Recipe Name</label>
<input type="text" id="Name" name="name" value='<?php echo set_value('name');?>'>
</div>
</div>


<div class="row">
    <div class="col s12 m6">
        <label>Description</label>
        <textarea id="some-textarea" class="materialize-textarea"  name="description" placeholder="Enter text ...">
            <?php echo set_value('description');?>
        </textarea>
    </div>
</div>

<div class="row">
    <div class="col s12 m6">
        <label>Ingredients</label>
        <textarea id="some-textarea" class="materialize-textarea"  name="ingredients" placeholder="Enter text ...">
            <?php echo set_value('ingredients');?>
        </textarea>
    </div>
</div>

<div class="row">
    <div class="col s12 m6">
        <label>Method</label>
        <textarea id="some-textarea" class="materialize-textarea"  name="method" placeholder="Enter text ...">
            <?php echo set_value('method');?>
        </textarea>
    </div>
</div>

<div class="row">
    <div class="col s12 m6">
        <label>Value per serve</label>
        <textarea id="some-textarea" class="materialize-textarea"  name="valueperserve" placeholder="Enter text ...">
            <?php echo set_value('valueperserve');?>
        </textarea>
    </div>
</div>

 <div class="row">
            <div class="input-field col s12 m8">
                <?php echo form_dropdown('status', $status, set_value('status')); ?>
                 <label>Status</label>
            </div>
        </div>
<div class="row">
<div class="file-field input-field col s12 m6">
<div class="btn blue darken-4">
<span>Image</span>
<input type="file" name="image1" multiple>
</div>
<div class="file-path-wrapper">
<input class="file-path validate" type="text" placeholder="Upload one or more files" value='<?php //echo set_value('image');?>'>
</div>
</div>
<span style="display:inline-block; margin-top:30px;">350 X 500</span>
</div>

<div class="row">
<div class="col s12 m6">
<button type="submit" class="btn btn-primary waves-effect waves-light blue darken-4">Save</button>
<a href="<?php echo site_url("site/viewrecipes"); ?>" class="btn btn-secondary waves-effect waves-light red">Cancel</a>
</div>
</div>
</form>
</div>
