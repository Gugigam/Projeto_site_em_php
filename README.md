# Projeto_site_em_php
esse projeto visa a criação de um sistema em que seja possivel acessar um banco de dados e fazer as seguintes funçoes:
- Cadastro de associados, com: Nome, E-mail, CPF e Data de filiação.
- Cadastro de anuidades, com: Ano e Valor.
    - Cada ano, o valor da anuidade pode ser diferente. Ex: 2022 = R$100,00 / 2023 = R$110,00 / 2024 = R$ 150,00. 
    - Esse valor deve ser facilmente ajustado pelo gerente.
- Cobrança das anuidades do associado.
    - "Checkout" das anuidades devidas pelo associado, calculando valor devido por anuidade e valor total devido.
    - Considere a Data de filiação para saber quais anuidades são devidas pelo associado.
- "Pagamento" da anuidade de um associado. 
    - Para este teste o pagamento será simplesmente uma flag no banco de dados, indicando se a anuidade foi paga ou não.
    - Cada anuidade poderá ser paga individualmente. Ex: O associado João deve 3 anuidades e quer quitar apenas uma, essa ação deve ser permitida.
- O software também deve ser capaz de identificar quais são os associados com pagamento em dia e quais estão em atraso.
    - Para isso considere todo novo associado devedor da anuidade corrente.

Dito isso a sequencia correta para a execução local do software é a seguinte:

1° tenha instalado o WAMP ou outros meios semelhantes a função; no meu caso eu baixei a versao 3.3.5, precisei incluir o visualc++ 2015 e 2013.
2° tendo instalado e configurado o WAMP para o navegador e seu ambiente de programação (no meu caso chrome e visualSudioCode); abra o navegador e entre no site "http://localhost/"
3° abra seu arquivo WAMP e crie uma pasta, ela aparecerá nos seus projetos; dessa forma crie arquivos .php e coloque em cada um deles o conteudo do "cadastrodeanuidade"; "cadastrodeassociado"; "checkout"; "conexao"; "index"; "pagamentodaanuidade"; "relatoriodestatusdosassociados". Se atente à caso modifique os nomes, modifique tambem o nome chamado durante os codigos.
4° abra o PhpMyAdmin 5.2.1 que aparece no site "http://localhost/" e importe o banco de dados que está presente em "meu_database.sql".
caso prefira, é possivel criar o banco de dados seguindo as instruçoes seguintes, caso o importe dito previamente ja tenha sido feito, pule para o 5° ponto.
sequencia a ser colocada no sql:
 -> "Create DATABASE projeto_php;"
 
 -> "CREATE TABLE associados (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT null,
  email VARCHAR(255) NOT NULL,
  cpf VARCHAR(14) NOT NULL UNIQUE,
  data_filiacao DATE NOT NULL
);

CREATE TABLE anuidades (
  id INT AUTO_INCREMENT PRIMARY KEY,
  ano YEAR NOT NULL,
  valor DECIMAL(10, 2) NOT NULL
);

CREATE TABLE pagamentos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  associado_id INT NOT NULL,
  anuidade_id INT NOT NULL,
  status ENUM('pago', 'pendente') DEFAULT 'pendente',
  data_pagamento DATE,
  FOREIGN KEY (associado_id) REFERENCES associados(id),
  FOREIGN KEY (anuidade_id) REFERENCES anuidades(id)
);

-- Inserindo anuidades
INSERT INTO anuidades (id, ano, valor) VALUES 
(1, 2016, 40.00),
(2, 2017, 50.00),
(3, 2018, 70.00),
(4, 2019, 90.00),
(5, 2020, 100.00),
(6, 2021, 120.00),
(7, 2022, 140.00),
(8, 2023, 150.00),
(9, 2024, 200.00),
(10, 2025, 250.00);

-- Inserindo associados 

INSERT INTO associados (id, nome, email, cpf, data_filiacao) VALUES 

(1, 'Paulo', 'PauloCezar@gmail.com', '111111111-11', '2024-10-30'), 
(2, 'Enzio', 'EnzioDanilo@gmail.com', '123456780-00', '2018-12-12'), 
(3, 'Rosado', 'Tiagoago@gmail.com', '987654320-99', '2023-12-30'), 
(4, 'Danillo', 'DanilloSilva@gmail.com', '987654320-09', '2022-5-5'), 
(5, 'Claudio', 'ClaudioLira@gmail.com', '123456780-88', '2021-4-19'), 
(6, 'Landim', 'LandimGustavo0@gmail.com', '839275431-00', '2019-2-11'), 
(7, 'Gustavo', 'GustavoQuezado@gmail.com', '449494949-49', '2016-11-11'),
(8, 'Giovanna', 'GiovannaLouise@gmail.com', '100100100-01', '2017-9-4');

-- Inserindo pagamentos

INSERT INTO pagamentos (anuidade_id, associado_id, data_pagamento, id, status) VALUES 

(9, 1, '2024-04-02', 1, 'pago'),
(10, 1, '2025-02-02', 2, 'pago'),
(3, 2, '2018-02-01', 3, 'pago'),
(4, 2, '2019-09-01', 4, 'pago'),
(5, 2, '2021-01-01', 5, 'pago'),
(6, 2, '2021-12-01', 6, 'pago'),
(7, 2, '0001-01-01', 7, 'pendente'),
(8, 2, '0001-01-01', 8, 'pendente'),
(9, 2, '0001-01-01', 9, 'pendente'),
(10, 2, '0001-01-01', 10, 'pendente'),
(8, 3, '2023-04-01',11, 'pago'),
(9, 3, '2024-02-01', 12, 'pago'),
(10, 3, '2025-02-01', 13, 'pago'),
(7, 4, '2022-01-01', 14, 'pago'),
(8, 4, '0001-01-01', 15, 'pendente'),
(9, 4, '0001-01-01', 16, 'pendente'),
(10, 4, '0001-01-01', 17, 'pendente'),
(6, 5, '2021-01-03', 18, 'pago'),
(7, 5, '2022-01-12', 19, 'pago'),
(8, 5, '2023-04-03', 20, 'pago'),
(9, 5, '2024-02-23', 21, 'pago'),
(10, 5, '2025-01-07', 22, 'pago'),
(4, 6, '2019-06-01', 23, 'pago'),
(5, 6, '2020-01-03', 24, 'pago'),
(6, 6, '2021-12-13', 25, 'pago'),
(7, 6, '2022-08-02', 26, 'pago'),
(8, 6, '0001-01-01', 27, 'pendente'),
(9, 6, '0001-01-01', 28, 'pendente'),
(10, 6, '0001-01-01', 29, 'pendente'),
(1, 7, '2016-01-01', 30, 'pago'),
(2, 7, '2017-02-01', 31, 'pago'),
(3, 7, '2018-02-15', 32, 'pago'),
(4, 7, '2019-02-25', 33, 'pago'),
(5, 7, '2020-01-30', 34, 'pago'),
(6, 7, '2021-01-14', 35, 'pago'),
(7, 7, '2022-2-26', 36, 'pago'),
(8, 7, '2023-10-06', 37, 'pago'),
(9, 7, '2024-01-11', 38, 'pago'),
(10, 7, '2025-02-15', 39, 'pago'),
(2, 8, '2017-01-01', 40, 'pago'),
(3, 8, '2018-01-01', 41, 'pago'),
(4, 8, '2019-01-01', 42, 'pago'),
(5, 8, '2020-01-01', 43, 'pago'),
(6, 8, '2021-01-01', 44, 'pago'),
(7, 8, '2022-01-01', 45, 'pago'),
(8, 8, '2023-01-01', 46, 'pago'),
(9, 8, '2024-01-01', 47, 'pago'),
(10, 8, '2025-01-01', 48, 'pago');"

5° tendo o banco de dados alimentado, ja é possivel retirar informaçoes SEM novos cadastros, mas eles poderiam ser implementados desde o inicio caso fosse o desejo do gerente em questão. dessa forma, seguem comandos que podem ser usados (substitua "name" pelo nome da sua pasta que foi selecionada como projeto, no caso a pasta dita no "3°"):

cadastrar associado:
"http://localhost/name/cadastrodeassociado.php"
cadastrar anuidade:
"http://localhost/name/cadastrodeanuidade.php"
cadastrar pagamento de anuidade
"http://localhost/name/pagamentodaanuidade.php"
conferir a funcionalidade da conexão
"http://localhost/name/index.php"
checkout do associado x
"http://localhost/name/checkout?associado_id=x" (substitua x pelo indice do associado a ser analizado)
relatorio de todos os associados(quanto a completabilidade dos pagamentos)
"http://localhost/name/relatoriodestatusdosassociados.php"

foi isso que consegui estudando php em 3 dias, o prazo era maior mas so pude começar os estudos de php, sql, wamp, criação de site e demais topicos nos ultimos 3 dias. acredito que esse projeto ainda será finalizado em proximos dias, mas ja é um começo para aqueles que quiserem começar a estudar tambem.
