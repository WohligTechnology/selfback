<div class="row">
<div class="col s12">
<div class="row">
<div class="col s12 drawchintantable">
<?php $this->chintantable->createsearch("Careers");?>
<table class="highlight responsive-table">
<thead>
<tr>
<th data-field="id">ID</th>
<!--<th data-field="user">User</th>-->
<th data-field="name">name</th>
<th data-field="email">email</th>
<th data-field="mobile">mobile</th>
<th data-field="resume">resume</th>
</tr>
</thead>
<tbody>
</tbody>
</table>
</div>
</div>
<?php $this->chintantable->createpagination();?>
<!--<div class="createbuttonplacement"><a class="btn-floating btn-large waves-effect waves-light blue darken-4 tooltipped" href="<?php //echo site_url("site/createcart"); ?>"data-position="top" data-delay="50" data-tooltip="Create"><i class="material-icons">add</i></a></div>-->
</div>
</div>
<script>
function drawtable(resultrow) {
return "<tr><td>" + resultrow.id + "</td><td>" + resultrow.name + "</td><td>" + resultrow.email + "</td><td>" + resultrow.mobile + "</td><td><a href='<?php echo base_url('uploads').'/'; ?>"+resultrow.resume+"'>" + resultrow.resume + "</a></td><td></td><td><a class='btn btn-danger btn-xs waves-effect waves-light red pad10 z-depth-0 less-pad'  onclick=\"return confirm('Are you sure you want to delete?');\" href='<?php echo site_url('site/deletecareers?id='); ?>"+resultrow.id+"'><i class='material-icons propericon'>delete</i></a></td></tr>";
}
generatejquery("<?php echo $base_url;?>");
</script>
