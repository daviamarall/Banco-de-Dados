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

#### **Exemplo: Consulta com Filtros**
```sql
SELECT Nome, Preco
FROM Produtos
WHERE Preco > 1000;
```

#### **Exemplo: Join entre Tabelas**
```sql
SELECT C.Nome, P.Nome AS Produto, P.Preco
FROM Clientes C
INNER JOIN Pedidos Ped ON C.ClienteID = Ped.ClienteID
INNER JOIN Produtos P ON Ped.ProdutoID = P.ProdutoID;
```

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

1. **DECLARE**: Esta seção é usada para declarar variáveis ou tipos de dados que serão usados no bloco PL/SQL. No seu exemplo, `v_nome` é declarado como uma variável do tipo `VARCHAR2(50)`.

2. **BEGIN**: Aqui começa o bloco real de código PL/SQL. É onde a lógica principal do seu código é colocada.

3. **v_nome := 'Maria';**: Atribui o valor 'Maria' à variável `v_nome`.

4. **DBMS_OUTPUT.PUT_LINE('Olá, ' || v_nome);**: Esta linha imprime na saída padrão (normalmente usada em ambientes como o SQL*Plus ou SQL Developer) a mensagem 'Olá, ' seguida pelo valor da variável `v_nome`.

5. **END;**: Finaliza o bloco PL/SQL.




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



### **12. Exceções (Tratamento de Erros)**

#### **Descrição:**
Em PL/SQL, podemos capturar e tratar erros usando blocos de exceção. Isso permite lidar com situações inesperadas, como divisão por zero ou consultas sem resultados.

#### **Exemplo: Tratamento de Exceção**
```sql
BEGIN
    DECLARE
        v_resultado NUMBER;
    BEGIN
        v_resultado := 10 / 0; -- Tentativa de divisão por zero
    EXCEPTION
        WHEN ZERO_DIVIDE THEN
            DBMS_OUTPUT.PUT_LINE('Erro: Divisão por zero!');
    END;
END;
```



### **13. Otimização e Boas Práticas em PL/SQL**

#### **Descrição:**
PL/SQL oferece várias maneiras de otimizar código para performance. Boas práticas incluem o uso de `BULK COLLECT` para grandes volumes de dados e o uso cuidadoso de cursores e loops.

#### **Exemplo: Uso de BULK COLLECT**
```sql
DECLARE
    TYPE t_empregados IS TABLE OF empregados%ROWTYPE;
    v_empregados t_empregados;
BEGIN
    SELECT * BULK COLLECT INTO v_empregados FROM empregados;
    FOR i IN v_empregados.FIRST .. v_empregados.LAST LOOP
        DBMS_OUTPUT.PUT_LINE('Empregado: ' || v_empregados(i).nome);
    END LOOP;
END;
```


