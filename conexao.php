<?php
$host = "localhost";
$usuario = "eduardofinances";
$senha = "*********";
$banco = "carteira_digital";

$conn = new mysqli($host, $usuario, $senha, $banco);

if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}
?>

