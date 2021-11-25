<?php  

		include 'model/conexion.php';
		$sentencia = $bd->query("SELECT * FROM categoria;");
		$categorias = $sentencia->fetchAll(PDO::FETCH_OBJ);
		//print_r($productos);
	

	
?>

<!DOCTYPE html>
<html lang="es">
<head>
	<title>LISTA DE CATEGORIAS</title>
	<meta charset="utf-8">
	<link rel="stylesheet" href="CSS/tabla.css">
</head>
<body>

    <!-- HEADER DE RUTAS Y DESCARGAS -->
    <div id="header">
            
        <a class="return  header" href="">inicio</a>

    </div>
   <!-- FIN DE HEADER RUTAS Y DESCARGAS -->

	<center>
		<div class="div__firmts">
		<h3>LISTA DE CATEGORIAS</h3>
		<table class="table__1">
			<tbody>
			<tr class="td__tittle">
				<td>Codigo Categoria</td>
				<td>Nombre Categoria</td>
				<td>Descripcion Categoria</td>
                <td>Editar</td>
				<td>Eliminar</td>
			</tr>
			</tbody>
			<?php 
				foreach ($categorias as $dato) {
					?>
					<tr class="content">
						<td><?php echo $dato->CodigoCategoria; ?></td>
						<td><?php echo $dato->NombredeCategoria; ?></td>
						<td><?php echo $dato->DescripcionCategoria; ?></td>
						<td><a class="editar" href="editar.php?id=<?php echo $dato->CodigoCategoria; ?>">Editar</a></td>
						<td><a class="eliminar" href="eliminar.php?id=<?php echo $dato->CodigoCategoria; ?>">Eliminar</a></td>
					</tr>
					<?php
				}
			?>
			
		</table>
		</div>
		<!-- inicio insert -->
		<hr>
		<h3>Ingresar Categoria:</h3>
		<form class="form" method="POST" action="insertar.php">
			<table class="form__items">
				<tr>
					<td>Nombre Categoria: </td>
					<td><input type="text" name="txtNombre"></td>
				</tr>
				<tr>
					<td>Descripcion Categoria: </td>
					<td><input type="text" name="txtDescripcion"></td>
				</tr>
				<input type="hidden" name="oculto" value="1">
				<tr>
					<td><input type="reset" name=""></td>
					<td><input type="submit" value="Registrar"></td>
				</tr>
			</table>
		</form>
		<!-- fin insert-->

