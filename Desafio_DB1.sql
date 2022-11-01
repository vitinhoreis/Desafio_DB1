-- ATIVIDADE ENTERPRISE CHALLENGE 3º SEMESTRE - DB1 GROUP


-- CRIANDO AS TABELAS


-- CRIANDO A TABELA "T_EC_DB_TIPO_PRODUTO"
CREATE TABLE T_EC_DB_TIPO_PRODUTO (
    cd_tipo_produto      NUMBER(10)     NOT NULL,
    nm_tipo_produto      VARCHAR2(50)    NOT NULL,
    CONSTRAINT pk_cd_tipo_produto PRIMARY KEY (cd_tipo_produto)
);

-- EXCLUINDO A TABELA "T_EC_DB_TIPO_PRODUTO"
DROP TABLE T_EC_DB_TIPO_PRODUTO;

-- EXCLUINDO TODOS OS DADOS DA TABELA "T_EC_DB_TIPO_PRODUTO"
TRUNCATE TABLE T_EC_DB_TIPO_PRODUTO;

-- INSERINDO VALORES NA TABELA "T_EC_DB_TIPO_PRODUTO"
INSERT INTO T_EC_DB_TIPO_PRODUTO (cd_tipo_produto, nm_tipo_produto)
    VALUES(1,'COMBUSTÍVEL');
INSERT INTO T_EC_DB_TIPO_PRODUTO (cd_tipo_produto, nm_tipo_produto)
    VALUES(2,'LUBRIFICANTE');

-- SELECIONANDO TODOS OS VALORES DA TABELA "T_EC_DB_TIPO_PRODUTO"
SELECT * FROM T_EC_DB_TIPO_PRODUTO;

-- CRIANDO TRIGGER PARA CRIAÇÃO DE SEQUENCIA DA TABELA "T_EC_DB_TIPO_PRODUTO"

DROP SEQUENCE sq_tipo_produto; -- EXCLUINDO UMA SEQUENCE PRE EXISTENTE
CREATE SEQUENCE sq_tipo_produto START WITH 2; -- RECRIANDO A SEQUENCE APAGADA ACIMA

CREATE OR REPLACE TRIGGER tr_tipo_produto_seq
BEFORE INSERT ON t_ec_db_tipo_produto 
FOR EACH ROW
DECLARE
    v_cd_tipo_produto t_ec_db_tipo_produto.cd_tipo_produto%TYPE;
BEGIN
  SELECT sq_tipo_produto.nextval INTO v_cd_tipo_produto FROM dual;
  :NEW.cd_tipo_produto := v_cd_tipo_produto;
END;
/


-- CRIANDO A TABELA "T_EC_DB_PRODUTO"

CREATE TABLE T_EC_DB_PRODUTO (
    cd_produto       NUMBER(10)      NOT NULL,
    nm_produto       VARCHAR2(50)    NOT NULL,
    dsc_produto      VARCHAR2(500)   NOT NULL,
    vl_produto       NUMBER(10,2)    NOT NULL,
    dt_validade      DATE            NOT NULL,
    status           CHAR(1)         NOT NULL,
    cd_tipo_produto  NUMBER(10)      NOT NULL,
    cd_usuario       NUMBER(10)      NOT NULL,
    CONSTRAINT pk_cd_produto PRIMARY KEY (cd_produto),
    CONSTRAINT fk_cd_tipo_produto_produto FOREIGN KEY (cd_tipo_produto) REFERENCES T_EC_DB_TIPO_PRODUTO (cd_tipo_produto),
    CONSTRAINT fk_cd_usuario_produto FOREIGN KEY (cd_usuario) REFERENCES T_EC_DB_USUARIO (cd_usuario)
);

-- EXCLUINDO A TABELA ''T_EC_DB_PRODUTO"
DROP TABLE T_EC_DB_PRODUTO;

-- EXCLUINDO TODOS OS DADOS DA TABELA "T_EC_DB_PRODUTO"
TRUNCATE TABLE T_EC_DB_PRODUTO;

-- INSERINDO VALORES NA TABELA "T_EC_DB_PRODUTO"
INSERT INTO T_EC_DB_PRODUTO (cd_produto, nm_produto, dsc_produto, vl_produto, dt_validade, status, cd_tipo_produto, cd_usuario)
    VALUES(1, 'ETANOL', 'COMBUSTÍVEL A BASE DE ÁLCOOL', 4.80, TO_DATE('17/08/2022', 'DD/MM/YYYY'), 1, 1, 1);
INSERT INTO T_EC_DB_PRODUTO (cd_produto, nm_produto, dsc_produto, vl_produto, dt_validade, status, cd_tipo_produto, cd_usuario)
    VALUES(2, 'GASOLINA', 'COMBUSTÍVEL A BASE DE PETRÓLEO', 6.60, TO_DATE('30/11/2022', 'DD/MM/YYYY'), 1, 1, 1);
INSERT INTO T_EC_DB_PRODUTO (cd_produto, nm_produto, dsc_produto, vl_produto, dt_validade, status, cd_tipo_produto, cd_usuario) 
    VALUES(3, 'DIESEL', 'COMBUSTÍVEL OLEOSO A BASE DE PETROLEO', 5.20, TO_DATE('25/09/2022', 'DD/MM/YYYY'), 1, 1, 1);
INSERT INTO T_EC_DB_PRODUTO (cd_produto, nm_produto, dsc_produto, vl_produto, dt_validade, status, cd_tipo_produto, cd_usuario)
    VALUES(4, 'LUBRIFULL', 'LUBRIFICANTE PARA MOTORES DE CARRO', 11.50, TO_DATE('20/03/2024', 'DD/MM/YYYY'), 1, 2, 1);
INSERT INTO T_EC_DB_PRODUTO (cd_produto, nm_produto, dsc_produto, vl_produto, dt_validade, status, cd_tipo_produto, cd_usuario)
    VALUES(5, 'LUBRIFICANTE SINTÉTICO', 'ÓLEO LUBRIFICANTE SINTÉTICO AUTOMOTIVO', 8.99, TO_DATE('15/06/2023', 'DD/MM/YYYY'), 0, 2, 1);

-- SELECIONANDO TODOS OS VALORES DA TABELA "T_EC_DB_PRODUTO"
SELECT * FROM T_EC_DB_PRODUTO;

-- CRIANDO TRIGGER PARA CRIAÇÃO DE SEQUENCIA DA TABELA "T_EC_DB_PRODUTO"

DROP SEQUENCE sq_produto; -- EXCLUINDO UMA SEQUENCE PRE EXISTENTE
CREATE SEQUENCE sq_produto START WITH 5; -- RECRIANDO A SEQUENCE APAGADA ACIMA

CREATE OR REPLACE TRIGGER tr_produto_seq
BEFORE INSERT ON t_ec_db_produto 
FOR EACH ROW
DECLARE
    v_cd_produto t_ec_db_produto.cd_produto%TYPE;
BEGIN
  SELECT sq_produto.nextval INTO v_cd_produto FROM dual;
  :NEW.cd_produto := v_cd_produto;
END;
/


-- CRIANDO A TABELA "T_EC_DB_USUARIO"
CREATE TABLE T_EC_DB_USUARIO(
    cd_usuario      NUMBER(10)      NOT NULL,
    nm_usuario      VARCHAR2(50)    NOT NULL,
    email_usuario   VARCHAR2(100)   NOT NULL,
    status          CHAR(1)         NOT NULL,
    CONSTRAINT pk_cd_usuario PRIMARY KEY (cd_usuario)
);

-- EXCLUINDO A TABELA ''T_EC_DB_USUARIO"
DROP TABLE T_EC_DB_USUARIO;

-- EXCLUINDO TODOS OS DADOS DA TABELA "T_EC_DB_USUARIO"
TRUNCATE TABLE T_EC_DB_USUARIO;

-- INSERINDO VALORES NA TABELA "T_EC_DB_USUARIO"
INSERT INTO T_EC_DB_USUARIO (cd_usuario, nm_usuario, email_usuario, status)
    VALUES(1,'PETROSELL', 'PETROSELL@EMAIL.COM', 1);
INSERT INTO T_EC_DB_USUARIO (cd_usuario, nm_usuario, email_usuario, status)
    VALUES(2,'COMBUSTROL', 'COMBUSTROL@EMAIL.COM', 0);

-- SELECIONANDO TODOS OS VALORES DA TABELA "T_EC_DB_USUARIO"
SELECT * FROM T_EC_DB_USUARIO;

-- CRIANDO TRIGGER PARA CRIAÇÃO DE SEQUENCIA DA TABELA "T_EC_DB_USUARIO"

DROP SEQUENCE sq_usuario; -- EXCLUINDO UMA SEQUENCE PRE EXISTENTE
CREATE SEQUENCE sq_usuario START WITH 2; -- RECRIANDO A SEQUENCE APAGADA ACIMA

CREATE OR REPLACE TRIGGER tr_usuario_seq
BEFORE INSERT ON t_ec_db_usuario
FOR EACH ROW
DECLARE
    v_cd_usuario t_ec_db_usuario.cd_usuario%TYPE;
BEGIN
  SELECT sq_usuario.nextval INTO v_cd_usuario FROM dual;
  :NEW.cd_usuario := v_cd_usuario;
END;
/


-- CRIANDO A TABELA "T_EC_DB_AUDITORIA" 
CREATE TABLE T_EC_DB_AUDITORIA(
    cd_produto      NUMBER(10),
    dt_hora         DATE,
    operacao        VARCHAR2(6),
    tipo_alter      VARCHAR2(30),
    antigo          VARCHAR2(30),
    novo            VARCHAR2(30),
    cd_usuario      NUMBER(10),
    CONSTRAINT fk_cd_usuario FOREIGN KEY (cd_usuario) REFERENCES T_EC_DB_USUARIO (cd_usuario)
);

-- EXCLUINDO A TABELA ''T_EC_DB_AUDITORIA"
DROP TABLE T_EC_DB_AUDITORIA;

-- EXCLUINDO TODOS OS DADOS DA TABELA "T_EC_DB_AUDITORIA"
TRUNCATE TABLE T_EC_DB_AUDITORIA;

-- SELECIONANDO TODOS OS VALORES DA TABELA "T_EC_DB_AUDITORIA"
SELECT * FROM T_EC_DB_AUDITORIA;
 
 -- CRIANDO UMA STORED PROCEDURE "SP_REGISTRA" PARA A TABELA "T_EC_DB_AUDITORIA" 
CREATE OR REPLACE PROCEDURE sp_registra
 (p_cd_produto   IN  VARCHAR2,
  P_operacao     IN  VARCHAR2,
  p_tipo_alter   IN  VARCHAR2,
  P_antigo       IN  VARCHAR2,
  P_novo         IN  VARCHAR2,
  p_cd_usuario   IN  VARCHAR2) AS
  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
  INSERT INTO t_ec_db_auditoria (cd_produto, dt_hora, operacao, tipo_alter, antigo, novo, cd_usuario)
  VALUES (p_cd_produto, SYSDATE, p_operacao, p_tipo_alter, p_antigo, p_novo, p_cd_usuario);
  COMMIT;
END sp_registra;
/


-- CRIANDO AS TRIGGERS PARA AUDITORIA


-- CRIANDO A TRIGGER DE AUDITORIA PARA INSERÇÃO E DELEÇÃO DA TABELA "T_EC_DB_PRODUTO"
CREATE OR REPLACE TRIGGER ins_del_produto
BEFORE INSERT OR DELETE ON t_ec_db_produto 
FOR EACH ROW 
BEGIN 

   CASE
     WHEN INSERTING THEN
          sp_registra(:NEW.cd_produto, 'INSERT', 'NOVO PRODUTO CADASTRADO', :OLD.vl_produto, :NEW.vl_produto, :NEW.cd_usuario);  
     WHEN DELETING THEN
          sp_registra(:OLD.cd_produto, 'DELETE', 'PRODUTO DELETADO', :OLD.vl_produto, :NEW.vl_produto, :OLD.cd_usuario);  
  END CASE;

END; 
/

SET SERVEROUTPUT ON

ALTER SESSION SET nls_date_format='DD/MM/YY HH24:MI:SS';

-- Acionando o gatilho com uma instrução INSERT
INSERT INTO t_ec_db_produto (cd_produto, nm_produto, dsc_produto, vl_produto, dt_validade, status, cd_tipo_produto, cd_usuario)
    VALUES (10, 'LENHA', 'COMBUSTÍVEL A BASE DE MADEIRA', 15, TO_DATE('17/08/2024', 'DD/MM/YYYY'), 1, 1, 1);

SELECT * FROM T_EC_DB_AUDITORIA;

SELECT *FROM T_EC_DB_PRODUTO;

-- Acionando o gatilho com uma instrução DELETE
DELETE t_ec_db_produto
WHERE cd_produto = 6;
    
SELECT * FROM T_EC_DB_AUDITORIA;


-- CRIANDO A TRIGGER DE AUDITORIA PARA A ALTERAÇÃO DO VALOR DO PRODUTO
CREATE OR REPLACE TRIGGER mudancas_valores
BEFORE UPDATE OF vl_produto ON t_ec_db_produto 
FOR EACH ROW 
BEGIN 

    sp_registra(:OLD.cd_produto, 'UPDATE', 'VALOR DO PRODUTO ALTERADO', :OLD.vl_produto, :NEW.vl_produto, :OLD.cd_usuario);  

END; 
/

-- Acionando o gatilho com uma instrução UPDATE
UPDATE t_ec_db_produto
   SET vl_produto = vl_produto * 0.8
WHERE cd_produto = 7;

SELECT * FROM T_EC_DB_AUDITORIA;

SELECT *FROM T_EC_DB_PRODUTO;


-- CRIANDO A TRIGGER DE AUDITORIA PARA A ALTERAÇÃO DO NOME DO PRODUTO
CREATE OR REPLACE TRIGGER mudancas_nome
BEFORE UPDATE OF nm_produto ON t_ec_db_produto 
FOR EACH ROW 
BEGIN 

    sp_registra(:OLD.cd_produto, 'UPDATE', 'NOME DO PRODUTO ALTERADO', :OLD.nm_produto, :NEW.nm_produto, :OLD.cd_usuario);  

END; 
/

-- Acionando o gatilho com uma instrução UPDATE
UPDATE t_ec_db_produto
   SET nm_produto = 'QUEROSENE'
WHERE cd_produto = 9;

SELECT * FROM T_EC_DB_AUDITORIA;

SELECT *FROM T_EC_DB_PRODUTO;


-- CRIANDO A TRIGGER DE AUDITORIA PARA A ALTERAÇÃO DA DESCRIÇÃO DO PRODUTO
CREATE OR REPLACE TRIGGER mudancas_descricao
BEFORE UPDATE OF dsc_produto ON t_ec_db_produto 
FOR EACH ROW 
BEGIN 

    sp_registra(:OLD.cd_produto, 'UPDATE', 'DESCRIÇÃO DO PROD. ALTER.', :OLD.dsc_produto, :NEW.dsc_produto, :OLD.cd_usuario);  

END; 
/

-- Acionando o gatilho com uma instrução UPDATE
UPDATE t_ec_db_produto
   SET dsc_produto = 'COMBUSTÍVEL A BASE DE PETROLEO'
WHERE cd_produto = 9;

SELECT * FROM T_EC_DB_AUDITORIA;

SELECT *FROM T_EC_DB_PRODUTO;


-- CRIANDO A TRIGGER DE AUDITORIA PARA A ALTERAÇÃO DA DATA DE VALIDADE DO PRODUTO
CREATE OR REPLACE TRIGGER mudancas_dt_validade
BEFORE UPDATE OF dt_validade ON t_ec_db_produto 
FOR EACH ROW 
BEGIN 

    sp_registra(:OLD.cd_produto, 'UPDATE', 'DT VAL. DO PROD. ALTER.', :OLD.dt_validade, :NEW.dt_validade, :OLD.cd_usuario);  

END; 
/

-- Acionando o gatilho com uma instrução UPDATE
UPDATE t_ec_db_produto
   SET dt_validade = TO_DATE('20/08/2023', 'DD/MM/YYYY')
WHERE cd_produto = 9;

SELECT * FROM T_EC_DB_AUDITORIA;

SELECT *FROM T_EC_DB_PRODUTO;


-- CRIANDO A TRIGGER DE AUDITORIA PARA A ALTERAÇÃO DO STATUS DO PRODUTO
CREATE OR REPLACE TRIGGER mudancas_status
BEFORE UPDATE OF status ON t_ec_db_produto 
FOR EACH ROW 
BEGIN 

    sp_registra(:OLD.cd_produto, 'UPDATE', 'STATUS DO PROD. ALTER.', :OLD.status, :NEW.status, :OLD.cd_usuario);  

END; 
/

-- Acionando o gatilho com uma instrução UPDATE
UPDATE t_ec_db_produto
   SET status = 0
WHERE cd_produto = 9;

SELECT * FROM T_EC_DB_AUDITORIA;

SELECT *FROM T_EC_DB_PRODUTO;


-- CRIANDO A TRIGGER DE AUDITORIA PARA A ALTERAÇÃO DO TIPO DO PRODUTO
CREATE OR REPLACE TRIGGER mudancas_cd_tipo_produto
BEFORE UPDATE OF cd_tipo_produto ON t_ec_db_produto 
FOR EACH ROW 
BEGIN 

    sp_registra(:OLD.cd_produto, 'UPDATE', 'TIPO DO PROD. ALTER.', :OLD.cd_tipo_produto, :NEW.cd_tipo_produto, :OLD.cd_usuario);  

END; 
/

-- Acionando o gatilho com uma instrução UPDATE
UPDATE t_ec_db_produto
   SET cd_tipo_produto = 2
WHERE cd_produto = 9;

SELECT * FROM T_EC_DB_AUDITORIA;

SELECT *FROM T_EC_DB_PRODUTO;


-- CRIANDO AS STORED PROCEDURES DE MANIPULAÇÃO DE PRODUTO

-- CRIANDO UMA STORED PROCEDURE PARA INSERIR DADOS NA TABELA "T_EC_DB_PRODUTO"
CREATE OR REPLACE PROCEDURE sp_insert_produto
    (p_cd_produto       IN    t_ec_db_produto.cd_produto%TYPE,
     p_nm_produto       IN    t_ec_db_produto.nm_produto%TYPE,
     p_dsc_produto      IN    t_ec_db_produto.dsc_produto%TYPE,
     p_vl_produto       IN    t_ec_db_produto.vl_produto%TYPE,
     p_dt_validade      IN    t_ec_db_produto.dt_validade%TYPE,
     p_status           IN    t_ec_db_produto.status%TYPE,
     p_cd_tipo_produto  IN    t_ec_db_produto.cd_tipo_produto%TYPE,
     p_cd_usuario       IN    t_ec_db_produto.cd_usuario%TYPE)
IS
BEGIN
  INSERT INTO t_ec_db_produto(cd_produto, nm_produto, dsc_produto, vl_produto, dt_validade, status, cd_tipo_produto, cd_usuario)
  VALUES(p_cd_produto, p_nm_produto, p_dsc_produto, p_vl_produto, p_dt_validade, p_status, p_cd_tipo_produto, p_cd_usuario);
END sp_insert_produto;
/

BEGIN
    sp_insert_produto(6, 'GASOLINA ADITIVADA', 'COMBUSTÍVEL A BASE DE PETRÓLEO', 7, TO_DATE('28/11/2024', 'DD/MM/YYYY'), 1, 1, 1);
END;
/

SELECT * FROM T_EC_DB_AUDITORIA;

SELECT *FROM T_EC_DB_PRODUTO;

-- CRIANDO STORED PROCEDURE PARA REAJUSTAR O VALOR DO PRODUTO EM PORCETAGEM 
CREATE OR REPLACE PROCEDURE sp_reajuste_val_perc
    (p_cd_produto IN t_ec_db_produto.cd_produto%type,
     p_porcentagem IN number)
IS
BEGIN
UPDATE t_ec_db_produto
    SET vl_produto = vl_produto + (vl_produto *( p_porcentagem / 100 ) )
WHERE cd_produto = p_cd_produto;
    COMMIT;
END sp_reajuste_val_perc;
/

SELECT cd_produto, vl_produto
  FROM t_ec_db_produto
    WHERE cd_produto = 7;

EXECUTE sp_reajuste_val_perc(7, 10);

SELECT cd_produto, vl_produto FROM t_ec_db_produto;


-- CRIANDO STORED PROCEDURE PARA DELETAR UM PRODUTO 
CREATE OR REPLACE PROCEDURE sp_delete_produto
    (p_cd_produto IN t_ec_db_produto.cd_produto%type)
IS
BEGIN
DELETE t_ec_db_produto
WHERE cd_produto = p_cd_produto;
    COMMIT;
END sp_delete_produto;
/

SELECT *
  FROM t_ec_db_produto
    WHERE cd_produto = 7;

EXECUTE sp_delete_produto(7);

SELECT * FROM t_ec_db_produto;


-- CRIANDO STORED PROCEDURE PARA CONSULTAR VALORES NA TABELA "T_EC_DB_PRODUTO"
CREATE OR REPLACE PROCEDURE sp_consulta_produto
    (p_cd_produto       IN     t_ec_db_produto.cd_produto%TYPE,
     p_nm_produto       OUT    t_ec_db_produto.nm_produto%TYPE,
     p_dsc_produto      OUT    t_ec_db_produto.dsc_produto%TYPE,
     p_vl_produto       OUT    t_ec_db_produto.vl_produto%TYPE,
     p_dt_validade      OUT    t_ec_db_produto.dt_validade%TYPE,
     p_status           OUT    t_ec_db_produto.status%TYPE,
     p_cd_tipo_produto  OUT    t_ec_db_produto.cd_tipo_produto%TYPE,
     p_cd_usuario       OUT    t_ec_db_produto.cd_usuario%TYPE)
IS 
BEGIN
    SELECT nm_produto, dsc_produto, vl_produto, dt_validade, status, cd_tipo_produto, cd_usuario INTO
           p_nm_produto, p_dsc_produto, p_vl_produto, p_dt_validade, p_status, p_cd_tipo_produto, p_cd_usuario
    FROM t_ec_db_produto
    WHERE cd_produto  = p_cd_produto;
END sp_consulta_produto;
/

SET SERVEROUTPUT ON

DECLARE
     v_nm_produto           t_ec_db_produto.nm_produto%TYPE;
     v_dsc_produto          t_ec_db_produto.dsc_produto%TYPE;
     v_vl_produto           t_ec_db_produto.vl_produto%TYPE;
     v_dt_validade          t_ec_db_produto.dt_validade%TYPE;
     v_status               t_ec_db_produto.status%TYPE;
     v_cd_tipo_produto      t_ec_db_produto.cd_tipo_produto%TYPE;
     v_cd_usuario           t_ec_db_produto.cd_usuario%TYPE;
BEGIN
   sp_consulta_produto(5, v_nm_produto, v_dsc_produto, v_vl_produto, v_dt_validade, v_status, v_cd_tipo_produto, v_cd_usuario);
   DBMS_OUTPUT.PUT_LINE('NOME: ' || v_nm_produto);
   DBMS_OUTPUT.PUT_LINE('DESCRIÇÃO: ' || v_dsc_produto);
   DBMS_OUTPUT.PUT_LINE('VALOR: ' || v_vl_produto);
   DBMS_OUTPUT.PUT_LINE('DATA DE VALIDADE: ' || v_dt_validade);
   DBMS_OUTPUT.PUT_LINE('STATUS: ' || v_status);
   DBMS_OUTPUT.PUT_LINE('TIPO: ' || v_cd_tipo_produto);
   DBMS_OUTPUT.PUT_LINE('USUARIO: ' || v_cd_usuario);
END;
/
