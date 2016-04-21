<html>
<?php
if($before->paymentmode == 1)
{
  $paymentmode = "Credit Card";
}
elseif($before->paymentmode == 2)
{
  $paymentmode = "Debit Card";
}
elseif($before->paymentmode == 3)
{
  $paymentmode = "Net Banking";
}
elseif($before->paymentmode == 4)
{
  $paymentmode = "Cash On Delivery";
}
?>
<body>
  <section style="background:#dfdfdf; width: 600px; margin:0 auto;">
    <div>
      <div style="padding:25px;background:#f0f0f0;">
        <img src='http://selfcareindia.com/img/logo.png' alt='Selfcare' style="width:165px;">
      </div>
      <div style="padding:10px 20px;background:#e96542; color:#fff;font-size:24px;">
        New Program Subscription!
      </div>
      <div style="padding:20px;">
        <p style="font-weight:600; margin:10px 0px;"> Dear <?php echo $username; ?>,
        </p>
        <p style="margin:0 0 10px 0;">
           Greetings from SelfCare!</p>
         <p style="margin:0 0 10px 0;">
           Thank you for subscribing to the program. Our nutritionist will get in touch with you within 2 working days.
         </p>
         <p style="margin:0 0 10px 0;">We look forward to helping you reach your health and weight loss goals!</p>
         <div style="background:#fff; padding:20px;margin-bottom:20px;">
           <p style="font-size:26px; color:#e96542;margin:0px 0 10px 0;text-decoration:underline">
             Order Summary
           </p>
          <p style="margin:10px 0;">
            <span style="font-weight:600">Order ID:</span> <?php echo $id; ?>
          </p>
          <p style="margin:10px 0;">
            <span style="font-weight:600">Date:</span> <?php echo $orderdate; ?>
          </p>
          <p style="margin:10px 0;">
            <span style="font-weight:600">Mode of payment:</span> <?php echo $paymentmode; ?>
          </p>
          <table width="100%" style="border-collapse: collapse;">
            <thead>
              <tr>
                <th style="padding: 8px;border: 1px solid #c2a488;text-transform: uppercase;">ITEMS</th>
                <th style="padding: 8px;border: 1px solid #c2a488;text-transform: uppercase;">AMOUNT</th>
                <th style="padding: 8px;border: 1px solid #c2a488;text-transform: uppercase;">QUANTITY</th>
                <th style="padding: 8px;border: 1px solid #c2a488;text-transform: uppercase;">SUB TOTAL</th>
              </tr>
            </thead>
            <tbody>
              <?php
if($before->defaultcurrency == "USD")
{
  $currency = "$";
}
else
{
  $currency = "Rs.";
}

$finalpricetotal=0;
foreach($planquery as $value)
{
$plan = $value->plan;
if ($plan == 1) {
$plan = 'Silver Plan';
}
if ($plan == 2) {
$plan = 'Gold Plan';
}
if ($plan == 3) {
$plan = 'Platinum Plan';
}
if ($plan == 4) {
$plan = 'Diamond Plan';
}
if($value->months == 1)
{
$months = $value->months." Month";
}
else
{
$months = $value->months." Months";
}

$name = $months." ".$plan;
$oprice = $value->price;
// $oprice = $value->price / 1.145;
// $ovat = $value->price - $oprice;
// $sku =$value->sku;
$qty =$value->quantity;
$price = number_format($oprice,2);
$vat =number_format($ovat,2);
$total = number_format($value->finalprice,2);

              ?>

              <tr>
                <td style="text-align:center;font-weight:600;padding: 7px;text-transform: uppercase;">
                <span><?php echo $name; ?></span>
                </td>
                <td style="text-align:center;font-weight:600;padding: 7px;text-transform: uppercase;"><?php echo $currency." ".$price; ?></td>
                <td style="text-align:center;font-weight:600;padding: 7px;text-transform: uppercase;"><?php echo $qty; ?></td>
                <td style="text-align:center;font-weight:600;padding: 7px;text-transform: uppercase;"> <?php echo $currency." ".$total; ?></td>
              </tr>
            </tbody>
            <?php
            $finalpricetotal2=$finalpricetotal2+$value->finalprice;
            //$totalvat2 = $totalvat2+$ovat;

          }

          $totalamount= number_format($finalpricetotal2,2);
          $shippingamount= number_format($before->shippingamount,2);
          $famt = $totalamount + $shippingamount;
          $finalamount= number_format($famt,2);
          ?>
            <tfoot>
              <tr style="background:#c2a488;">
                <td style="font-weight: 600;padding: 7px 7px 7px 50px;text-transform: uppercase;" COLSPAN=3>TOTAL AMOUNT</td>
                <td style="text-align:center;font-weight:600;padding: 7px;text-transform: uppercase;"> <?php echo $currency." ".$totalamount; ?></td>
              </tr>
            </tfoot>
          </table>
        </div>




        <div style="background:#fff; padding:20px;">
          <p style="font-size:24px; color:#e96542;margin:0px 0 10px 0;text-decoration:underline">
            Billing Address
          </p>
          <p style="margin:10px 0;">
            <span style="font-weight:600"><?php echo $username;?></span>
          </p>
          <p style="margin:10px 0;">
            <?php echo $before->billingline1;?>,
            <br><?php echo $before->billingline2; ?>,
            <br> <?php echo $before->billingline3 ;?>,
            <br> <?php echo $before->billingcity." ".$before->billingpincode ;?>.
          </p>
          <p style="margin:10px 0;">
            <span style="font-weight:600">Mobile: <?php echo $before->billingcontact; ?></span>
          </p>

        </div>
        <p>In case you have any queries regarding your order, please call us on <a href='tel:+912261312222' style="color:#000;text-decoration:none" target='_blank'>+ 91 22 6131 2222</a> or leave us a mail on <a href='mailto:care@selfcareindia.com' style='color:#e96542;text-decoration:none'
            target='_blank'>care@selfcareindia.com</a></p>

        <p>Thank You,
          <br> Team SelfCare!</p>
      </div>
    </div>
    <footer style="background:#e96542;padding:10px 0 ">
      <table>
        <tbody>
          <tr>
            <td style='padding:0 15px'>
              <div>
                <a style='color:#fff;font-size:12px;text-decoration:none' href="http://selfcareindia.com/#/home" target="_blank">&copy; Selfcare2016</a>
              </div>
            </td>
            <td style='padding:0 2px'>
              <div>
                <span style='color:#fff;font-size:12px'>Contact us @<a href='tel:+912261312222' style='color:#fff;font-family:Roboto;font-size:12px;margin:0px 5px;text-decoration:none' target='_blank'>+ 91 22 6131 2222</a></span>
                <a href='mailto:care@selfcareindia.com' style='color:#fff;font-family:Roboto;font-size:14px;margin:0px 10px;text-decoration:none' target='_blank'>care@selfcareindia.com</a>
              </div>
            </td>
            <td style='padding:0 15px;vertical-align:middle' valign='middle'>
              <div>
                <a href='https://www.facebook.com/selfcarebysuman' style='color:#fff;display:inline-block;font-family:Roboto;font-size:18px;margin:3px 5px 0 0' target='_blank'>
                  <img src='http://selfcareindia.com/img/selfcare-facebook.png' alt='Facebook' width='15'></a>
                <a href='https://twitter.com/selfcarebysuman' style='color:#fff;display:inline-block;font-family:Roboto;font-size:18px;margin:3px 5px 0 0' target='_blank'>
                  <img src='http://selfcareindia.com/img/selfcare-twitter.png' alt='Twitter' width='15'></a>
                <a href='https://www.instagram.com/selfcarebysuman' style='color:#fff;display:inline-block;font-family:Roboto;font-size:18px;margin:3px 5px 0 0' target='_blank'>
                  <img src='http://selfcareindia.com/img/selfcare-insta.png' alt='Instagram' width='15'></a>
                <a href='https://www.youtube.com/channel/UCVqKgmC6eaMrgPyXoOcOz2A' style='color:#fff;display:inline-block;font-family:Roboto;font-size:18px;margin:3px 5px 0 0' target='_blank'>
                  <img src='http://selfcareindia.com/img/selfcare-youtube.png' alt='Youtube' width='15'></a>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
      </div>
      </div>
    </footer>
  </section>
</body>

</html>
