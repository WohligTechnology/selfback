<!DOCTYPE html>
<html lang="en">

<head>
  <title>Print Invoice</title>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<meta name="view-port" description="width=device-width, initial-scale=1.0">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
</head>
<style>
.main {
  border: 2px solid #434343;
  font-weight: 700;
}
.table {
  border: 2px solid #434343;
  margin: 25px 0 0;
}
.table > thead > tr > th { border-bottom: 2px solid #434343; }
.invoice-detail {
  padding: 20px;
}
.back-gray {
  background-color: #EBEBEB;
}
.bottom-line {  border-bottom: 2px solid #434343; }
</style>
</head>

<body>
  <div class="container">
    <h4 class="text-uppercase text-center">Retail invoice</h4>
    <div class="main">
      <div class="invoice-detail back-gray bottom-line">
        <div class="row">
          <div class="col-xs-6">
            <div class="">
              <span>Invoice#</span>
              <span>EX000001238</span>
            </div>
            <div class="">
              <span>Invoice Date</span>
              <span><?php  echo date("d-m-Y");?></span>
            </div>
            <div class="">
              <span>Order#</span>
              <span><?php  echo $before->id;?></span>
            </div>
            <div class="">
              <span>Order Date</span>
              <span><?php  echo date("d-m-Y",strtotime($before->timestamp));?></span>
            </div>
          </div>
          <div class="col-xs-6">
            <div class="text-right">
              <div class="">
                <span>VAT TIN No.</span>
                <span>27850932475V</span>
              </div>
              <div class="">
                <span>CST TIN No.</span>
                <span>27850932475V</span>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="bottom-line">
        <div class="row">
          <div class="col-xs-6">
            <div class="invoice-detail" style="border-right: 2px solid #434343;">
              <span>BILL TO:</span>
            </div>
          </div>
          <div class="col-xs-6">
            <div class="invoice-detail">
              <span>SHIP TO:</span>
            </div>
          </div>
        </div>
      </div>
      <div class="invoice-detail">
        <div class="row">
          <div class="col-xs-6">
            <div class="">
              <div class="">
              <address>
                <?php
                    echo $before->firstname." ".$before->lastname;
                     echo "<br>";
                      echo $before->billingline1.", ".$before->billingline2.", ".$before->billingline3;
                     echo "<br>";
                      echo $before->billingcity.", ".$before->billingstate." - ".$before->billingpincode;
                      echo "<br>";
                       echo $before->billingcontact;

                 ?>
                </address>
              </div>
            </div>
          </div>
          <div class="col-xs-6">
            <div class="">
              <div class="">
              <address>
                <?php

                      echo $before->firstname." ".$before->lastname;
                     echo "<br>";
                     if(!empty($before->shippingline1)){
                       echo $before->shippingline1.", ".$before->shippingline2.", ".$before->shippingline3;
                     }else
                     {
                        echo $before->billingline1.", ".$before->billingline2.", ".$before->billingline3;
                     }

                     echo "<br>";
                     if(!empty($before->shippingcity)){
                       echo $before->shippingcity.", ".$before->shippingstate." - ".$before->shippingpincode;
                       }
                       else
                       {
                           echo $before->billingcity.", ".$before->billingstate." - ".$before->billingpincode;
                       }
                       echo "<br>";
                       if(!empty($before->shippingcontact))
                       {
                         echo $before->shippingcontact;
                       }
                       else
                       {
                         echo $before->billingcontact;
                       }
                 ?>
                </address>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>



        <div class="row">
            <div class="col-xs-12">
              <table class="table back-gray">
    <thead>
      <th>Products</th>
      <th>SKU</th>
      <th>Price</th>
      <th>Qty</th>
      <th>Tax</th>
      <th>Subtotal</th>
    </thead>
                    <tbody>
                    <?php

                        $counter=1;
                        $finalpricetotal=0;
                        foreach($table as $value)
                        {
                          $oprice = $value->price / 1.05;
                          $ovat = $value->price - $oprice;
                          $tvat = $ovat * $value->quantity;

                    ?>

                        <tr>
                            <!-- <td><?php echo $counter;?></td> -->
                            <td><?php echo $value->name;?></td>
                              <td><?php echo $value->sku;?></td>

                            <td><?php echo number_format($oprice,2);?></td>
                            <td><?php echo $value->quantity;?></td>
                            <td><?php echo number_format($tvat,2);?></td>
                            <td><?php echo number_format($value->finalprice,2);?></td>
                        </tr>
                        <?php
                            $finalpricetotal=$finalpricetotal+$value->finalprice;
                              $totalvat = $totalvat+$tvat;
                            $counter++;
                        }
                        ?>
                        <!--
			<tr>
				<td>&nbsp;</td>
				<td class="amountinwords"></td>
				<td class="totalamount amount">.00</td>
			</tr>
-->
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-8"></div>
            <div class="col-xs-4">
                <table class="table table-bordered">
                    <tr>
                        <td><b>Total:</b></td>
                        <td><?php
                        echo number_format(($finalpricetotal / 1.05),2)
                        ?></td>
                    </tr>
                    <tr>
                        <td><b>Total Vat:</b></td>
                        <td>
                            <?php
                              echo number_format($totalvat,2);
                            ?>
                        </td>
                    </tr>
                       <tr>
                        <td><b>Shipping + COD (If Applicable):</b></td>
                        <td>
                            <?php
                              echo number_format($before->shippingamount,2);
                            ?>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Final Total:</b></td>
                        <td><?php

                          echo number_format($before->finalamount,2);?></td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 text-center">Thank you for shopping with Selfcare.</div>
        </div>
    </div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- compiled and minified Bootstrap JavaScript -->
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <script>
        $(window).load(function () {
            window.print();
        });
    </script>
</body>

</html>
