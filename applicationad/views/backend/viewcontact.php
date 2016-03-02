<div class="row">
<div class="col s12">
<div class="row">
<div class="col s12 drawchintantable">
<?php $this->chintantable->createsearch(" Contacts");?>
<table class="highlight responsive-table">
<thead>
<tr>
<th data-field="id">ID</th>

<!--
<th data-field="noofdesigns">No of Designs</th>
<th data-field="designerid">Designer Id</th>
-->
<!--<th data-field="name">Name</th>-->
<th data-field="firstname">First Name</th>
<th data-field="lastname">Last Name</th>
<th data-field="email">Email Id</th>
<th data-field="telephone">Contact</th>
<th data-field="comment">Comment</th>
</tr>
</thead>
<tbody>
</tbody>
</table>
</div>
</div>
<?php $this->chintantable->createpagination();?>

</div>
</div>
<script>
function drawtable(resultrow) {
return "<tr><td>" + resultrow.id + "</td><td>" + resultrow.firstname + "</td><td>" + resultrow.lastname + "</td><td>" + resultrow.email + "</td><td>" + resultrow.telephone + "</td><td>" + resultrow.comment + "</td><td></td></tr>";
}
generatejquery("<?php echo $base_url;?>");
</script>
