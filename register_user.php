<?php

$host = 'localhost';
$db = 'unity1';
$user = 'root';
$password = 'root';
$conn = new mysqli($host, $user, $password, $db);

if ($conn->connect_error) {
    die("Erreur de connexion: " . $conn->connect_error);
}


$username = $_POST['username'];
$hashedPassword = $_POST['password'];

// On vérifie si l'utilisateur existe déjà
$sqlCheck = "SELECT id FROM users WHERE username = ?";
$stmtCheck = $conn->prepare($sqlCheck);
$stmtCheck->bind_param("s", $username);
$stmtCheck->execute();
$stmtCheck->store_result();

if ($stmtCheck->num_rows > 0) {
    echo "Nom d'utilisateur déjà pris.";
    exit;
}

// Ajouter le nouvel utilisateur
$sqlInsert = "INSERT INTO users (username, password) VALUES (?, ?)";
$stmtInsert = $conn->prepare($sqlInsert);
$stmtInsert->bind_param("ss", $username, $hashedPassword);

if ($stmtInsert->execute()) {
    echo "Inscription réussie.";
} else {
    echo "Erreur lors de l'inscription.";
}

$conn->close();
?>
