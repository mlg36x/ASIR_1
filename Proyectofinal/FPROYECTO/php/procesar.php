<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$servidor = "localhost";
$usuario = $_POST['usuario'];
$contrasena = $_POST['pass'];
$base = "FLIX";

// Crear la conexión
$conn = new mysqli($servidor, $usuario, $contrasena, $base);

// Comprobar la conexión
if ($conn->connect_error) {
    die("<div class='error'>No se ha podido establecer conexión con el servidor: " . $conn->connect_error . "</div>");
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Resultados de la Consulta</title>
    <link rel="stylesheet" href="/css/procesarv2.css">
</head>
<body>
    <div class="container">
        <h1>Resultados de la Consulta</h1>
        <?php
        echo "Conexión correcta<br>";

        // Obtener la consulta del formulario
        $consulta = isset($_POST['consulta']) ? $_POST['consulta'] : '';

        // Comprobar si la consulta está vacía
        if (empty($consulta)) {
            header("Location: /usuario.php");
            exit();
        }

        // Ejecutar la consulta
        $resultado = $conn->query($consulta);

        // Comprobar si hay un error en la consulta
        if ($resultado === false) {
            die("<div class='error'>Error en la sintaxis: " . $conn->error . "</div>");
        }

        // Procesar los resultados
        if ($resultado->num_rows > 0) {
            echo "<div class='resultado'>";
            while ($fila = $resultado->fetch_assoc()) {
                echo "<pre>" . htmlspecialchars(json_encode($fila, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE)) . "</pre>";
            }
            echo "</div>";
        } else {
            echo "<div class='no-resultados'>Consulta sin resultados</div>";
        }

        // Cerrar la conexión
        $conn->close();
        ?>
    </div>
</body>
</html>
