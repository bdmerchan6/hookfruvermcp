<?php  
	if (!isset($_POST['oculto'])) {
		exit();
	}

	include 'model/conexion.php';

	$NombreC = $_POST['txtNombre'];
	$DescripcionC = $_POST['txtDescripcion'];
	

	$sentencia = $bd->prepare("INSERT INTO categoria(NombredeCategoria,DescripcionCategoria) VALUES (?,?);");
	$resultado = $sentencia->execute([$NombreC,$DescripcionC]);

	if ($resultado === TRUE) {
		//echo "Insertado correctamente";
		header('Location: index.php');
	}else{
		echo "Error";
	}
?>