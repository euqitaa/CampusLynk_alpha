<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Class Routine</title>

    <link rel="stylesheet" href="class_routine_php.css">

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
                    <?php
                    try {
                        $conn = new PDO("mysql:host=localhost;dbname=student_companion", "root", "");
                        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

                        if (isset($_GET['array'])) {
                            $arrayString = $_GET['array'];
                            $decodedArrayString = urldecode($arrayString);
                            $courseCode = explode(",", $decodedArrayString);
                            $searchScheduleQuery = "SELECT * FROM classroutine WHERE courseCode IN ('" . implode("','", $courseCode) . "')";
                            $returnobj = $conn->query($searchScheduleQuery);
                            $tableObject = $returnobj->fetchAll();

                            // Generate a list of unique courses
                            $courses = [];
                            foreach ($tableObject as $routine) {
                                $courses[$routine['courseCode']][] = $routine;
                            }

                            // Generate combinations of routines with different sections for each course
                            function generateCombinations($courses, $current = [], &$combinations = [], $index = 0)
                            {
                                if ($index == count($courses)) {
                                    $combinations[] = $current;
                                    return;
                                }

                                $courseCode = array_keys($courses)[$index];
                                foreach ($courses[$courseCode] as $routine) {
                                    $current[] = $routine;
                                    generateCombinations($courses, $current, $combinations, $index + 1);
                                    array_pop($current);
                                }
                            }

                            $combinations = [];
                            generateCombinations($courses, [], $combinations);

                            // Display all possible combinations of class routines
                            foreach ($combinations as $key => $combination) {
                                ?>
                                <div class="routine-heading-div">
                                    <h2>Routine <?php echo $key + 1; ?></h2>
                                </div>

                                <table>
                                    <tr>
                                        <th>Course Code</th>
                                        <th>Course Name</th>
                                        <th>Section</th>
                                        <th>Start Time</th>
                                        <th>End Time</th>
                                        <th>Day</th>
                                    </tr>
                                    <?php foreach ($combination as $routine): ?>
                                        <tr>
                                            <td><?php echo $routine['courseCode']; ?></td>
                                            <td><?php echo $routine['courseName']; ?></td>
                                            <td><?php echo $routine['section']; ?></td>
                                            <td><?php echo $routine['startTime']; ?></td>
                                            <td><?php echo $routine['endTime']; ?></td>
                                            <td><?php echo $routine['day']; ?></td>
                                        </tr>
                                    <?php endforeach; ?>
                                </table>
                                <?php
                            }
                        } else {
                            echo "<p>Course code parameter is missing.</p>";
                        }
                    } catch (PDOException $e) {
                        echo "<p>Connection failed: " . $e->getMessage() . "</p>";
                    }
                    ?>
                </div>
            </div>
        </div>

    </main>

    <!-- JavaScript and additional scripts -->
</body>

</html>