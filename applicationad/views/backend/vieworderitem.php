<div class="row">
<div class="col s12">
<div class="row">
<div class="col s12 drawchintantable">
<?php $this->chintantable->createsearch(" Order Item");?>
<table class="highlight responsive-table">
<thead>
<tr>
<th data-field="id">ID</th>
<!--<th data-field="discount">Discount</th>-->
<!--<th data-field="order">Order</th>-->
<th data-field="product">Product</th>
<th data-field="quantity">Quantity</th>
<th data-field="price">Price</th>
<!--<th data-field="finalprice">Final Price</th>-->
</tr>
</thead>
<tbody>
</tbody>
</table>
</div>
</div>
<?php $this->chintantable->createpagination();?>
<div class="createbuttonplacement"><a class="btn-floating btn-large waves-effect waves-light blue darken-4 tooltipped" href="<?php echo site_url("site/createorderitem?id=").$this->input->get("id"); ?>"data-position="top" data-delay="50" data-tooltip="Create"><i class="material-icons">add</i></a></div>
</div>
</div>
<script>
function drawtable(resultrow) {
return "<tr><td>" + resultrow.id + "</td><td>" + resultrow.productname + "</td><td>" + resultrow.quantity + "</td><td>" + resultrow.price + "</td><td><a class='btn btn-primary btn-xs waves-effect waves-light blue darken-4 z-depth-0 less-pad' href='<?php echo site_url('site/editorderitem?id=');?>"+resultrow.id+"&orderid="+resultrow.order+"'><i class='fa fa-pencil propericon'></i></a><a class='btn btn-danger btn-xs waves-effect waves-light red pad10 z-depth-0 less-pad' onclick=return confirm(\"Are you sure you want to delete?\") href='<?php echo site_url('site/deleteorderitem?id='); ?>"+resultrow.id+"&orderid="+resultrow.order+"'><i class='material-icons propericon'>delete</i></a></td></tr>";
}
generatejquery("<?php echo $base_url;?>");
</script>
