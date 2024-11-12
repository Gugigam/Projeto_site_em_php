 <?php
include 'conexao.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nome = $_POST['nome'];
    $email = $_POST['email'];
    $cpf = $_POST['cpf'];
    $data_filiacao = $_POST['data_filiacao'];

    $sql = "INSERT INTO associados (nome, email, cpf, data_filiacao) VALUES (?, ?, ?, ?)";
    $stmt = $mysqli->prepare($sql);
    $stmt->bind_param("ssss", $nome, $email, $cpf, $data_filiacao);

    if ($stmt->execute()) {
        echo "Associado cadastrado com sucesso!";
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
    <title>Cadastrar Associado</title>
</head>
<body>
    <form method="POST" action="">
        <input type="text" name="nome" placeholder="Nome" required><br>
        <input type="email" name="email" placeholder="Email" required><br>
        <input type="text" name="cpf" placeholder="CPF" required><br>
        <input type="date" name="data_filiacao" placeholder="Data de Filiação" required><br>
        <button type="submit">Cadastrar</button>
    </form>
</body>
</html>