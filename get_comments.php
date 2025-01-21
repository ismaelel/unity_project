<?php
header('Content-Type: application/json');


$conn = new mysqli("localhost", "root", "root", "unity1");
if ($conn->connect_error) {
    echo json_encode(["error" => "Database connection failed"]);
    exit();
}

// Requête pour récupérer les commentaires
$sql = "SELECT comment FROM comments ORDER BY id DESC";  
$result = $conn->query($sql);

$comments = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $comments[] = $row;
    }
}

// Retourner les commentaires sous forme d'objet JSON
echo json_encode(["comments" => $comments]);
$conn->close();
?>
