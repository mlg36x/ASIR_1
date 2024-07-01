<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página de Inicio</title>
    <link rel="stylesheet" href="/css/inicio.css">
</head>

<body>
    <header>
        <h1 class="marquee">Tu página sobre consultas sobre películas y series</h1>
    </header>
    <div>
        <main>
            <img src="/logo2.png">
            <p>Iniciar sesión</p>
            <form action="/usuario.php" method="post">
                <input type="text" id="usuario" name="usuario" placeholder="Usuario"><br><br>
                <input type="password" id="pass" name="pass" placeholder="Contraseña"><br><br>
                <input style="margin-top: 5px; margin-bottom: 10px;" id="boton" type="submit" value="Enviar">
            </form>
        </main>
    </div>
</body>
</html>
