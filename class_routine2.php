<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="exam_schedule2.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Exo:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Exo:ital,wght@0,100..900;1,100..900&display=swap"
        rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {

            $('#content').load("header.php");

        });
    </script>
    <script>
        $(document).ready(function () {

            $('#content1').load("sidebar.php");

        });
    </script>

</head>

<body>

    <header>
        <div id="content"></div>
    </header>

    <main>

        <div id="content1" class="navigationbar">
        </div>

        <div class="div1">
            <div class="div2">

                <div class="tables">


                    <table>
                        <tr>
                            <th>Course Code</th>
                            <th>Course Name</th>
                            <th>Section</th>
                            <th>Start Time</th>
                            <th>End Time</th>
                            <th>Day</th>
                        </tr>

                        <?php

                        if (isset($_GET['data'])) {
                            // Deserialize the data received from the previous page
                            $serializedData = urldecode($_GET['data']);
                            $nonConflictingRoutines = unserialize($serializedData);

                            // Display the class routines in an organized way
                            foreach ($nonConflictingRoutines as $routine) {

                                ?>
                                <tr>

                                <?php ?>

                                    <td><?php  echo $routine['courseCode']; ?></td>
                                    <td><?php  echo $routine['courseName']; ?></td>
                                    <td><?php echo $routine['section']; ?></td>
                                    <td><?php echo $routine['startTime']; ?></td>
                                    <td><?php  echo $routine['endTime']; ?></td>
                                    <td><?php echo $routine['day']; ?></td>
                                </tr>

                                <?php



                                // echo $routine['courseCode'];
                                // echo $routine['courseName'];
                                // echo $routine['section'];
                                // echo $routine['startTime'];
                                // echo $routine['endTime'];
                                // echo $routine['day'];
                            }
                        }

                        ?>




                    </table>

                </div>
            </div>
        </div>



    </main>


    <script src="header.js"></script>

</body>

</html>