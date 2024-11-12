<?php
include 'conexao.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $associado_id = $_POST['associado_id'];
    $anuidade_id = $_POST['anuidade_id'];

    $sql = "UPDATE pagamentos SET status = 'pago', data_pagamento = NOW() WHERE associado_id = ? AND anuidade_id = ?";
    $stmt = $mysqli->prepare($sql);
    $stmt->bind_param("ii", $associado_id, $anuidade_id);

    if ($stmt->execute()) {
        echo "Pagamento registrado com sucesso!";
    } else {
        echo "Erro: " . $stmt->error;
    }

    $stmt->close();
}
?>