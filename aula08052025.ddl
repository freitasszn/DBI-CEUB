-- Gerado por Oracle SQL Developer Data Modeler 21.1.0.092.1221
--   em:        2025-05-08 20:29:58 BRT
--   site:      SQL Server 2012
--   tipo:      SQL Server 2012



CREATE TABLE Clientes 
    (
     Clientes_ID NUMERIC (28) NOT NULL IDENTITY NOT FOR REPLICATION , 
     nomeCliente VARCHAR (60) NOT NULL , 
     EnderecoCliente_cpfCliente VARCHAR (20) NOT NULL , 
     EnderecoCliente_logradouroEnderecoCliente VARCHAR (100) NOT NULL , 
     EnderecoCliente_nroEnderecoCliente VARCHAR (10) NOT NULL 
    )
GO 

    


CREATE UNIQUE NONCLUSTERED INDEX 
    Clientes__IDX ON Clientes 
    ( 
     EnderecoCliente_cpfCliente , 
     EnderecoCliente_logradouroEnderecoCliente , 
     EnderecoCliente_nroEnderecoCliente 
    ) 
GO

ALTER TABLE Clientes ADD CONSTRAINT Clientes_PK PRIMARY KEY CLUSTERED (Clientes_ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE EmailCliente 
    (
     cpfCliente VARCHAR (20) NOT NULL , 
     emailCliente VARCHAR (100) NOT NULL , 
     Clientes_Clientes_ID NUMERIC (28) NOT NULL 
    )
GO

ALTER TABLE EmailCliente ADD CONSTRAINT EmailCliente_PK PRIMARY KEY CLUSTERED (cpfCliente, emailCliente)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE EnderecoCliente 
    (
     cpfCliente VARCHAR (20) NOT NULL , 
     logradouroEnderecoCliente VARCHAR (100) NOT NULL , 
     nroEnderecoCliente VARCHAR (10) NOT NULL , 
     complementoEnderecoCliente VARCHAR (50) NOT NULL , 
     cidadeEnderecoCliente VARCHAR (50) NOT NULL , 
     ufEnderecoCliente CHAR (2) NOT NULL , 
     cepEnderecoCliente VARCHAR (10) NOT NULL , 
     Clientes_Clientes_ID NUMERIC (28) NOT NULL , 
     Clientes_Clientes_ID2 NUMERIC (28) NOT NULL 
    )
GO 

    


CREATE UNIQUE NONCLUSTERED INDEX 
    EnderecoCliente__IDX ON EnderecoCliente 
    ( 
     Clientes_Clientes_ID 
    ) 
GO 


CREATE UNIQUE NONCLUSTERED INDEX 
    EnderecoCliente__IDXv1 ON EnderecoCliente 
    ( 
     Clientes_Clientes_ID2 
    ) 
GO

ALTER TABLE EnderecoCliente ADD CONSTRAINT EnderecoCliente_PK PRIMARY KEY CLUSTERED (cpfCliente, logradouroEnderecoCliente, nroEnderecoCliente)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE itensPedidos 
    (
     numeroPedido UNKNOWN 
--  ERROR: Datatype UNKNOWN is not allowed 
                    NOT NULL , 
     codigoProduto UNKNOWN 
--  ERROR: Datatype UNKNOWN is not allowed 
                    NOT NULL , 
     nomeProduto VARCHAR (100) NOT NULL , 
     precoUnitarioProduto DECIMAL (2) NOT NULL , 
     quantidadeProduto UNKNOWN 
--  ERROR: Datatype UNKNOWN is not allowed 
                    NOT NULL , 
     Pedidos_nomeClientePedido VARCHAR (60) NOT NULL 
    )
GO

ALTER TABLE itensPedidos ADD CONSTRAINT itensPedidos_PK PRIMARY KEY CLUSTERED (numeroPedido, codigoProduto)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Pedidos 
    (
     nomeClientePedido VARCHAR (60) NOT NULL , 
     dataPedido DATE NOT NULL , 
     horaPedido TIME NOT NULL , 
     numeroPedido INTEGER NOT NULL , 
     Clientes_Clientes_ID NUMERIC (28) NOT NULL 
    )
GO

ALTER TABLE Pedidos ADD CONSTRAINT Pedidos_PK PRIMARY KEY CLUSTERED (nomeClientePedido)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE TelefoneCliente 
    (
     cpfCliente VARCHAR (20) NOT NULL , 
     telefoneCliente VARCHAR (20) NOT NULL , 
     tipoTelefoneCliente VARCHAR (20) NOT NULL , 
     Clientes_Clientes_ID NUMERIC (28) NOT NULL 
    )
GO

ALTER TABLE TelefoneCliente ADD CONSTRAINT TelefoneCliente_PK PRIMARY KEY CLUSTERED (cpfCliente, telefoneCliente)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

ALTER TABLE Clientes 
    ADD CONSTRAINT Clientes_EnderecoCliente_FK FOREIGN KEY 
    ( 
     EnderecoCliente_cpfCliente, 
     EnderecoCliente_logradouroEnderecoCliente, 
     EnderecoCliente_nroEnderecoCliente
    ) 
    REFERENCES EnderecoCliente 
    ( 
     cpfCliente , 
     logradouroEnderecoCliente , 
     nroEnderecoCliente 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE EmailCliente 
    ADD CONSTRAINT EmailCliente_Clientes_FK FOREIGN KEY 
    ( 
     Clientes_Clientes_ID
    ) 
    REFERENCES Clientes 
    ( 
     Clientes_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE EnderecoCliente 
    ADD CONSTRAINT EnderecoCliente_Clientes_FK FOREIGN KEY 
    ( 
     Clientes_Clientes_ID
    ) 
    REFERENCES Clientes 
    ( 
     Clientes_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE EnderecoCliente 
    ADD CONSTRAINT EnderecoCliente_Clientes_FKv2 FOREIGN KEY 
    ( 
     Clientes_Clientes_ID2
    ) 
    REFERENCES Clientes 
    ( 
     Clientes_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE itensPedidos 
    ADD CONSTRAINT itensPedidos_Pedidos_FK FOREIGN KEY 
    ( 
     Pedidos_nomeClientePedido
    ) 
    REFERENCES Pedidos 
    ( 
     nomeClientePedido 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Pedidos 
    ADD CONSTRAINT Pedidos_Clientes_FK FOREIGN KEY 
    ( 
     Clientes_Clientes_ID
    ) 
    REFERENCES Clientes 
    ( 
     Clientes_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE TelefoneCliente 
    ADD CONSTRAINT TelefoneCliente_Clientes_FK FOREIGN KEY 
    ( 
     Clientes_Clientes_ID
    ) 
    REFERENCES Clientes 
    ( 
     Clientes_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             3
-- ALTER TABLE                             13
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE SCHEMA                            0
-- CREATE SEQUENCE                          0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   3
-- WARNINGS                                 0
