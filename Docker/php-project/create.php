<?php include 'db.php'; ?>

<h2>Create Contact</h2>
<form action="create.php" method="POST">
    <label>Name:</label>
    <input type="text" name="name" required><br>
    
    <label>Email:</label>
    <input type="email" name="email" required><br>
    
    <label>Phone:</label>
    <input type="text" name="phone"><br>
    
    <input type="submit" name="submit" value="Create Contact">
</form>

<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];

    $sql = "INSERT INTO contacts (name, email, phone) VALUES (?, ?, ?)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$name, $email, $phone]);

    echo "<p>Contact created successfully!</p>";
}
?>

