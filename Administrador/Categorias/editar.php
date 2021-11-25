<?php  
	include 'model/conexion.php';
		$id = $_GET['id'];

		$sentencia = $bd->prepare("SELECT * FROM categoria WHERE CodigoCategoria = ?;");
		$sentencia->execute([$id]);
		$categorias1 = $sentencia->fetch(PDO::FETCH_OBJ);
		//print_r($productos1);

?>

<!DOCTYPE html>
<html>
<head>
	<title>Editar Categoria</title>
	<meta charset="utf-8">
	<link rel="stylesheet" href="CSS/tabla.css">
</head>
<body>

    <!-- HEADER DE RUTAS Y DESCARGAS -->
    <div id="header">
            
        <a class="return  header" href="">INICIO</a>
        <a class="products  header" href="index.php">CATEGORIAS</a>

    </div>
   <!-- FIN DE HEADER RUTAS Y DESCARGAS -->

	<center>
		<h3>Editar Categoria:</h3>
		<form method="POST" action="editarProceso.php">
			<table class="form__items">
				<tr>
					<td>Nombre Categoria: </td>
					<td><input type="text" name="txt2Nombre" value="<?php echo $categorias1->NombredeCategoria; ?>"></td>
				</tr>
				<tr>
					<td>Descripcion Categoria: </td>
					<td><input type="text" name="txt2Descripcion" value="<?php echo $categorias1->DescripcionCategoria; ?>"></td>
				</tr>
				<tr>
					<input type="hidden" name="oculto">
					<input type="hidden" name="id2" value="<?php echo $categorias1->CodigoCategoria; ?>">
					<td colspan="2"><input type="submit" value="Aceptar"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>