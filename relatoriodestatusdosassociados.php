<?php
include 'conexao.php';

$sql = "SELECT a.id, a.nome, 
        (SELECT COUNT(*) FROM pagamentos p WHERE p.associado_id = a.id AND p.status = 'pendente') AS anuidades_pendentes 
        FROM associados a";
$result = $mysqli->query($sql);

echo "<h2>Status dos Associados</h2><ul>";
while ($row = $result->fetch_assoc()) {
    $status = $row['anuidades_pendentes'] > 0 ? 'Em atraso' : 'Em dia';
    echo "<li>{$row['nome']}: $status</li>";
}
echo "</ul>";
?>