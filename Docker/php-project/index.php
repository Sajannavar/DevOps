<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>PHP Multi-Tab Project</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <h1>Contact Management System</h1>
    <div class="tabs">
        <a href="index.php?page=create">Create Contact</a>
        <a href="index.php?page=read">View Contacts</a>
    </div>

    <div class="content">
        <?php
        // Include the correct page based on the selected tab
        if (isset($_GET['page'])) {
            $page = $_GET['page'];
            if ($page == "create") {
                include('create.php');
            } elseif ($page == "read") {
                include('read.php');
            }
        } else {
            echo "<p>Welcome to the Contact Management System!</p>";
        }
        ?>
    </div>
</body>
</html>

