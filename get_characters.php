<?php
// Paramètres de connexion
$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "unity1"; // Base de données cible

// Créer une connexion
$conn = new mysqli($servername, $username, $password, $dbname);

// Vérifie la connexion
if ($conn->connect_error) {
    die("Échec de la connexion : " . $conn->connect_error);
} else {
    echo "Connexion à la base de données réussie.<br>";
}

// Requête SQL pour récupérer les utilisateurs
$sql = "SELECT id, username FROM users"; // Sélectionne les colonnes nécessaires
$result = $conn->query($sql);

// Vérifie si des données ont été trouvées
if ($result->num_rows > 0) {
    $users = [];

    // Parcourt les résultats
    while ($row = $result->fetch_assoc()) {
        $users[] = $row;
    }

    // Retourne les données au format JSON
    echo json_encode($users);
} else {
    echo json_encode([]); // Retourne un tableau vide si aucun utilisateur n'est trouvé
}

// Ferme la connexion
$conn->close();
?>
