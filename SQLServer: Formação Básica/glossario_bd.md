
# Glossário de Termos Utilizados para Manipular Bancos de Dados

### 1. **Banco de Dados (Database)**
   Um conjunto organizado de dados armazenados eletronicamente. Ele é projetado para facilitar o armazenamento, a busca e a gestão de grandes quantidades de informação.

### 2. **Tabela (Table)**
   Um conjunto de dados organizados em linhas e colunas, onde cada coluna representa um campo (atributo) e cada linha representa um registro (tupla).

### 3. **Linha (Row)**
   Também conhecida como registro, uma linha em uma tabela de banco de dados representa uma única entrada que contém dados em diferentes colunas.

### 4. **Coluna (Column)**
   Um campo específico em uma tabela que contém dados de um tipo particular, como nomes, números ou datas.

### 5. **Chave Primária (Primary Key)**
   Um campo (ou um conjunto de campos) em uma tabela que identifica de forma única cada registro na tabela. Não pode conter valores nulos e deve ser único.

### 6. **Chave Estrangeira (Foreign Key)**
   Um campo em uma tabela que é uma referência à chave primária de outra tabela, estabelecendo uma relação entre as duas tabelas.

### 7. **Consulta (Query)**
   Uma solicitação para recuperar, inserir, atualizar ou excluir dados de um banco de dados. As consultas são escritas em linguagens como SQL.

### 8. **SQL (Structured Query Language)**
   A linguagem padrão usada para manipular e gerenciar bancos de dados relacionais. Permite executar operações como `SELECT`, `INSERT`, `UPDATE` e `DELETE`.

### 9. **SELECT**
   Um comando SQL usado para recuperar dados de um banco de dados. Ele pode ser usado para selecionar colunas específicas ou todas as colunas de uma tabela.

### 10. **INSERT**
   Um comando SQL utilizado para inserir novos registros em uma tabela.

### 11. **UPDATE**
   Um comando SQL que altera os dados existentes em um banco de dados.

### 12. **DELETE**
   Um comando SQL utilizado para excluir registros de uma tabela.

### 13. **JOIN**
   Uma operação SQL que combina colunas de duas ou mais tabelas baseadas em uma condição relacionada, como a correspondência de uma chave estrangeira com uma chave primária.

### 14. **Índice (Index)**
   Uma estrutura de dados usada para melhorar a velocidade das operações de recuperação em uma tabela. Semelhante ao índice de um livro, ele facilita a busca rápida de registros.

### 15. **VIEW (Visão)**
   Uma consulta salva que exibe dados de uma ou mais tabelas. É usada para simplificar consultas complexas ou para restringir o acesso a dados.

### 16. **Trigger (Gatilho)**
   Um procedimento que é automaticamente executado em resposta a eventos específicos em uma tabela, como uma inserção, atualização ou exclusão.

### 17. **Procedimento Armazenado (Stored Procedure)**
   Um conjunto de comandos SQL armazenados no banco de dados que podem ser executados de uma vez para realizar tarefas repetitivas.

### 18. **Transação (Transaction)**
   Um conjunto de operações SQL que são executadas como uma única unidade. Se uma operação falhar, todas as outras operações na transação são revertidas (rollback).

### 19. **Commit**
   O comando usado para confirmar uma transação, salvando permanentemente as mudanças no banco de dados.

### 20. **Rollback**
   O comando que desfaz uma transação, revertendo todas as alterações feitas durante a transação.

### 21. **Normalization (Normalização)**
   O processo de organizar os dados em um banco de dados para minimizar redundâncias e dependências, dividindo tabelas grandes em tabelas menores e relacionadas.

### 22. **Denormalization (Desnormalização)**
   O processo inverso à normalização, que envolve adicionar redundância aos dados para melhorar o desempenho de consultas.

### 23. **DDL (Data Definition Language)**
   Parte do SQL que lida com a definição de estruturas de dados, como criação e alteração de tabelas e índices (`CREATE`, `ALTER`, `DROP`).

### 24. **DML (Data Manipulation Language)**
   Parte do SQL usada para manipular dados em tabelas (`INSERT`, `UPDATE`, `DELETE`, `SELECT`).

### 25. **DCL (Data Control Language)**
   Parte do SQL usada para controlar o acesso aos dados (`GRANT`, `REVOKE`).

### 26. **ACID**
   Um conjunto de propriedades que garantem que as transações de banco de dados sejam processadas de forma confiável: Atomicidade, Consistência, Isolamento e Durabilidade.

### 27. **Clustered Index**
   Um índice que reordena fisicamente os dados na tabela para corresponder à ordem do índice. Uma tabela só pode ter um índice clustered.

### 28. **Non-Clustered Index**
   Um índice que não altera a ordem física das tabelas, mas cria uma estrutura separada que aponta para os dados.

### 29. **Foreign Key Constraint (Restrição de Chave Estrangeira)**
   Garante que os valores em uma coluna de uma tabela correspondam aos valores de uma coluna chave primária em outra tabela, garantindo a integridade referencial.

### 30. **Schemas**
   Uma coleção lógica de objetos de banco de dados, como tabelas e procedimentos armazenados, que organiza os objetos de forma categorizada.

### 31. **CHECK Constraint (Restrição de Checagem)**
   Uma restrição que define uma condição lógica que deve ser verdadeira para que os dados sejam aceitos na coluna ou tabela. É usada para impor regras específicas aos valores inseridos em uma coluna, garantindo que os dados atendam a certos critérios.
   
   **Exemplo:**
   ```sql
   CREATE TABLE Pessoas (
      Id INT PRIMARY KEY,
      Idade INT CHECK (Idade >= 18)  -- Apenas valores maiores ou iguais a 18 serão permitidos na coluna Idade
   );
   ```

### 32. **UNIQUE Constraint (Restrição Única)**
   Uma restrição que garante que todos os valores de uma coluna ou conjunto de colunas sejam únicos, ou seja, que não haja valores duplicados. Diferente da chave primária, uma tabela pode ter várias restrições únicas.
   
   **Exemplo:**
   ```sql
   CREATE TABLE Funcionarios (
      Id INT PRIMARY KEY,
      Email NVARCHAR(100) UNIQUE  -- Garante que não haja dois funcionários com o mesmo e-mail
   );
   ```

