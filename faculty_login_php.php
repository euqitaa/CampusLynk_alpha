<?php
if($_SERVER['REQUEST_METHOD'] == "POST") {
    if(isset($_POST['myemail']) && isset($_POST['mypass'])) {

        $email = $_POST['myemail'];

        $pass = $_POST['mypass'];
        try {
            $conn = new PDO("mysql:host=localhost:3306;dbname=student_companion;", "root", "");
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            $encd_pass = md5($pass);

            $loginquery = "SELECT * FROM faculty WHERE email='$email' AND password='$encd_pass'";
            $returnobj = $conn->query($loginquery);
            
            if($returnobj->rowCount() == 1) {
                session_start();
                $_SESSION['useremail'] = $email;

                ?>
                <script>location.assign("faculty_dashboard.php");</script>
                <?php
            } else {
                ?>
                <script>location.assign("faculty_login.php")</script>
                <?php
            }


        } catch (PDOException $ex) {
            ?>
            <script>location.assign("faculty_login.php")</script>
            <?php
        }
    } else {
        ?>
        <script>location.assign("faculty_login.php")</script>
        <?php
    }

} else {
    ?>
    <script>location.assign("login.php")</script>
    <?php
}
?>