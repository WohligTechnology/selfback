<div class="row">
<div class="col s12">
<h4 class="pad-left-15">Create Recipes</h4>
</div>
<form class='col s12' method='post' action='<?php echo site_url("site/editrecipessubmit");?>' enctype='multipart/form-data'>
  <input type="hidden" id="normal-field" class="form-control" name="id" value="<?php echo set_value('id',$before->id);?>" style="display:none;">

<div class="row">
<div class="input-field col s6">
<label for="Name">Recipe Name</label>
<input type="text" id="Name" name="name" value='<?php echo set_value('name',$before->name);?>'>
</div>
</div>


<div class="row">
    <div class="col s12 m6">
        <label>Description</label>
        <textarea id="some-textarea" class="materialize-textarea"  name="description" placeholder="Enter text ...">
            <?php echo set_value('description',$before->description);?>
        </textarea>
    </div>
</div>

<div class="row">
    <div class="col s12 m6">
        <label>Ingredients</label>
        <textarea id="some-textarea" class="materialize-textarea"  name="ingredients" placeholder="Enter text ...">
            <?php echo set_value('ingredients',$before->ingredients);?>
        </textarea>
    </div>
</div>

<div class="row">
    <div class="col s12 m6">
        <label>Method</label>
        <textarea id="some-textarea" class="materialize-textarea"  name="method" placeholder="Enter text ...">
            <?php echo set_value('method',$before->method);?>
        </textarea>
    </div>
</div>

<div class="row">
    <div class="col s12 m6">
        <label>Value per serve</label>
        <textarea id="some-textarea" class="materialize-textarea"  name="valueperserve" placeholder="Enter text ...">
            <?php echo set_value('valueperserve',$before->valueperserve);?>
        </textarea>
    </div>
</div>

 <div class="row">
            <div class="input-field col s12 m8">
                <?php echo form_dropdown('status', $status, set_value('status',$before->status)); ?>
                 <label>Status</label>
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
        					<input class="file-path validate image1" type="text" placeholder="Upload one or more files" value="<?php echo set_value('image1', $before->image1);?>">
        				</div>
        <!--				<div class="md4"><a class="waves-effect waves-light btn red clearimg input-field ">Clear Image</a></div>-->
        			</div>

        		</div>

<div class="row">
<div class="col s12 m6">
<button type="submit" class="btn btn-primary waves-effect waves-light blue darken-4">Save</button>
<a href="<?php echo site_url("site/viewrecipes"); ?>" class="btn btn-secondary waves-effect waves-light red">Cancel</a>
</div>
</div>
</form>
</div>
