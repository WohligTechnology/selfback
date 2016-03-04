<div class="row">
<div class="col s12">
<table class="ordercard-table1"></table>
<div class="row">
<div class="drawchintantable padding">
    </div>
</div>
<?php $this->chintantable->createpagination();?>
<div class="createbuttonplacement"><a class="btn-floating btn-large waves-effect waves-light blue darken-4 tooltipped" href="<?php echo site_url("site/createorder"); ?>"data-position="top" data-delay="50" data-tooltip="Create"><i class="material-icons">add</i></a></div>
</div>
</div>
<script>
function drawtable(resultrow) {

    var orderitems = "";

    for(var i=0;i<resultrow.orderproduct.length;i++) {
        var row= resultrow.orderproduct[i];
        orderitems += "<tr class=\"repeat\"> <td>"+row.productname+" <\/td><td>"+row.price+" <\/td><td>"+row.quantity+" <\/td><td>"+row.finalprice+" <\/td><\/tr>";
    }

   var strVar="";
strVar += "<div class=\"ordercard\"> <table  class=\"ordercard-table1\"><thead> <tr> <th>Id </th> <th>Name </th> <th>Email </th> <th>Order Status</th><th>Timestamp</th><th>Action</th> </tr></thead><tr> <td> <span class=\"id\">"+resultrow.id+"<\/span> <\/td><td> <span class=\"name\">"+resultrow.firstname+" " + resultrow.lastname+"<\/span> <\/td><td> <span class=\"email\">"+resultrow.email+"<\/span> <\/td><td> <span class=\"status\">"+resultrow.orderstatusname+"<\/span> <\/td><td> <span class=\"timestamp\">"+resultrow.timestamp+"<\/span><\/td><td><a class='btn btn-primary btn-xs waves-effect waves-light blue darken-4 z-depth-0 less-pad' href='<?php echo site_url('site/editorder?id=');?>"+resultrow.id+"'><i class='fa fa-pencil propericon'></i></a><a class='btn btn-danger btn-xs waves-effect waves-light red pad10 z-depth-0 less-pad' onclick=return confirm(\"Are you sure you want to delete?\") href='<?php echo site_url('site/deleteorder?id='); ?>"+resultrow.id+"'><i class='material-icons propericon'>delete</i></a> <a target='_blank' class='btn btn-danger btn-xs waves-effect waves-light orange pad10 z-depth-0 less-pad'  href='<?php echo site_url('site/printorderinvoice?id='); ?>"+resultrow.id+"'><i class='material-icons propericon'>print</i></a><a target='_blank' class='btn btn-danger btn-xs waves-effect waves-light green pad10 z-depth-0 less-pad'  href='<?php echo site_url('site/printorderinvoiceplan?id='); ?>"+resultrow.id+"'><i class='material-icons propericon'>print</i></a></td><\/tr><\/table> <table  class=\"ordercard-table2\"> <thead> <tr> <th>Product <\/th> <th>Amount <\/th> <th>Quantity <\/th> <th>Total Amount <\/th> <\/tr><\/thead> <tbody>"+orderitems+" <\/tbody> <\/table><\/div>";


return strVar;

}
generateorder("<?php echo $base_url;?>");
</script>
