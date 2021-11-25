<?php 
	//print_r($_POST);
	if (!isset($_POST['oculto'])) {
		header('Location: index.php');
	}

	include '../model/conexion.php';
	$id2 = $_POST['id2'];
    $nombre2=$_POST['Nombres2'];
    $apellido2=$_POST['Apellidos2'];
    $telefon2=$_POST['Telefono2'];
    $email2=$_POST['CorreoElectronico2'];
    $contrasena2=md5($_POST['Contrasena2']);

	$sentencia = $bd->prepare("UPDATE persona SET Nombres = ?, Apellidos = ?, Telefono = ?, 
												CorreoElectronico = ?, Contrasena = ? WHERE NumerodeDocumento  = ?;");
	$resultado = $sentencia->execute([$nombre2,$apellido2,$telefon2,$email2,$contrasena2, $id2]);

	if ($resultado === TRUE) {
        header('Location: ../index.php');

	}else{
		echo "Error";
	}
?>