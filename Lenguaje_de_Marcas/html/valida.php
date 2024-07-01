<?php
$campo_texto = $campo_contraseña = "";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $campo_texto = test_input($_POST["campo_texto"]);
    $campo_contraseña = test_input($_POST["campo_contraseña"])
}

function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
echo $campo_texto
echo $campo_contraseña
?>