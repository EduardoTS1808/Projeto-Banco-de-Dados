<?php
include "conexao.php";

$sql = "SELECT titulo, valor_objetivo, valor_atual, data_limite 
        FROM meta_financeira
        ORDER BY data_limite ASC";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<table border='1'><tr><th>Título</th><th>Objetivo</th><th>Atual</th><th>Data Limite</th></tr>";
    while($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>{$row['titulo']}</td>
                <td>R$ {$row['valor_objetivo']}</td>
                <td>R$ {$row['valor_atual']}</td>
                <td>{$row['data_limite']}</td>
              </tr>";
    }
    echo "</table>";
} else {
    echo "Nenhuma meta registrada.";
}
?>
