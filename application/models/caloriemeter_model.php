<?php
if ( !defined( "BASEPATH" ) )
exit( "No direct script access allowed" );
class caloriemeter_model extends CI_Model
{
  public function createbycsv($file)
	{
    // print_r($file);
      foreach ($file as $row)
        {
            $category=$row['CATAGORIES'];
            $product=$row['FOOD PRODUCT'];
            $measurements=$row['H.H. MEASUREMENTS'];
            $please_enter=$row['please enter'];
            $enter_here=$row['Enter here'];
            $serving=$row['serving size'];
            $calorie=$row['Kcal'];
            $protein=$row['PROTEIN gs.'];
            $fat=$row['FAT  gs.'];
            $carbs=$row['carbs'];
            $fibre=$row['FIBRE gs.'];
            $calcium=$row['CALCIUMmg'];
            $iron=$row['IRON mg.'];



		$data  = array(
            "category" => $category,
            "product" => $product,
            "measurements" => $measurements,
            "please_enter" => $please_enter,
            "enter_here" => $enter_here,
            "serving" => $serving,
            "calorie" => $calorie,
            "protein" => $protein,
            "fat" => $fat,
            "carbs" => $carbs,
            "fibre" => $fibre,
            "calcium" => $calcium,
            "iron" => $iron,

		);
    // print_r($data);
		$query=$this->db->insert( 'caloriemeter', $data );

	}
  return  1;
}
}
?>
