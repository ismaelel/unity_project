<?php
header('Content-Type: application/json');


$conn = new mysqli("localhost", "root", "root", "unity1");
if ($conn->connect_error) {
    echo json_encode(["error" => "Database connection failed"]);
    exit();
}

if (isset($_POST['comment'])) {
    $comment = $_POST['comment'];  

    // Préparer la requête SQL pour insérer le commentaire dans la base de données
    $stmt = $conn->prepare("INSERT INTO comments (comment) VALUES (?)");  
    $stmt->bind_param("s", $comment);

    if ($stmt->execute()) {
        echo json_encode(["success" => true, "message" => "Commentaire ajouté avec succès !"]);
    } else {
        echo json_encode(["success" => false, "message" => "Erreur lors de l'ajout du commentaire"]);
    }

    $stmt->close();
} else {
    echo json_encode(["success" => false, "message" => "Le commentaire est requis"]);
}

$conn->close();
?>
