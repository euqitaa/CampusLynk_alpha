<?php
session_start();
if(isset($_SESSION['useremail']) && !empty($_SESSION['useremail'])) {
    unset($_SESSION['useremail']);
    session_destroy();
    ?>
    <script>location.assign("index.php")</script>
    <?php
}
else{
    ?>
    <script>location.assign("login.php")</script>
    <?php
}
?>