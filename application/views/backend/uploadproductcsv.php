<div class="container">
    <div class="row">
        <div class="col s12 right">
<div class="button1 pull-right">
   
<a class="waves-effect waves-light btn waves-effect waves-light btn blue darken-4" href="<?php echo site_url('site/viewproduct'); ?>">Back</a>
<a class="waves-effect waves-light btn pleft waves-effect waves-light btn blue darken-4" href="<?php echo base_url('uploads/fynxproductupload.csv');?>"><i class='material-icons propericon'>system_update_alt</i>Download CSV Format</a>
</div>
	</div>
        </div>
    </div>
</div>
   <div class="row">
    <div class="col s12">
       

    </div>
    <form class="col s12" method="post" action="<?php echo site_url('site/uploadproductcsvsubmit');?>" enctype="multipart/form-data">

       	<div class="row">
			<div class="file-field input-field col m6 s12">
				<div class="btn blue darken-4">
					<span>Product CSV File</span>
					<input name="file" type="file" multiple>
				</div>
				<div class="file-path-wrapper">
					<input class="file-path validate" type="text" placeholder="Upload one or more files" value="<?php echo set_value('file');?>">
				</div>
			</div>
		</div>
       
        <div class="row">
            <div class="col s12 m6">
                    <div class=" form-group">
                <button type="submit" class="btn btn-primary waves-effect waves-light blue darken-4">Save</button>
                <a href="<?php echo site_url('site/viewproduct'); ?>" class="btn btn-secondary waves-effect waves-light  red">Cancel</a>
        </div>
            </div>
        </div>

    </form>
</div>

