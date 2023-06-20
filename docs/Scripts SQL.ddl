-- Gerado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   em:        2023-05-28 23:29:13 BRT
--   site:      Oracle Database 21c
--   tipo:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE t_conta (
    id_conta         INTEGER NOT NULL,
    num_conta        INTEGER,
    t_login_id_login INTEGER NOT NULL
);

CREATE UNIQUE INDEX t_conta__idx ON
    t_conta (
        t_login_id_login
    ASC );

ALTER TABLE t_conta ADD CONSTRAINT t_conta_pk PRIMARY KEY ( id_conta );

CREATE TABLE t_endereco (
    id_endereco          INTEGER NOT NULL,
    lg_endereco          VARCHAR2(100) NOT NULL,
    num_endereco         INTEGER NOT NULL,
    cmp_endereco         VARCHAR2(10),
    bai_endereco         VARCHAR2(40),
    cid_endereco         VARCHAR2(50) NOT NULL,
    est_endereco         VARCHAR2(30) NOT NULL,
    cep_endereco         INTEGER NOT NULL,
    t_usuario_id_usuario INTEGER NOT NULL
);

ALTER TABLE t_endereco ADD CONSTRAINT t_endereco_pk PRIMARY KEY ( id_endereco );

CREATE TABLE t_gasto (
    id_gasto         INTEGER NOT NULL,
    val_gasto        INTEGER NOT NULL,
    dt_gasto         DATE NOT NULL,
    des_gasto        VARCHAR2(100),
    cat_gasto        VARCHAR2(50) NOT NULL,
    t_conta_id_conta INTEGER NOT NULL
);

ALTER TABLE t_gasto ADD CONSTRAINT t_gasto_pk PRIMARY KEY ( id_gasto );

CREATE TABLE t_investimento (
    id_investimento  INTEGER NOT NULL,
    tip_investimento VARCHAR2(50) NOT NULL,
    val_investimento INTEGER NOT NULL,
    dt_investimento  DATE NOT NULL,
    des_investimento VARCHAR2(100),
    t_conta_id_conta INTEGER NOT NULL
);

ALTER TABLE t_investimento ADD CONSTRAINT t_investimento_pk PRIMARY KEY ( id_investimento );

CREATE TABLE t_login (
    id_login             INTEGER NOT NULL,
    eml_login            VARCHAR2(100) NOT NULL,
    sen_login            VARCHAR2(50) NOT NULL,
    t_usuario_id_usuario INTEGER NOT NULL
);

CREATE UNIQUE INDEX t_login__idx ON
    t_login (
        t_usuario_id_usuario
    ASC );

ALTER TABLE t_login ADD CONSTRAINT t_login_pk PRIMARY KEY ( id_login );

CREATE TABLE t_pix (
    id_pix                       INTEGER NOT NULL,
    tip_pix                      VARCHAR2(15) NOT NULL,
    chv_pix                      VARCHAR2(100) NOT NULL,
    t_conta_id_conta             INTEGER NOT NULL,
    t_recebimento_id_recebimento INTEGER NOT NULL
);

ALTER TABLE t_pix ADD CONSTRAINT t_pix_pk PRIMARY KEY ( id_pix );

CREATE TABLE t_recebimento (
    id_recebimento   INTEGER NOT NULL,
    val_recebimento  INTEGER NOT NULL,
    dt_recebimento   DATE NOT NULL,
    des_recebimento  VARCHAR2(100),
    t_conta_id_conta INTEGER NOT NULL
);

ALTER TABLE t_recebimento ADD CONSTRAINT t_recebimento_pk PRIMARY KEY ( id_recebimento );

CREATE TABLE t_telefone (
    id_telefone          INTEGER NOT NULL,
    num_telefone         INTEGER NOT NULL,
    tip_telefone         VARCHAR2(15),
    t_usuario_id_usuario INTEGER NOT NULL
);

ALTER TABLE t_telefone ADD CONSTRAINT t_telefone_pk PRIMARY KEY ( id_telefone );

CREATE TABLE t_usuario (
    id_usuario  INTEGER NOT NULL,
    nm_usuario  VARCHAR2(100) NOT NULL,
    cpf_usuario INTEGER NOT NULL
);

ALTER TABLE t_usuario ADD CONSTRAINT t_usuario_pk PRIMARY KEY ( id_usuario );

ALTER TABLE t_conta
    ADD CONSTRAINT t_conta_t_login_fk FOREIGN KEY ( t_login_id_login )
        REFERENCES t_login ( id_login );

ALTER TABLE t_endereco
    ADD CONSTRAINT t_endereco_t_usuario_fk FOREIGN KEY ( t_usuario_id_usuario )
        REFERENCES t_usuario ( id_usuario );

ALTER TABLE t_gasto
    ADD CONSTRAINT t_gasto_t_conta_fk FOREIGN KEY ( t_conta_id_conta )
        REFERENCES t_conta ( id_conta );

ALTER TABLE t_investimento
    ADD CONSTRAINT t_investimento_t_conta_fk FOREIGN KEY ( t_conta_id_conta )
        REFERENCES t_conta ( id_conta );

ALTER TABLE t_login
    ADD CONSTRAINT t_login_t_usuario_fk FOREIGN KEY ( t_usuario_id_usuario )
        REFERENCES t_usuario ( id_usuario );

ALTER TABLE t_pix
    ADD CONSTRAINT t_pix_t_conta_fk FOREIGN KEY ( t_conta_id_conta )
        REFERENCES t_conta ( id_conta );

ALTER TABLE t_pix
    ADD CONSTRAINT t_pix_t_recebimento_fk FOREIGN KEY ( t_recebimento_id_recebimento )
        REFERENCES t_recebimento ( id_recebimento );

ALTER TABLE t_recebimento
    ADD CONSTRAINT t_recebimento_t_conta_fk FOREIGN KEY ( t_conta_id_conta )
        REFERENCES t_conta ( id_conta );

ALTER TABLE t_telefone
    ADD CONSTRAINT t_telefone_t_usuario_fk FOREIGN KEY ( t_usuario_id_usuario )
        REFERENCES t_usuario ( id_usuario );

CREATE SEQUENCE t_conta_id_conta_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER t_conta_id_conta_trg BEFORE
    INSERT ON t_conta
    FOR EACH ROW
    WHEN ( new.id_conta IS NULL )
BEGIN
    :new.id_conta := t_conta_id_conta_seq.nextval;
END;
/

CREATE SEQUENCE t_endereco_id_endereco_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER t_endereco_id_endereco_trg BEFORE
    INSERT ON t_endereco
    FOR EACH ROW
    WHEN ( new.id_endereco IS NULL )
BEGIN
    :new.id_endereco := t_endereco_id_endereco_seq.nextval;
END;
/

CREATE SEQUENCE t_gasto_id_gasto_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER t_gasto_id_gasto_trg BEFORE
    INSERT ON t_gasto
    FOR EACH ROW
    WHEN ( new.id_gasto IS NULL )
BEGIN
    :new.id_gasto := t_gasto_id_gasto_seq.nextval;
END;
/

CREATE SEQUENCE t_investimento_id_investimento START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER t_investimento_id_investimento BEFORE
    INSERT ON t_investimento
    FOR EACH ROW
    WHEN ( new.id_investimento IS NULL )
BEGIN
    :new.id_investimento := t_investimento_id_investimento.nextval;
END;
/

CREATE SEQUENCE t_login_id_login_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER t_login_id_login_trg BEFORE
    INSERT ON t_login
    FOR EACH ROW
    WHEN ( new.id_login IS NULL )
BEGIN
    :new.id_login := t_login_id_login_seq.nextval;
END;
/

CREATE SEQUENCE t_pix_id_pix_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER t_pix_id_pix_trg BEFORE
    INSERT ON t_pix
    FOR EACH ROW
    WHEN ( new.id_pix IS NULL )
BEGIN
    :new.id_pix := t_pix_id_pix_seq.nextval;
END;
/

CREATE SEQUENCE t_recebimento_id_recebimento START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER t_recebimento_id_recebimento BEFORE
    INSERT ON t_recebimento
    FOR EACH ROW
    WHEN ( new.id_recebimento IS NULL )
BEGIN
    :new.id_recebimento := t_recebimento_id_recebimento.nextval;
END;
/

CREATE SEQUENCE t_telefone_id_telefone_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER t_telefone_id_telefone_trg BEFORE
    INSERT ON t_telefone
    FOR EACH ROW
    WHEN ( new.id_telefone IS NULL )
BEGIN
    :new.id_telefone := t_telefone_id_telefone_seq.nextval;
END;
/

CREATE SEQUENCE t_usuario_id_usuario_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER t_usuario_id_usuario_trg BEFORE
    INSERT ON t_usuario
    FOR EACH ROW
    WHEN ( new.id_usuario IS NULL )
BEGIN
    :new.id_usuario := t_usuario_id_usuario_seq.nextval;
END;
/



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             9
-- CREATE INDEX                             2
-- ALTER TABLE                             18
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           9
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          9
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
