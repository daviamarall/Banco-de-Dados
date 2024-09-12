## **Objetivo** ## 

Este documento cobre os principais conceitos para se trabalhar com SQL Server e Oracle PL/SQL, fornecendo uma base sólida para a manipulação de dados e administração do banco de dados.

## **SQL Server** ##

### **1. Introdução ao SQL Server e T-SQL**

#### **Descrição:**
O SQL Server é um sistema de gerenciamento de banco de dados relacional desenvolvido pela Microsoft. T-SQL (Transact-SQL) é a extensão da linguagem SQL usada no SQL Server, que inclui funções adicionais para controle de fluxo, variáveis e muito mais.

#### **Exemplo: Consulta Básica em T-SQL**
```sql
SELECT * FROM Clientes;
```

### 2. Criação de Tabelas e Tipos de Dados**

#### **Descrição:**
No SQL Server, as tabelas armazenam dados em linhas e colunas. Cada coluna tem um tipo de dado, como `INT`, `VARCHAR`, `DATE`, entre outros.

#### **Exemplo: Criando uma Tabela**
```sql
CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Preco DECIMAL(10, 2),
    DataCadastro DATE
);
```
### 3. Inserção, Atualização e Exclusão de Dados**

#### **Descrição:**
No SQL Server, você pode inserir, atualizar e excluir dados usando os comandos `INSERT`, `UPDATE` e `DELETE`.

#### **Exemplo: Inserindo Dados**
```sql
INSERT INTO Produtos (ProdutoID, Nome, Preco, DataCadastro)
VALUES (1, 'Notebook', 3500.00, '2023-01-15');
```

#### **Exemplo: Atualizando Dados**
```sql
UPDATE Produtos
SET Preco = 3200.00
WHERE ProdutoID = 1;
```

#### **Exemplo: Excluindo Dados**
```sql
DELETE FROM Produtos
WHERE ProdutoID = 1;
```

### **4. Consultas Avançadas**

#### **Descrição:**
As consultas em T-SQL podem incluir cláusulas como `WHERE`, `JOIN`, `GROUP BY`, `ORDER BY`, entre outras, para obter resultados mais específicos e realizar junções entre tabelas.

A cláusula **`WHERE`** é utilizada para filtrar os registros retornados por uma consulta SQL. Ela define uma condição que os dados devem atender para serem incluídos no resultado final da consulta. Apenas as linhas que correspondem aos critérios especificados na cláusula **`WHERE`** serão retornadas.

### 1. **Sintaxe da Cláusula `WHERE`**:
```sql
SELECT coluna1, coluna2, ...
FROM tabela
WHERE condição;
```

### 2. **Exemplo Básico de `WHERE`**:
A consulta abaixo seleciona todos os produtos cujo preço é maior que 1000:
```sql
SELECT Nome, Preco
FROM Produtos
WHERE Preco > 1000;
```
- **Explicação**: Esta consulta retorna apenas os produtos cujo preço seja superior a 1000.

### 3. **Operadores Comuns Usados com `WHERE`**:
A cláusula **`WHERE`** pode ser combinada com vários operadores e funções, como:

#### **3.1. Operadores de Comparação**:
   - **`=`**: Igual a
   - **`!=` ou `<>`**: Diferente de
   - **`>`**: Maior que
   - **`<`**: Menor que
   - **`>=`**: Maior ou igual a
   - **`<=`**: Menor ou igual a

   **Exemplo**:
   ```sql
   SELECT Nome, Preco
   FROM Produtos
   WHERE Preco >= 500;
   ```
   Retorna os produtos com preço igual ou superior a 500.

#### **3.2. Operadores Lógicos**:
   - **`AND`**: Combina múltiplas condições. Todas as condições devem ser verdadeiras.
   - **`OR`**: Combina múltiplas condições. Pelo menos uma condição deve ser verdadeira.
   - **`NOT`**: Inverte o resultado de uma condição.

   **Exemplo com `AND`**:
   ```sql
   SELECT Nome, Preco
   FROM Produtos
   WHERE Preco > 500 AND Categoria = 'Eletrônicos';
   ```
   Retorna produtos da categoria **Eletrônicos** com preço superior a 500.

   **Exemplo com `OR`**:
   ```sql
   SELECT Nome, Preco
   FROM Produtos
   WHERE Categoria = 'Eletrônicos' OR Categoria = 'Móveis';
   ```
   Retorna produtos das categorias **Eletrônicos** ou **Móveis**.

#### **3.3. Operador `IN`**:
   - **Descrição**: Verifica se o valor de uma coluna corresponde a qualquer valor de uma lista de valores especificados.
   
   **Exemplo**:
   ```sql
   SELECT Nome, Preco
   FROM Produtos
   WHERE Categoria IN ('Eletrônicos', 'Móveis');
   ```
   Retorna produtos que pertencem às categorias **Eletrônicos** ou **Móveis**.

#### **3.4. Operador `BETWEEN`**:
   - **Descrição**: Seleciona valores dentro de um intervalo especificado, incluindo os limites.

   **Exemplo**:
   ```sql
   SELECT Nome, Preco
   FROM Produtos
   WHERE Preco BETWEEN 500 AND 1000;
   ```
   Retorna produtos cujo preço esteja entre 500 e 1000.

#### **3.5. Operador `LIKE`**:
   - **Descrição**: Utilizado para realizar comparações com padrões de string. Comumente usado com curingas:
     - **`%`**: Substitui zero ou mais caracteres.
     - **`_`**: Substitui exatamente um caractere.

   **Exemplo**:
   ```sql
   SELECT Nome
   FROM Produtos
   WHERE Nome LIKE 'S%';
   ```
   Retorna produtos cujo nome começa com a letra "S".

#### **3.6. Operador `IS NULL`**:
   - **Descrição**: Verifica se o valor de uma coluna é `NULL`.

   **Exemplo**:
   ```sql
   SELECT Nome
   FROM Produtos
   WHERE Descricao IS NULL;
   ```
   Retorna produtos que não têm descrição (`NULL`).

### 4. **Combinação de Condições**
Você pode combinar vários operadores em uma cláusula **`WHERE`** para criar condições mais complexas.

**Exemplo Complexo**:
```sql
SELECT Nome, Preco, Categoria
FROM Produtos
WHERE (Preco > 500 AND Categoria = 'Eletrônicos') OR (Preco > 1000 AND Categoria = 'Móveis');
```
- **Explicação**: Esta consulta retorna produtos da categoria **Eletrônicos** com preço superior a 500, ou produtos da categoria **Móveis** com preço superior a 1000.

### 5. **Uso de `WHERE` com Funções Agregadas**
Ao usar funções agregadas como **`SUM()`**, **`COUNT()`**, **`AVG()`**, **`MAX()`**, **`MIN()`**, a cláusula **`WHERE`** filtra linhas antes de a função ser aplicada.

**Exemplo**:
```sql
SELECT COUNT(*)
FROM Produtos
WHERE Preco > 1000;
```
- **Explicação**: Conta o número de produtos cujo preço é maior que 1000.

### 6. **Diferença entre `WHERE` e `HAVING`**:
- **`WHERE`**: Filtra linhas **antes** de a agregação ser feita (em consultas com ou sem agregação).
- **`HAVING`**: Filtra grupos de dados **depois** da agregação (usado após `GROUP BY`).

**Exemplo**:
```sql
SELECT Categoria, COUNT(*)
FROM Produtos
GROUP BY Categoria
HAVING COUNT(*) > 10;
```
- **Explicação**: A cláusula **`HAVING`** filtra os grupos de categorias que têm mais de 10 produtos.


Aqui está a explicação detalhada sobre as cláusulas **`GROUP BY`** e **`ORDER BY`**, complementando o uso de consultas avançadas em SQL:

### 1. **GROUP BY**
   - **Descrição**: A cláusula **`GROUP BY`** é usada para agrupar linhas que compartilham um valor em comum em uma ou mais colunas. Geralmente, é usada em conjunto com funções agregadas, como **`SUM()`**, **`COUNT()`**, **`AVG()`**, **`MAX()`** e **`MIN()`**, para realizar cálculos em cada grupo de dados.
   - **Sintaxe**:
     ```sql
     SELECT Coluna1, Coluna2, SUM(Coluna3) AS Total
     FROM Tabela
     GROUP BY Coluna1, Coluna2;
     ```

   - **Exemplo**: Suponha que você queira calcular o total de vendas por cada cliente. Você usaria a seguinte consulta:
     ```sql
     SELECT ClienteID, SUM(ValorPedido) AS TotalVendas
     FROM Pedidos
     GROUP BY ClienteID;
     ```

   - **Explicação**: A consulta agrupa os pedidos por **ClienteID** e calcula a soma dos valores dos pedidos para cada cliente. O resultado exibe o total de vendas para cada cliente.

   - **Observação**: Todas as colunas na cláusula `SELECT` que não fazem parte de uma função agregada devem aparecer na cláusula `GROUP BY`.

### 2. **ORDER BY**
   - **Descrição**: A cláusula **`ORDER BY`** é usada para ordenar os resultados de uma consulta com base em uma ou mais colunas. Por padrão, os resultados são ordenados em ordem crescente, mas você pode especificar explicitamente a ordem crescente ou decrescente.
   - **Sintaxe**:
     ```sql
     SELECT Coluna1, Coluna2
     FROM Tabela
     ORDER BY Coluna1 [ASC|DESC];
     ```

   - **Exemplo 1**: Ordenar produtos por preço de forma crescente (padrão):
     ```sql
     SELECT Nome, Preco
     FROM Produtos
     ORDER BY Preco;
     ```

   - **Exemplo 2**: Ordenar produtos por preço de forma decrescente:
     ```sql
     SELECT Nome, Preco
     FROM Produtos
     ORDER BY Preco DESC;
     ```

   - **Explicação**: No primeiro exemplo, os produtos são ordenados pelo preço em ordem crescente, enquanto no segundo exemplo, eles são exibidos em ordem decrescente.

   - **Ordenação Múltipla**: Você pode ordenar por mais de uma coluna:
     ```sql
     SELECT Nome, Categoria, Preco
     FROM Produtos
     ORDER BY Categoria ASC, Preco DESC;
     ```
     Neste exemplo, a lista de produtos será ordenada primeiro pela categoria (em ordem crescente) e, dentro de cada categoria, pelos preços (em ordem decrescente).

### Diferença entre `GROUP BY` e `ORDER BY`:
- **`GROUP BY`** agrupa os resultados com base em uma ou mais colunas, frequentemente usado com funções agregadas (soma, contagem, etc.).
- **`ORDER BY`** apenas ordena o resultado, sem alterar a quantidade de linhas retornadas ou fazer cálculos.

### Exemplo Combinado: `GROUP BY` com `ORDER BY`
Você pode combinar **`GROUP BY`** e **`ORDER BY`** em uma mesma consulta. Por exemplo, para obter o total de vendas por cliente e ordenar pelo maior total de vendas:
```sql
SELECT ClienteID, SUM(ValorPedido) AS TotalVendas
FROM Pedidos
GROUP BY ClienteID
ORDER BY TotalVendas DESC;
```

Neste caso, o **`GROUP BY`** agrupa as vendas por cliente, e o **`ORDER BY`** ordena os resultados em ordem decrescente de vendas.

Em SQL, os **JOINs** são usados para combinar registros de duas ou mais tabelas com base em uma condição relacionada. Existem diferentes tipos de JOINs, cada um com comportamentos distintos ao combinar os dados. Aqui estão os principais tipos de JOINs em SQL:

### 1. **INNER JOIN**
   - **Descrição**: Retorna apenas as linhas que têm correspondências nas duas tabelas. Se não houver correspondência, a linha é excluída do resultado.
   - **Sintaxe**:
     ```sql
     SELECT C.Nome, P.Nome AS Produto, P.Preco
     FROM Clientes C
     INNER JOIN Pedidos Ped ON C.ClienteID = Ped.ClienteID
     INNER JOIN Produtos P ON Ped.ProdutoID = P.ProdutoID;
     ```

   - **Explicação**: Esse exemplo combina dados de **Clientes**, **Pedidos**, e **Produtos**, mas só retorna os registros em que há uma correspondência nas três tabelas.

### 2. **LEFT JOIN (ou LEFT OUTER JOIN)**
   - **Descrição**: Retorna todas as linhas da tabela à esquerda (primeira tabela) e as linhas correspondentes da tabela à direita. Se não houver correspondência na tabela à direita, serão retornados `NULLs` nos campos da tabela da direita.
   - **Sintaxe**:
     ```sql
     SELECT C.Nome, P.Nome AS Produto, P.Preco
     FROM Clientes C
     LEFT JOIN Pedidos Ped ON C.ClienteID = Ped.ClienteID
     LEFT JOIN Produtos P ON Ped.ProdutoID = P.ProdutoID;
     ```

   - **Explicação**: Retorna todos os clientes, mesmo que eles não tenham feito pedidos. Se não houver pedido ou produto associado a um cliente, o SQL preenche as colunas de **Pedidos** e **Produtos** com valores `NULL`.

### 3. **RIGHT JOIN (ou RIGHT OUTER JOIN)**
   - **Descrição**: O comportamento é o oposto do **LEFT JOIN**. Retorna todas as linhas da tabela à direita (segunda tabela) e as linhas correspondentes da tabela à esquerda. Se não houver correspondência na tabela à esquerda, serão retornados `NULLs` nos campos da tabela da esquerda.
   - **Sintaxe**:
     ```sql
     SELECT C.Nome, P.Nome AS Produto, P.Preco
     FROM Clientes C
     RIGHT JOIN Pedidos Ped ON C.ClienteID = Ped.ClienteID
     RIGHT JOIN Produtos P ON Ped.ProdutoID = P.ProdutoID;
     ```

   - **Explicação**: Isso retornaria todos os produtos, mesmo que não estejam associados a nenhum pedido ou cliente. Se um produto não tiver sido encomendado, os campos da tabela **Clientes** e **Pedidos** serão preenchidos com `NULL`.

### 4. **FULL JOIN (ou FULL OUTER JOIN)**
   - **Descrição**: Retorna todas as linhas quando há uma correspondência em qualquer uma das tabelas. Se não houver correspondência em ambas as tabelas, as colunas da tabela correspondente que não tiver valores serão preenchidas com `NULL`.
   - **Sintaxe**:
     ```sql
     SELECT C.Nome, P.Nome AS Produto, P.Preco
     FROM Clientes C
     FULL JOIN Pedidos Ped ON C.ClienteID = Ped.ClienteID
     FULL JOIN Produtos P ON Ped.ProdutoID = P.ProdutoID;
     ```

   - **Explicação**: Isso retorna todos os clientes, todos os pedidos e todos os produtos, independentemente de haver ou não correspondências entre eles. Se não houver correspondência, os valores `NULL` serão usados para preencher as colunas ausentes.

### 5. **CROSS JOIN**
   - **Descrição**: Combina cada linha de uma tabela com todas as linhas de outra tabela, resultando em um produto cartesiano (todas as combinações possíveis). Não exige uma condição `ON`.
   - **Sintaxe**:
     ```sql
     SELECT C.Nome, P.Nome AS Produto
     FROM Clientes C
     CROSS JOIN Produtos P;
     ```

   - **Explicação**: Isso retorna todas as combinações possíveis de **Clientes** e **Produtos**. Por exemplo, se houver 5 clientes e 10 produtos, o resultado será 50 linhas (5 x 10).

### 6. **SELF JOIN**
   - **Descrição**: Um **SELF JOIN** é usado para combinar uma tabela consigo mesma. Ele é essencialmente um **INNER JOIN** ou **OUTER JOIN**, mas com a mesma tabela aparecendo em ambos os lados.
   - **Sintaxe**:
     ```sql
     SELECT E1.Nome AS Funcionario, E2.Nome AS Gerente
     FROM Funcionarios E1
     LEFT JOIN Funcionarios E2 ON E1.GerenteID = E2.FuncionarioID;
     ```

   - **Explicação**: Aqui, a tabela **Funcionarios** é associada a si mesma para identificar funcionários e seus respectivos gerentes.

### Resumo:
| Tipo de Join    | Descrição |
|-----------------|-----------|
| **INNER JOIN**  | Retorna apenas as linhas que têm correspondência em ambas as tabelas. |
| **LEFT JOIN**   | Retorna todas as linhas da tabela à esquerda, e as correspondentes da tabela à direita. Caso não haja correspondência, preenche com `NULL`. |
| **RIGHT JOIN**  | Retorna todas as linhas da tabela à direita, e as correspondentes da tabela à esquerda. Caso não haja correspondência, preenche com `NULL`. |
| **FULL JOIN**   | Retorna todas as linhas de ambas as tabelas, com `NULL` para as colunas não correspondentes. |
| **CROSS JOIN**  | Retorna o produto cartesiano de duas tabelas (todas as combinações possíveis). |
| **SELF JOIN**   | Combina uma tabela consigo mesma. |

Esses diferentes tipos de JOINs são essenciais para obter dados relacionados de várias tabelas de forma eficiente e flexível.


### **5. Funções de Agregação**

#### **Descrição:**
As funções de agregação, como `SUM`, `AVG`, `COUNT`, `MAX` e `MIN`, são usadas para realizar cálculos em conjunto de dados.

#### **Exemplo: Usando Funções de Agregação**
```sql
SELECT AVG(Preco) AS PrecoMedio, MAX(Preco) AS PrecoMaximo, MIN(Preco) AS PrecoMinimo
FROM Produtos;
```

### **6. Subconsultas**

#### **Descrição:**
Subconsultas são consultas aninhadas dentro de outra consulta. Elas podem ser usadas para fornecer valores ou realizar filtros mais complexos.

#### **Exemplo: Subconsulta em Cláusula WHERE**
```sql
SELECT Nome, Preco
FROM Produtos
WHERE Preco > (SELECT AVG(Preco) FROM Produtos);
```

### **7. Índices**

#### **Descrição:**
Índices são usados para melhorar a performance das consultas ao acelerar a recuperação dos dados. O SQL Server oferece índices `Clustered` e `Non-Clustered`.

#### **Exemplo: Criando um Índice**
```sql

-- Cria um índice chamado idx_produtos_preco na tabela Produtos, baseado na coluna Preco

CREATE INDEX idx_produtos_preco
ON Produtos (Preco);

CREATE INDEX idx_produtos_preco
ON Produtos (Preco);
```


### **8. Views**

#### **Descrição:**
Views são consultas salvas no banco de dados como objetos reutilizáveis. Elas podem ser usadas para simplificar o acesso a dados complexos ou para restringir o acesso a determinadas colunas.

#### **Exemplo: Criando uma View**
```sql
CREATE VIEW vw_produtos_caro
AS
SELECT Nome, Preco
FROM Produtos
WHERE Preco > 1000;
```

#### **Exemplo: Consultando uma View**
```sql
SELECT * FROM vw_produtos_caro;
```



### **Módulo 9: Funções Definidas pelo Usuário**

#### **Descrição:**
Funções definidas pelo usuário podem ser criadas para encapsular lógica de negócios ou cálculos que serão reutilizados nas consultas.

#### **Exemplo: Criando uma Função**
```sql
CREATE FUNCTION fn_calcular_desconto(@preco DECIMAL(10, 2), @desconto DECIMAL(5, 2))
RETURNS DECIMAL(10, 2)
AS
BEGIN
    RETURN @preco - (@preco * @desconto / 100);
END;
```

#### **Exemplo: Usando a Função**
```sql
SELECT Nome, dbo.fn_calcular_desconto(Preco, 10) AS PrecoComDesconto
FROM Produtos;
```



### **10. Procedures (Procedures Armazenadas)**

#### **Descrição:**
Procedures armazenadas são blocos de código SQL que podem ser reutilizados para realizar tarefas repetitivas. Elas permitem a passagem de parâmetros de entrada e saída.

#### **Exemplo: Criando uma Procedure**
```sql
CREATE PROCEDURE sp_atualizar_preco
    @produtoID INT,
    @novoPreco DECIMAL(10, 2)
AS
BEGIN
    UPDATE Produtos
    SET Preco = @novoPreco
    WHERE ProdutoID = @produtoID;
END;
```

#### **Exemplo: Executando uma Procedure**
```sql
EXEC sp_atualizar_preco @produtoID = 1, @novoPreco = 3000.00;
```



### **11. Triggers**

#### **Descrição:**
Triggers são blocos de código que são automaticamente executados em resposta a eventos, como `INSERT`, `UPDATE` ou `DELETE`, em uma tabela.

#### **Exemplo: Criando um Trigger para Auditoria**
```sql
CREATE TRIGGER trg_auditoria_produtos
ON Produtos
AFTER INSERT, UPDATE
AS
BEGIN
    INSERT INTO AuditoriaProdutos (ProdutoID, DataOperacao)
    SELECT ProdutoID, GETDATE()
    FROM inserted;
END;
```



### **12. Transações**

#### **Descrição:**
As transações garantem que um conjunto de operações SQL sejam executadas com sucesso ou, em caso de falha, todas sejam revertidas. Elas garantem consistência e integridade dos dados.

#### **Exemplo: Usando Transações**
```sql
BEGIN TRANSACTION;

UPDATE Produtos
SET Preco = Preco - 100
WHERE ProdutoID = 2;

IF @@ERROR <> 0
    ROLLBACK TRANSACTION;
ELSE
    COMMIT TRANSACTION;
```


### **13. Controle de Erros**

#### **Descrição:**
No SQL Server, é possível capturar e lidar com erros usando `TRY...CATCH`. Isso permite tratar falhas e garantir a integridade dos dados.

#### **Exemplo: Tratamento de Erros com TRY...CATCH**
```sql
BEGIN TRY
    UPDATE Produtos
    SET Preco = Preco / 0 -- Causa um erro
    WHERE ProdutoID = 1;
END TRY
BEGIN CATCH
    PRINT 'Ocorreu um erro: ' + ERROR_MESSAGE();
END CATCH;
```

### **14. Otimização de Consultas**

#### **Descrição:**
A otimização de consultas é fundamental para garantir a eficiência do banco de dados. Técnicas como o uso adequado de índices, views, e análise de planos de execução ajudam a melhorar a performance.

#### **Exemplo: Exibindo o Plano de Execução**
```sql
SET SHOWPLAN_ALL ON;
GO
SELECT * FROM Produtos WHERE Preco > 500;
GO
SET SHOWPLAN_ALL OFF;
```

---

## **Oracle PL/SQL**

### **1: Introdução ao PL/SQL**

#### **Descrição:**
PL/SQL (Procedural Language/SQL) é a extensão procedural da linguagem SQL, usada em bancos de dados Oracle. Ele permite combinar comandos SQL com lógica de programação, como loops e condicionais, para criar blocos de código reutilizáveis.

#### **Exemplo: Bloco PL/SQL Simples**
```sql
DECLARE
    v_nome VARCHAR2(50);
BEGIN
    v_nome := 'Maria';
    DBMS_OUTPUT.PUT_LINE('Olá, ' || v_nome);
END;
```

1. **DECLARE** Esta seção é usada para declarar variáveis ou tipos de dados que serão usados no bloco PL/SQL. No seu exemplo, `v_nome` é declarado como uma variável do tipo `VARCHAR2(50)`.

2. **BEGIN** Aqui começa o bloco real de código PL/SQL. É onde a lógica principal do seu código é colocada.

3. **v_nome := 'Maria';**  Atribui o valor 'Maria' à variável `v_nome`.

4. **DBMS_OUTPUT.PUT_LINE('Olá, ' || v_nome);**  Esta linha imprime na saída padrão (normalmente usada em ambientes como o SQL*Plus ou SQL Developer) a mensagem 'Olá, ' seguida pelo valor da variável `v_nome`.

5. **END;** Finaliza o bloco PL/SQL.




### **2: Variáveis e Tipos de Dados**

#### **Descrição:**
Em PL/SQL, as variáveis são usadas para armazenar dados temporários. Elas devem ser declaradas na seção de declaração do bloco PL/SQL e podem ser de vários tipos: numéricos, caracteres, datas, entre outros.

#### **Exemplo: Declaração de Variáveis**
```sql
DECLARE
    v_idade NUMBER := 25;
    v_nome VARCHAR2(100) := 'João';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Nome: ' || v_nome || ', Idade: ' || v_idade);
END;
```


### **3: Estruturas de Controle**

#### **Descrição:**
PL/SQL permite usar estruturas de controle como `IF`, `LOOP`, `WHILE` e `FOR`. Essas estruturas são usadas para controlar o fluxo de execução do código.

#### **3: Estrutura IF-THEN-ELSE**

**Exemplo:**
```sql
DECLARE
    v_idade NUMBER := 18;
BEGIN
    IF v_idade >= 18 THEN
        DBMS_OUTPUT.PUT_LINE('Maior de idade');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Menor de idade');
    END IF;
END;
```

#### **4: Loop FOR**
```sql
BEGIN
    FOR i IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('Número: ' || i);
    END LOOP;
END;
```


### **5: Cursores**

#### **Descrição:**
Cursores em PL/SQL permitem percorrer um conjunto de resultados linha por linha. Um cursor pode ser implícito (automático) ou explícito (declarado pelo usuário).

#### **Exemplo: Cursor Explícito**
```sql
DECLARE
    CURSOR c_empregados IS
        SELECT nome FROM empregados;
    v_nome empregados.nome%TYPE;
BEGIN
    OPEN c_empregados;
    LOOP
        FETCH c_empregados INTO v_nome;
        EXIT WHEN c_empregados%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Empregado: ' || v_nome);
    END LOOP;
    CLOSE c_empregados;
END;
```


### **6: Funções (Functions)**

#### **Descrição:**
Funções em PL/SQL são blocos de código que retornam um valor. Elas podem ser usadas em consultas SQL e outras operações.

#### **Exemplo 6: Criando uma Função**
```sql
CREATE OR REPLACE FUNCTION calcular_desconto(p_preco NUMBER, p_desconto NUMBER)
RETURN NUMBER IS
    v_preco_com_desconto NUMBER;
BEGIN
    v_preco_com_desconto := p_preco - (p_preco * p_desconto / 100);
    RETURN v_preco_com_desconto;
END;
```


### **7: Procedures (Procedures Armazenadas)**

#### **Descrição:**
Procedures são blocos de código que podem executar uma tarefa sem retornar um valor diretamente, embora possam usar parâmetros para enviar ou receber dados.

#### **Exemplo: Criando uma Procedure**
```sql
CREATE OR REPLACE PROCEDURE atualizar_salario(p_id NUMBER, p_novo_salario NUMBER) IS
BEGIN
    UPDATE empregados
    SET salario = p_novo_salario
    WHERE id_empregado = p_id;
    COMMIT;
END;
```


### **8: Pacotes (Packages)**

#### **Descrição:**
Pacotes são agrupamentos de funções, procedures e outras definições em uma única unidade lógica. Eles ajudam a organizar e encapsular o código.

#### **Exemplo: Criando um Pacote**
```sql
-- Especificação do Pacote
CREATE OR REPLACE PACKAGE pacote_gerenciamento_empregados IS
    PROCEDURE adicionar_empregado(p_nome VARCHAR2, p_salario NUMBER);
    FUNCTION contar_empregados RETURN NUMBER;
END pacote_gerenciamento_empregados;

-- Corpo do Pacote
CREATE OR REPLACE PACKAGE BODY pacote_gerenciamento_empregados IS
    PROCEDURE adicionar_empregado(p_nome VARCHAR2, p_salario NUMBER) IS
    BEGIN
        INSERT INTO empregados (nome, salario)
        VALUES (p_nome, p_salario);
        COMMIT;
    END adicionar_empregado;

    FUNCTION contar_empregados RETURN NUMBER IS
        v_total NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_total FROM empregados;
        RETURN v_total;
    END contar_empregados;
END pacote_gerenciamento_empregados;
```



### **9: Triggers**

#### **Descrição:**
Triggers são blocos de código que são automaticamente executados em resposta a eventos específicos no banco de dados, como `INSERT`, `UPDATE` ou `DELETE`.

#### **Exemplo: Criando um Trigger**
```sql
CREATE OR REPLACE TRIGGER trg_auditoria_empregados
BEFORE INSERT ON empregados
FOR EACH ROW
BEGIN
    :NEW.data_criacao := SYSDATE;
END;
```



### **10. Jobs (Agendamento de Tarefas)**

#### **Descrição:**
Jobs são tarefas agendadas que podem ser configuradas para serem executadas automaticamente em intervalos definidos. Usando o pacote `DBMS_SCHEDULER`, podemos criar, gerenciar e monitorar jobs.

#### **Exemplo: Criando um Job**
```sql
BEGIN
    DBMS_SCHEDULER.create_job (
        job_name        => 'atualizar_estatisticas',
        job_type        => 'PLSQL_BLOCK',
        job_action      => 'BEGIN DBMS_STATS.GATHER_SCHEMA_STATS(''MEU_ESQUEMA''); END;',
        start_date      => SYSTIMESTAMP,
        repeat_interval => 'FREQ=DAILY; BYHOUR=2',
        enabled         => TRUE
    );
END;
```



### **11. Índices (Indexes)**

#### **Descrição:**
Índices são estruturas de dados usadas para melhorar a performance das consultas. Existem vários tipos de índices, como B-tree e Bitmap, cada um com suas características e usos específicos.

#### **Exemplo 11: Criando um Índice**
```sql
CREATE INDEX idx_nome_empregados
ON empregados (nome);
```


### **12. Logs AWR** 

A análise dos logs **AWR (Automatic Workload Repository)** é uma parte importante da monitoração e otimização do desempenho do Oracle Database. O AWR coleta e armazena automaticamente dados de performance do banco de dados em intervalos regulares, e esses dados podem ser consultados e analisados para entender o comportamento do banco, identificar gargalos de desempenho e possíveis melhorias.

Aqui estão os principais passos para gerar o AWR:

### 1. **Gerar um Relatório AWR**
   O AWR pode ser acessado via **Oracle Enterprise Manager (OEM)** ou via **SQL*Plus**. Abaixo estão as instruções para gerar um relatório AWR usando SQL*Plus.

   #### Via SQL*Plus:
   Conecte-se ao banco de dados com um usuário com privilégios apropriados (geralmente `SYSDBA`):
   ```sql
   sqlplus / as sysdba
   ```

   Depois, execute o seguinte script para gerar o relatório AWR:
   ```sql
   @?/rdbms/admin/awrrpt.sql
   ```

   Isso solicitará as seguintes informações:
   - **Tipo de Relatório**: HTML ou texto (recomenda-se HTML para análise visual).
   - **Instância do Banco**: Se houver várias instâncias, selecione a que deseja analisar.
   - **Intervalo de Snapshots**: Escolha o intervalo (snapshots) para gerar o relatório. Esses snapshots são capturas periódicas de desempenho do sistema.

   O relatório será gerado no formato selecionado e salvo no local especificado.

### **AWR via SQL Developer** 

Para extrair o **AWR (Automatic Workload Repository)** usando o **Oracle SQL Developer**, siga os passos abaixo:

### **Conectar ao Banco de Dados**
   Primeiro, conecte-se ao banco de dados Oracle usando o Oracle SQL Developer com um usuário que tenha privilégios administrativos (geralmente `SYSDBA` ou outro usuário com permissões para acessar o AWR).

### **Acessar o Repositório AWR via SQL Developer**

   Você pode rodar o script **`awrrpt.sql`** diretamente pelo Oracle SQL Developer:

   #### Passos:
   - Conecte-se ao banco de dados.
   - Abra uma nova aba de SQL (Ctrl+Shift+N) e execute o seguinte comando para acessar o script `awrrpt.sql` que gera o relatório AWR:
     ```sql
     @?/rdbms/admin/awrrpt.sql
     ```
   - Isso solicitará uma série de informações:
     - **Tipo de Relatório**: Escolha entre HTML ou texto (recomenda-se HTML).
     - **Identificação da Instância**: Se houver mais de uma instância, escolha a correta.
     - **Intervalo de Snapshots**: O sistema pedirá para você escolher o intervalo de snapshots que deseja usar. Você verá os snapshots disponíveis para selecionar.

   - O relatório será gerado e, dependendo do formato (HTML ou texto), você poderá visualizá-lo diretamente no SQL Developer ou salvá-lo como um arquivo em seu sistema.

### **Interpretar e Salvar o Relatório**
   Se você optar pelo formato **HTML**, o Oracle SQL Developer provavelmente exibirá o relatório diretamente no painel de saída ou em uma janela do navegador, permitindo que você visualize e analise.

   Caso tenha gerado o relatório no formato **texto**, o conteúdo aparecerá diretamente na janela de resultados do Oracle SQL Developer. Você poderá copiá-lo ou salvá-lo como um arquivo de texto para análise posterior.

### **Gerar AWR usando PL/SQL**
   
   Outra opção é gerar o relatório AWR por meio de um comando PL/SQL diretamente no Oracle SQL Developer. O seguinte exemplo gera o relatório entre dois snapshots específicos:

   ```sql
   DECLARE
       l_report CLOB;
   BEGIN
       l_report := DBMS_WORKLOAD_REPOSITORY.awr_report_html(
                        l_dbid     => (SELECT dbid FROM v$database),
                        l_inst_num => 1,
                        l_beg_snap => :begin_snap,   -- Substitua com o ID do snapshot inicial
                        l_end_snap => :end_snap      -- Substitua com o ID do snapshot final
                    );
       DBMS_OUTPUT.put_line(l_report);
   END;
   /
   ```

   Você precisará substituir `:begin_snap` e `:end_snap` pelos IDs dos snapshots que deseja analisar. O relatório será gerado no formato HTML.

### **Obter os IDs dos Snapshots**
   Para verificar os snapshots disponíveis, execute a seguinte consulta no Oracle SQL Developer:
   ```sql
   SELECT snap_id, begin_interval_time, end_interval_time
   FROM dba_hist_snapshot
   ORDER BY snap_id;
   ```

   Isso retornará os IDs dos snapshots e seus horários, permitindo que você escolha o intervalo correto para gerar o relatório.

### **Salvar o Relatório**
   Uma vez gerado o relatório, você pode salvá-lo em seu computador. Se for HTML, você pode salvar diretamente como um arquivo `.html` e abrir em qualquer navegador para visualização.

### **Estrutura do Relatório AWR**
   O relatório AWR contém várias seções com informações detalhadas sobre o desempenho do banco de dados. Aqui estão algumas das seções mais importantes:

   - **Load Profile**: Mostra uma visão geral do uso do sistema durante o intervalo, como transações por segundo, leituras lógicas e físicas.
   - **Instance Efficiency Percentages**: Apresenta métricas de eficiência da instância, como cache hit ratios, que ajudam a identificar possíveis ajustes.
   - **Top 5 Timed Events**: Exibe os 5 eventos mais demorados, ajudando a identificar gargalos de performance.
   - **Wait Events**: Lista os principais eventos de espera, como I/O ou bloqueios que estão impactando o desempenho.
   - **SQL Statistics**: Apresenta as consultas SQL que mais consomem recursos (CPU, I/O, memória).
   - **IO Statistics**: Estatísticas detalhadas sobre atividades de leitura e escrita no disco.
   - **Memory Statistics**: Estatísticas de uso de memória, especialmente para o **SGA** (System Global Area) e **PGA** (Program Global Area).

### 3. **Como Analisar o Relatório AWR**

#### 3.1 **Load Profile**
   Veja as métricas como "transactions per second", "logical reads", "physical reads", e "DB CPU". Use essas informações para entender a carga geral do banco de dados.

#### 3.2 **Top 5 Timed Events**
   - Identifique os eventos que estão consumindo mais tempo. Esses eventos geralmente são o ponto de partida para identificar os gargalos de desempenho.
   - Tipicamente, você encontrará esperas de I/O, locks, e eventos relacionados a rede.

#### 3.3 **Instance Efficiency Percentages**
   - Verifique as taxas de acerto do cache de buffers (Buffer Cache Hit Ratio), cache de bibliotecas (Library Cache Hit Ratio) e outras métricas que mostram a eficiência do uso de recursos.
   - Se os percentuais estiverem muito baixos, pode ser necessário ajustar a configuração da memória do banco de dados (SGA, PGA).

#### 3.4 **Wait Events**
   - Analisar a seção de **wait events** permite entender onde o banco está "esperando". Essas esperas podem ser devidas a I/O, problemas de rede, bloqueios (locks), ou contenção de CPU.
   - Fique atento para eventos de espera relacionados a I/O, pois isso pode indicar necessidade de otimização do armazenamento.

#### 3.5 **SQL Statistics**
   - Examine as consultas SQL que estão consumindo mais recursos (queries com alto consumo de CPU, tempo de execução, ou leituras/escritas).
   - Verifique se há possibilidade de otimizar essas consultas com novos índices, reescrevendo a query, ou usando *hints*.

#### 3.6 **I/O Statistics**
   - Veja as estatísticas de I/O para identificar se os discos ou subsistemas de armazenamento estão sendo um gargalo.
   - Muitos "physical reads" podem indicar que o banco de dados não está mantendo dados importantes no cache de memória.

### 4. **Melhores Práticas para Análise AWR**
   - **Comparação de Snapshots**: Compare vários relatórios AWR ao longo do tempo para observar mudanças no desempenho e identificar tendências.
   - **Analisar SQL Problemáticas**: Otimize consultas SQL problemáticas ou com alta carga.
   - **Ajuste de Parâmetros**: Ajuste parâmetros de inicialização como tamanho de memória (SGA, PGA) com base nas informações de eficiência e eventos de espera.

### 5. **Ferramentas Auxiliares**
   - **AWR Baselines**: Crie baselines AWR para comparar períodos de desempenho "normal" com períodos de problemas.
   - **Oracle Enterprise Manager (OEM)**: Ferramenta gráfica que oferece relatórios AWR diretamente na interface, facilitando a visualização e análise.

A análise adequada do relatório AWR pode ajudar a identificar áreas problemáticas no banco de dados e fornecer informações sobre como otimizar o desempenho, ajustando consultas, índices e a configuração do banco de dados.

