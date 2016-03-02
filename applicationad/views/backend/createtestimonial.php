<div class="row">
    <div class="col s12">
        <h4 class="pad-left-15">Create Testimonial</h4>
    </div>
    <form class='col s12' method='post' action='<?php echo site_url("site/createtestimonialsubmit");?>' enctype='multipart/form-data'>
        <div class="row">
            <div class="input-field col s6">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" value='<?php echo set_value(' name ');?>'>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s6">
                <label for="location">location</label>
                <input type="text" id="location" name="location" value='<?php echo set_value(' location ');?>'>
            </div>
        </div>

        <div class="row">
            <div class="input-field col s6">
                <label for="location">Weight</label>
                <input type="text" id="weight" name="weight" value='<?php echo set_value(' weight ');?>'>
            </div>
        </div>

        <!-- <div class="row">
            <div class="file-field input-field col s12 m6">
                <div class="btn blue darken-4">
                    <span>Image</span>
                    <input type="file" name="image" multiple>
                </div>
                <div class="file-path-wrapper">
                    <input class="file-path validate" type="text" placeholder="Upload one or more files" value='<?php echo set_value(' image ');?>'>
                </div>
            </div>
        </div> -->
         <div class="row">
            <div class="input-field col m6 s12">
                <textarea name="description" class="materialize-textarea" length="120">
                    <?php echo set_value( 'description');?>
                </textarea>
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
