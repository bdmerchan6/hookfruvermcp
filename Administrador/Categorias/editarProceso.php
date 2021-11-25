<?php 
	//print_r($_POST);
	if (!isset($_POST['oculto'])) {
		header('Location: index.php');
	}

	include 'model/conexion.php';
	$id2 = $_POST['id2'];
	$NombreC2 = $_POST['txt2Nombre'];
	$DescripcionC2 = $_POST['txt2Descripcion'];

	$sentencia = $bd->prepare("UPDATE categoria SET NombredeCategoria = ?, DescripcionCategoria = ? WHERE CodigoCategoria = ?;");
	$resultado = $sentencia->execute([$NombreC2,$DescripcionC2,$id2]);

	if ($resultado === TRUE) {
		header('Location: index.php');
	}else{
		echo "Error";
	}
?>