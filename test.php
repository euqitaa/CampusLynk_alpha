<?php
// Check if the 'array1' and 'array2' parameters are received in the URL
if(isset($_GET['array1']) && isset($_GET['array2'])){
    // Access the 'array1' and 'array2' values and decode them from JSON
    $array1String = $_GET['array1'];
    $array2String = $_GET['array2'];
    $array1 = json_decode($array1String, true);
    $array2 = json_decode($array2String, true);


    $array1Len=count($array1);
    $array2Len=count($array2);
    
    // Echo the arrays to send them back as the response
    echo "Array 1: ";
    print_r($array1);
    echo "<br>Array 2: ";
    print_r($array2);

    echo "<br>";
    echo $array1Len;
    echo "<br>";
    echo $array2Len;
} else {
    // Handle case where 'array1' or 'array2' parameters are not received
    echo "No arrays received";
}
?>

