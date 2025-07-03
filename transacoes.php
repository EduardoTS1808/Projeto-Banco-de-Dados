<?php
include "conexao.php";
//////////////////////////////////////////////////


$sql = "SELECT  nome 
        FROM usuario";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<table border='1'><tr><th>Usuário</th></tr>";
    while($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>{$row['nome']}</td>
              </tr>";
    }
    echo "</table>";
} else {
    echo "Nenhuma meta registrada.";
}


/////////////////////////////////////////////////

$sql = "SELECT t.id_transacao, t.valor, t.data_transacao, t.descricao, t.tipo, c.nome AS conta, cat.nome AS categoria 
        FROM transacao t
        JOIN conta c ON t.db_conta = c.id_conta
        JOIN categoria cat ON t.db_categoria = cat.id_categoria
        ORDER BY t.data_transacao DESC LIMIT 10";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<table border='1'><tr><th>Data</th><th>Descrição</th><th>Valor</th><th>Tipo</th><th>Conta</th><th>Categoria</th></tr>";
    while($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>{$row['data_transacao']}</td>
                <td>{$row['descricao']}</td>
                <td>R$ {$row['valor']}</td>
                <td>{$row['tipo']}</td>
                <td>{$row['conta']}</td>
                <td>{$row['categoria']}</td>
              </tr>";
    }
    echo "</table>";
} else {
    echo "Nenhuma transação encontrada.";
}
?>
