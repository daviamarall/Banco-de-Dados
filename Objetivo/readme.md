




---

## **Oracle PL/SQL**

### **Módulo 1: Introdução ao PL/SQL**

#### **Descrição:**
PL/SQL (Procedural Language/SQL) é a extensão procedural da linguagem SQL, usada em bancos de dados Oracle. Ele permite combinar comandos SQL com lógica de programação, como loops e condicionais, para criar blocos de código reutilizáveis.

#### **Exemplo 1: Bloco PL/SQL Simples**
```sql
DECLARE
    v_nome VARCHAR2(50);
BEGIN
    v_nome := 'Maria';
    DBMS_OUTPUT.PUT_LINE('Olá, ' || v_nome);
END;
```

---

### **Módulo 2: Variáveis e Tipos de Dados**

#### **Descrição:**
Em PL/SQL, as variáveis são usadas para armazenar dados temporários. Elas devem ser declaradas na seção de declaração do bloco PL/SQL e podem ser de vários tipos: numéricos, caracteres, datas, entre outros.

#### **Exemplo 2: Declaração de Variáveis**
```sql
DECLARE
    v_idade NUMBER := 25;
    v_nome VARCHAR2(100) := 'João';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Nome: ' || v_nome || ', Idade: ' || v_idade);
END;
```

---

### **Módulo 3: Estruturas de Controle**

#### **Descrição:**
PL/SQL permite usar estruturas de controle como `IF`, `LOOP`, `WHILE` e `FOR`. Essas estruturas são usadas para controlar o fluxo de execução do código.

#### **Exemplo 3: Estrutura IF-THEN-ELSE**
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

#### **Exemplo 4: Loop FOR**
```sql
BEGIN
    FOR i IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('Número: ' || i);
    END LOOP;
END;
```

---

### **Módulo 4: Cursores**

#### **Descrição:**
Cursores em PL/SQL permitem percorrer um conjunto de resultados linha por linha. Um cursor pode ser implícito (automático) ou explícito (declarado pelo usuário).

#### **Exemplo 5: Cursor Explícito**
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

---

### **Módulo 5: Funções (Functions)**

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

---

### **Módulo 6: Procedures (Procedures Armazenadas)**

#### **Descrição:**
Procedures são blocos de código que podem executar uma tarefa sem retornar um valor diretamente, embora possam usar parâmetros para enviar ou receber dados.

#### **Exemplo 7: Criando uma Procedure**
```sql
CREATE OR REPLACE PROCEDURE atualizar_salario(p_id NUMBER, p_novo_salario NUMBER) IS
BEGIN
    UPDATE empregados
    SET salario = p_novo_salario
    WHERE id_empregado = p_id;
    COMMIT;
END;
```

---

### **Módulo 7: Pacotes (Packages)**

#### **Descrição:**
Pacotes são agrupamentos de funções, procedures e outras definições em uma única unidade lógica. Eles ajudam a organizar e encapsular o código.

#### **Exemplo 8: Criando um Pacote**
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

---

### **Módulo 8: Triggers**

#### **Descrição:**
Triggers são blocos de código que são automaticamente executados em resposta a eventos específicos no banco de dados, como `INSERT`, `UPDATE` ou `DELETE`.

#### **Exemplo 9: Criando um Trigger**
```sql
CREATE OR REPLACE TRIGGER trg_auditoria_empregados
BEFORE INSERT ON empregados
FOR EACH ROW
BEGIN
    :NEW.data_criacao := SYSDATE;
END;
```

---

### **Módulo 9: Jobs (Agendamento de Tarefas)**

#### **Descrição:**
Jobs são tarefas agendadas que podem ser configuradas para serem executadas automaticamente em intervalos definidos. Usando o pacote `DBMS_SCHEDULER`, podemos criar, gerenciar e monitorar jobs.

#### **Exemplo 10: Criando um Job**
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

---

### **Módulo 10: Índices (Indexes)**

#### **Descrição:**
Índices são estruturas de dados usadas para melhorar a performance das consultas. Existem vários tipos de índices, como B-tree e Bitmap, cada um com suas características e usos específicos.

#### **Exemplo 11: Criando um Índice**
```sql
CREATE INDEX idx_nome_empregados
ON empregados (nome);
```

---

### **Módulo 11: Exceções (Tratamento de Erros)**

#### **Descrição:**
Em PL/SQL, podemos capturar e tratar erros usando blocos de exceção. Isso permite lidar com situações inesperadas, como divisão por zero ou consultas sem resultados.

#### **Exemplo 12: Tratamento de Exceção**
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

---

### **Módulo 12: Otimização e Boas Práticas em PL/SQL**

#### **Descrição:**
PL/SQL oferece várias maneiras de otimizar código para performance. Boas práticas incluem o uso de `BULK COLLECT` para grandes volumes de dados e o uso cuidadoso de cursores e loops.

#### **Exemplo 13: Uso de BULK COLLECT**
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

---

Este curso cobre os principais conceitos de PL/SQL, com exemplos simples e práticos, fornecendo uma base sólida para trabalhar com desenvolvimento em Oracle.
