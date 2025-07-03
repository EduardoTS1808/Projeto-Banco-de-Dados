<?php
include "conexao.php";

$tabela = $_POST['tabela'];

switch ($tabela) {
    case 'usuario':
        $stmt = $conn->prepare("INSERT INTO usuario (nome, senha) VALUES (?, ?)");
        $stmt->bind_param("ss", $_POST['nome'],$_POST['senha']);
        break;

    case 'conta':
        $stmt = $conn->prepare("INSERT INTO conta (nome, tipo, saldo_inicial, db_usuario) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("ssdi", $_POST['nome'], $_POST['tipo'], $_POST['saldo_inicial'], $_POST['db_usuario']);
        break;

    case 'categoria':
        $stmt = $conn->prepare("INSERT INTO categoria (nome, tipo) VALUES (?, ?)");
        $stmt->bind_param("ss", $_POST['nome'], $_POST['tipo']);
        break;

    case 'transacao':
        $stmt = $conn->prepare("INSERT INTO transacao (valor, data_transacao, descricao, tipo, db_conta, db_categoria) VALUES (?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("dsssss", $_POST['valor'], $_POST['data_transacao'], $_POST['descricao'], $_POST['tipo'], $_POST['db_conta'], $_POST['db_categoria']);
        break;

    case 'meta_financeira':
        $stmt = $conn->prepare("INSERT INTO meta_financeira (titulo, valor_objetivo, valor_atual, data_limite, db_usuario) VALUES (?, ?, ?, ?, ?)");
        $stmt->bind_param("sddsi", $_POST['titulo'], $_POST['valor_objetivo'], $_POST['valor_atual'], $_POST['data_limite'], $_POST['db_usuario']);
        break;

    default:
        die("Tabela inválida");
}

if ($stmt->execute()) {
    echo "Registro inserido com sucesso!";
} else {
    echo "Erro: " . $stmt->error;
}

$conn->close();
?>
