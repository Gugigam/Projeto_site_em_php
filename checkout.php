<?php
include 'conexao.php';

if (isset($_GET['associado_id'])) {
    $associado_id = $_GET['associado_id'];

    // Pegar a data de filiação do associado
    $sql = "SELECT data_filiacao FROM associados WHERE id = ?";
    $stmt = $mysqli->prepare($sql);
    $stmt->bind_param("i", $associado_id);
    $stmt->execute();
    $stmt->bind_result($data_filiacao);
    $stmt->fetch();
    $stmt->close();

    $ano_filiacao = date('Y', strtotime($data_filiacao));

    // Pegar todas as anuidades devidas desde o ano de filiação
    $sql = "SELECT ano, valor FROM anuidades WHERE ano >= ?";
    $stmt = $mysqli->prepare($sql);
    $stmt->bind_param("i", $ano_filiacao);
    $stmt->execute();
    $stmt->bind_result($ano, $valor);

    $total_devido = 0;
    echo "<h2>Anuidades devidas</h2><ul>";
    while ($stmt->fetch()) {
        echo "<li>Ano: $ano - Valor: R$ $valor</li>";
        //if($status == 'pago'){
            $total_devido += $valor;
        //}
    }
    echo "</ul><h3>Total Devido: R$ $total_devido</h3>";

    $stmt->close();
} else {
    echo "Associado não especificado.";
}
?>