<?php 
$approveStatus= $_GET['status'];

try {
    $conn = new PDO("mysql:host=localhost:3306;dbname=student_companion;", "root", "");
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $count = 0;
    $projectquery = "UPDATE timeslot SET facultyApproval= '$approveStatus'";
    $returnobj = $conn->exec($projectquery);

  
} catch (PDOException $ex) {

}

?>
<script>
    location.assign("faculty_dashboard.php");
</script>
<?php

?>


