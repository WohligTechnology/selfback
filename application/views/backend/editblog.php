<div class="row">
<div class="col s12">
<h4 class="pad-left-15 capitalize">Edit blog</h4>
</div>
</div>
<div class="row">
<form class='col s12' method='post' action='<?php echo site_url("site/editblogsubmit");?>' enctype= 'multipart/form-data'>
<input type="hidden" id="normal-field" class="form-control" name="id" value="<?php echo set_value('id',$before->id);?>" style="display:none;">
<div class="row">
<div class="input-field col s6">
<label for="name">name</label>
<input type="text" id="name" name="name" value='<?php echo set_value('name',$before->name);?>'>
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
					<input class="file-path validate image11" type="text" placeholder="Upload one or more files" value="<?php echo set_value('image1', $before->image1);?>">
				</div>
<!--				<div class="md4"><a class="waves-effect waves-light btn red clearimg input-field ">Clear Image</a></div>-->
			</div>

		</div>





<div class="row">
<div class="col s12 m6">
<label>description</label>
<textarea id="some-textarea" name="description" placeholder="Enter text ...">
    <?php echo set_value( 'description',$before->description);?>
</textarea>
</div>
</div>

<div class="row">
	<?php
$mtags = array('Food','Bread');
?>

<div class="row">
	<div class="input-field col m6 s12">
		<?php echo form_dropdown( 'tag[]',$tag,  $mtags); ?>
			<label>Tags</label>
	</div>
</div>
</div>


<!-- <div class="row">
  <?php
//$mtags = array('food','b');
?>

<div class="row">
  <div class="input-field col m6 s12">
    <?php //echo form_dropdown( 'tag',$tag,  $mtags); ?>
      <label>Tags</label>
  </div>
</div>
</div> -->


<div class="row">
<div class="input-field col s6">
<label for="posted_by">posted_by</label>
<input type="text" id="posted_by" name="posted_by" value='<?php echo set_value('posted_by',$before->posted_by);?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="dateofposting">dateofposting</label>
<input type="text" id="dateofposting" name="dateofposting" value='<?php echo set_value('dateofposting',$before->dateofposting);?>'>
</div>
</div>
<div class="row">
<div class="col s6">
<button type="submit" class="btn btn-primary waves-effect waves-light  blue darken-4">Save</button>
<a href='<?php echo site_url("site/viewblog"); ?>' class='btn btn-secondary waves-effect waves-light red'>Cancel</a>
</div>
</div>
</form>
</div>
