<div class="row">
<div class="col s12">
<h4 class="pad-left-15 capitalize">Create relatedblog</h4>
</div>
<form class='col s12' method='post' action='<?php echo site_url("site/createrealtedblogsubmit");?>' enctype= 'multipart/form-data'>

  <div class="row">
             <div class="input-field col s12 m8">
                 <?php echo form_dropdown('blog', $blog, set_value('blog')); ?>
                  <label>Related Blog
             </div>
         </div>

         <div class="row" style="display:block">
                    <div class="input-field col s12 m8">
                        <?php echo form_dropdown('bid', $bid, set_value('bid',$this->input->get("id"))); ?>
                         <label> Product</label>
                    </div>
                </div>
<div class="row">
<div class="col s12 m6">
<button type="submit" class="btn btn-primary waves-effect waves-light blue darken-4">Save</button>
<a href="<?php echo site_url("site/viewrealtedblog"); ?>" class="btn btn-secondary waves-effect waves-light red">Cancel</a>
</div>
</div>
</form>
</div>
