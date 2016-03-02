<div class="row">
<div class="col s12">
<div class="row">
<div class="col s12 drawchintantable">
<?php $this->chintantable->createsearch("Useraddress");?>
<table class="highlight responsive-table">
<thead>
<tr>
<th data-field="id">ID</th>
<th data-field="user">User</th>
<th data-field="name">Name</th>
<th data-field="billingcity">Billing City</th>
<th data-field="billingstate">Billing State</th>
<th data-field="billingcountry">Billing Country</th>
<th data-field="shippingcity">Shipping City</th>
<th data-field="shippingstate">Shipping State</th>
<th data-field="shippingcountry">Shipping Country</th>
<th data-field="shippingpincode">Shipping Pincode</th>
<th data-field="billingaddress">Billing Address</th>
<th data-field="shippingaddress">Shipping Address</th>
</tr>
</thead>
<tbody>
</tbody>
</table>
</div>
</div>
<?php $this->chintantable->createpagination();?>
<div class="createbuttonplacement"><a class="btn-floating btn-large waves-effect waves-light blue darken-4 tooltipped" href="<?php echo site_url("site/createuseraddress"); ?>"data-position="top" data-delay="50" data-tooltip="Create"><i class="material-icons">add</i></a></div>
</div>
</div>
<script>
function drawtable(resultrow) {
return "<tr><td>" + resultrow.id + "</td><td>" + resultrow.user + "</td><td>" + resultrow.name + "</td><td>" + resultrow.billingcity + "</td><td>" + resultrow.billingstate + "</td><td>" + resultrow.billingcountry + "</td><td>" + resultrow.shippingcity + "</td><td>" + resultrow.shippingstate + "</td><td>" + resultrow.shippingcountry + "</td><td>" + resultrow.shippingpincode + "</td><td>" + resultrow.billingaddress + "</td><td>" + resultrow.shippingaddress + "</td><td><a class='btn btn-primary btn-xs waves-effect waves-light blue darken-4 z-depth-0 less-pad' href='<?php echo site_url('site/edituseraddress?id=');?>"+resultrow.id+"'><i class='fa fa-pencil propericon'></i></a><a class='btn btn-danger btn-xs waves-effect waves-light red pad10 z-depth-0 less-pad' onclick=return confirm(\"Are you sure you want to delete?\") href='<?php echo site_url('site/deleteuseraddress?id='); ?>"+resultrow.id+"'><i class='material-icons propericon'>delete</i></a></td></tr>";
}
generatejquery("<?php echo $base_url;?>");
</script>
