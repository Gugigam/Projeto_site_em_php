<?php
include 'conexao.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $ano = $_POST['ano'];
    $valor = $_POST['valor'];

    $sql = "INSERT INTO anuidades (ano, valor) VALUES (?, ?)";
    $stmt = $mysqli->prepare($sql);
    $stmt->bind_param("sd", $ano, $valor);

    if ($stmt->execute()) {
        echo "Anuidade cadastrada com sucesso!";
    } else {
        echo "Erro: " . $stmt->error;
    }

    $stmt->close();
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastrar Anuidade</title>
</head>
<body>
    <form method="POST" action="">
        <input type="number" name="ano" placeholder="Ano" required><br>
        <input type="text" name="valor" placeholder="Valor" required><br>
        <button type="submit">Cadastrar</button>
    </form>
</body>
</html>