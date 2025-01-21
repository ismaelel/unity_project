<?php
// Connexion à la base de données
$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "unity1";

$conn = new mysqli($servername, $username, $password, $dbname);

// Vérifier la connexion
if ($conn->connect_error) {
    die("Échec de la connexion : " . $conn->connect_error);
}

// Récupération des données
$user_id = $_POST['user_id'];
$current_time = date("Y-m-d H:i:s"); 

// Génération de valeurs aléatoires
$random_score = rand(0, 10000);      
$random_level = rand(1, 50);       
$random_time_played = rand(0, 7200);

// Requête SQL pour insérer une nouvelle partie
$sql = "INSERT INTO game_stats (user_id, game_date, score, level, time_played) 
        VALUES ('$user_id', '$current_time', '$random_score', '$random_level', '$random_time_played')";

if ($conn->query($sql) === TRUE) {
    echo "success"; 
} else {
    echo "error: " . $conn->error; 
}

$conn->close();
?>
