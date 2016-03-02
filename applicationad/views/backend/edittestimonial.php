<div class="row">
    <div class="col s12">
        <h4 class="pad-left-15">Create Testimonials</h4>
    </div>
    <form class='col s12' method='post' action='<?php echo site_url("site/edittestimonialsubmit");?>' enctype='multipart/form-data'>
      <input type="hidden" id="normal-field" class="form-control" name="id" value="<?php echo set_value('id',$before->id);?>" style="display:none;">

        <div class="row">
            <div class="input-field col s6">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" value='<?php echo set_value(' name ',$before->name);?>'>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s6">
                <label for="location">location</label>
                <input type="text" id="location" name="location" value='<?php echo set_value(' location ',$before->location);?>'>
            </div>
        </div>

        <div class="row">
            <div class="input-field col s6">
                <label for="location">Weight</label>
                <input type="text" id="weight" name="weight" value='<?php echo set_value(' weight ',$before->weight);?>'>
            </div>
        </div>

         <div class="row">
            <div class="input-field col m6 s12"><textarea name="description" class="materialize-textarea" length="120"><?php echo set_value( 'description',$before->description);?></textarea>
                <label>Description</label>
            </div>
        </div>
        <div class="row">
            <div class="col s12 m6">
                <button type="submit" class="btn btn-primary waves-effect waves-light blue darken-4">Save</button>
                <a href="<?php echo site_url("site/viewtestimonial"); ?>" class="btn btn-secondary waves-effect waves-light red">Cancel</a>
            </div>
        </div>
    </form>
</div>
