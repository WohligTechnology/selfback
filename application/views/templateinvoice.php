<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="">
    <title>Invoice for myFynx</title>

    <!-- Bootstrap core CSS -->
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <style>
        body {
            padding-top: 50px;
        }
        .starter-template {
            padding: 40px 15px;
            text-align: center;
        }
    </style>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-xs-2">
                <div class="logo">
                  <img src="<?php echo base_url('uploads/logo.png'); ?>">
                </div>
            </div>
            <div class="col-xs-5"></div>
            <div class="col-xs-5">
                <table class="table table-bordered">
                    <tr>
                        <td><b>Date:</b></td>
                        <td><?php  echo date("Y-m-d");?></td>
                    </tr>
                    <tr>
                        <td><b>Invoice No.:</b></td>
                        <td><?php echo $id;?></td>
                    </tr>
                </table>

            </div>
        </div>
        <div class="row">
            <div class="col-xs-5">
            <div style="border:1px solid #ccc; padding:10px;"><b>Billing Address</b>
                    <div>
                       <?php
                        if($before->billingaddress=="")
                        {
                             echo $before->firstname." ".$before->lastname;
                            echo "<br>";
                             echo $before->shippingaddress;
                            echo "<br>";
                             echo $before->shippingcity.", ".$before->shippingstate." - ".$before->shippingpincode;

                        }
                        else
                        {
                             echo $before->firstname." ".$before->lastname;
                            echo "<br>";
                             echo $before->billingaddress;
                            echo "<br>";
                             echo $before->billingcity.", ".$before->billingstate." - ".$before->billingpincode;

                        }
                        ?>
                    </div>
                </div>
            </div>

            <div class="col-xs-2"></div>

            <div class="col-xs-5">
                <div style="border:1px solid #ccc; padding:10px;"><b>Shipping Address</b>
                    <div>
                       <?php
                        if($before->shippingaddress=="")
                        {

                             echo $before->firstname." ".$before->lastname;
                            echo "<br>";
                            echo $before->billingaddress;
                            echo "<br>";
                             echo $before->billingcity.", ".$before->billingstate." - ".$before->billingpincode;
                        }
                        else
                        {
                             echo $before->firstname." ".$before->lastname;
                            echo "<br>";
                             echo $before->shippingaddress;
                            echo "<br>";
                            $before->billingcity.", ".$before->billingstate." - ".$before->billingpincode;

                        }
                        ?>
                    </div>
                </div>

            </div>
        </div>
        <br>

        <div class="row">
            <div class="col-xs-12">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Product</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Vat(5%)</th>
                            <th>Total Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                    <?php

                        $counter=1;
                        $finalpricetotal=0;
                        foreach($table as $value)
                        {
                          $ovat = $value->price * 0.05;
                          $oprice = $value->price - $ovat;

                    ?>

                        <tr>
                            <td><?php echo $counter;?></td>
                            <td><?php echo $value->name;?></td>
                            <td><?php echo $value->quantity;?></td>
                            <td><?php echo $oprice;?></td>
                            <td><?php echo $ovat;?></td>
                            <td><?php echo $value->finalprice;?></td>
                        </tr>
                        <?php
                            $finalpricetotal=$finalpricetotal+$value->finalprice;
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
                          $vat = $finalpricetotal * 0.05;
                          echo $finalpricetotal - $vat ;?></td>
                    </tr>
                    <tr>
                        <td><b>Total Vat:</b></td>
                        <td>
                            <?php
                              echo $vat;
                            ?>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Final Total:</b></td>
                        <td><?php

                          echo $finalpricetotal;?></td>
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
