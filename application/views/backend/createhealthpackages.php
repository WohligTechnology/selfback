<div class="row">
<div class="col s12">
<h4 class="pad-left-15 capitalize">Create health packages</h4>
</div>
<form class='col s12' method='post' action='<?php echo site_url("site/createhealthpackagessubmit");?>' enctype= 'multipart/form-data'>
<div class="row">
<div class="input-field col s6">
  <select id="type" name="type" onchange="myf()" id="" value="<?php echo set_value('type');?>">
      <option value="Weight Loss">Weight Loss</option>
      <option value="Health Management">Health Management</option>

  </select>
<label for="type">type</label>
<!-- <input type="text" id="type" name="type" value='<?php //echo set_value('type');?>'> -->
</div>
</div>

<script>
function myf()
{
  var f=$('#type').val();
  // alert(f);


if (f == "Health Management") {
         document.getElementById('mydiv').style.display = "block";
}
else {
  document.getElementById('mydiv').style.display = "none";
}
}

</script>




<div style="display:none;" id="mydiv"  class="row">
  <div class="input-field col m6 s12">
    <?php echo form_dropdown( 'subtype',$subtype,set_value( 'subtype')); ?>
      <label>Status</label>
  </div>
</div>

<div class=" row">
<div class=" input-field col s6">
<!-- <?php //echo form_dropdown("months",$months,set_value('months'));?> -->

<label>months</label>
<input type="text" id="months" name="months" value='<?php echo set_value('months');?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="visits">Consults</label>
<input type="text" id="visits" name="visits" value='<?php echo set_value('visits');?>'>
</div>
</div>
<!-- <div class=" row">
<div class=" input-field col s6">
<?php //echo form_dropdown("plan",$plan,set_value('plan'));?>
<label>plan</label>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="price_in_INR">price_in_INR</label>
<input type="text" id="price_in_INR" name="price_in_INR" value='<?php //echo set_value('price_in_INR');?>'>
</div>
</div>
<div class="row">
<div class="input-field col s6">
<label for="price_in_dollars">price_in_dollars</label>
<input type="text" id="price_in_dollars" name="price_in_dollars" value='<?php //echo set_value('price_in_dollars');?>'>
</div>
</div>
<div class="row">
           <div class="col s12 m6">
               <label>Description</label>
               <textarea id="some-textarea" name="description" placeholder="Enter text ...">
                   <?php //echo set_value('description');?>
               </textarea>
           </div>
       </div>
<div class="row">
<div class="input-field col s6">
<label for="title">title</label>
<input type="text" id="title" name="title" value='<?php echo set_value('title');?>'>
</div>
</div> -->
<div class="row">
<div class="col s12 m6">
<button type="submit" class="btn btn-primary waves-effect waves-light blue darken-4">Save</button>
<a href="<?php echo site_url("site/viewhealthpackages"); ?>" class="btn btn-secondary waves-effect waves-light red">Cancel</a>
</div>
</div>
</form>
</div>
