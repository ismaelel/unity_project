<?php
// Paramètres de connexion à la base de données
$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "unity1";

// Connexion à la base de données
$conn = new mysqli($servername, $username, $password, $dbname);

// Vérifie la connexion
if ($conn->connect_error) {
    die("Échec de la connexion : " . $conn->connect_error);
}


$user_id = $_POST['user_id'];

// Requête SQL pour récupérer les statistiques du joueur
$sql = "SELECT * FROM game_stats WHERE user_id = $user_id ORDER BY id DESC";
$result = $conn->query($sql);

// Vérifie si des statistiques existent pour cet utilisateur
if ($result->num_rows > 0) {
    $stats = [];
    while ($row = $result->fetch_assoc()) {
        $stats[] = $row;  // Ajoute chaque ligne de stats dans un tableau
    }
    
    echo json_encode($stats);
} else {
    echo "No stats found for this user.";
}

$conn->close();
?>
 