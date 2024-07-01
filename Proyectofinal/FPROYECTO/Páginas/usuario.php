<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="/css/usuario.css">
  <style>
    /* Estilos para el menú desplegable */
    .dropdown {
      position: relative;
      display: inline-block;
    }

    .dropdown-content {
      display: none;
      position: absolute;
      background-color: #f9f9f9;
      min-width: 160px;
      box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
      z-index: 1;
    }

    .dropdown-content a {
      color: black;
      padding: 12px 16px;
      text-decoration: none;
      display: block;
    }

    .dropdown-content a:hover {
      background-color: #f1f1f1;
    }

    .dropdown:hover .dropdown-content {
      display: block;
    }
  </style>
  <title>Página de Inicio</title>
</head>

<body>
  <div id="izquierda">
    <header>
      <h1>
        Bienvenido
<?php echo $_POST['usuario']?>
      </h1>
    </header>
    <img src="/logo2.png" alt="Logo de la empresa" width="200" />
    <p>ESQUEMA DE LA BASE DE DATOS</p>
    <div class="dropdown">
      <button class="dropbtn">Selecciona una tabla</button>
      <div class="dropdown-content">
        <a href="#" onclick="mostrarCampos('actores')">actores</a>
        <a href="#" onclick="mostrarCampos('directores')">directores</a>
        <a href="#" onclick="mostrarCampos('series')">series</a>
        <a href="#" onclick="mostrarCampos('serie_categ')">serie_categ</a>
        <a href="#" onclick="mostrarCampos('peliculas')">peliculas</a>
        <a href="#" onclick="mostrarCampos('peli_categ')">peli_categ</a>
        <a href="#" onclick="mostrarCampos('categorias')">categorias</a>
        <a href="#" onclick="mostrarCampos('paises')">paises</a>
        <a href="#" onclick="mostrarCampos('actor_peli')">actor_peli</a>
        <a href="#" onclick="mostrarCampos('actor_serie')">actor_serie</a>
        <a href="#" onclick="mostrarCampos('direc_peli')">direc_peli</a>
        <a href="#" onclick="mostrarCampos('direc_serie')">direc_serie</a>
      </div>
    </div>

    <div id="campos">
    
    </div>
  </div>
  <div id="derecha">
  <h2>Escribe aqui tu consulta sobre la base de datos</h2>
    <form action="/php/procesar.php" method="post">
      <input type="text" id="consulta" name="consulta">
      <input type="hidden" id="pass" name="pass" value="<?php echo $_POST['pass']?>">
      <input type="hidden" id="usuario" name="usuario" value="<?php echo $_POST['usuario']?>">
      <input type="submit" value="Enviar consulta">
    </form>
  </div>

  <script>
    // Función para mostrar los campos de la tabla seleccionada
    function mostrarCampos(tabla) {
      // Objeto que contiene los campos de cada tabla
      var campos = {
        'actores': ['ID_ACTOR', 'AC_NOMBRE', 'AC_APELLIDO1', 'AC_APELLIDO2', 'AC_PAIS'],
        'directores':['ID_DIREC','DI_NOMBRE','DI_APELLIDO1','DI_APELLIDO2','DI_PAIS'],
        'series':['ID_SERIE','S_TITULO','S_PRESUPUESTO','S_ESTRENO','S_TEMP','S_PAIS'],
        'serie_categ':['ID_SERIE','ID_CATEG'],
        'peliculas':['ID_PELI','P_TITULO','P_PRESUPUESTO','P_ESTRENO','P_SECUELA','P_PAIS'],
        'peli_categ':['ID_PELI','ID_CATEG'],
        'categorias':['ID_CATEG','CATEG'],
        'paises':['ID_PAIS','PAIS'],
        'actor_peli':['ID_PELI','ID_ACTOR'],
        'actor_serie':['ID_SERIE','ID_ACTOR'],
        'direc_peli':['ID_PELI','ID_DIREC'],
        'direc_serie':['ID_SERIE','ID_DIREC']
      };

      // Obtener la referencia al div donde se mostrarán los campos
      var camposDiv = document.getElementById('campos');

      // Limpiar el contenido actual de camposDiv
      camposDiv.innerHTML = '';

      // Obtener los campos de la tabla seleccionada
      var camposTabla = campos[tabla];

      // Mostrar los campos en camposDiv
      for (var i = 0; i < camposTabla.length; i++) {
        var campo = document.createElement('p');
        campo.textContent = camposTabla[i];
        camposDiv.appendChild(campo);
      }
    }
  </script>

</body>

</html>