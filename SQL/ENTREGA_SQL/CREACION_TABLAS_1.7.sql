--------------------------------------------------------
-- Archivo creado  - miércoles-abril-08-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table PIEZA
--------------------------------------------------------

  CREATE TABLE "X9627033"."PIEZA" 
   (	"CODPIE" VARCHAR2(3 BYTE), 
	"NOMPIE" VARCHAR2(10 BYTE), 
	"COLOR" VARCHAR2(10 BYTE), 
	"PESO" NUMBER(5,2), 
	"CIUDAD" VARCHAR2(15 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "BDCCIA" ;
--------------------------------------------------------
--  DDL for Table PROVEEDOR
--------------------------------------------------------

  CREATE TABLE "X9627033"."PROVEEDOR" 
   (	"CODPRO" VARCHAR2(3 BYTE), 
	"NOMPRO" VARCHAR2(30 BYTE), 
	"STATUS" NUMBER, 
	"CIUDAD" VARCHAR2(15 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "BDCCIA" ;
--------------------------------------------------------
--  DDL for Table PROYECTO
--------------------------------------------------------

  CREATE TABLE "X9627033"."PROYECTO" 
   (	"CODPJ" VARCHAR2(3 BYTE), 
	"NOMPJ" VARCHAR2(20 BYTE), 
	"CIUDAD" VARCHAR2(15 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "BDCCIA" ;
--------------------------------------------------------
--  DDL for Table VENTAS
--------------------------------------------------------

  CREATE TABLE "X9627033"."VENTAS" 
   (	"CODPRO" VARCHAR2(3 BYTE), 
	"CODPIE" VARCHAR2(3 BYTE), 
	"CODPJ" VARCHAR2(3 BYTE), 
	"CANTIDAD" NUMBER(4,0), 
	"FECHA" DATE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "BDCCIA" ;
REM INSERTING into X9627033.PIEZA
SET DEFINE OFF;
REM INSERTING into X9627033.PROVEEDOR
SET DEFINE OFF;
REM INSERTING into X9627033.PROYECTO
SET DEFINE OFF;
REM INSERTING into X9627033.VENTAS
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index CODPIE_CLAVE_PRIMARIA
--------------------------------------------------------

  CREATE UNIQUE INDEX "X9627033"."CODPIE_CLAVE_PRIMARIA" ON "X9627033"."PIEZA" ("CODPIE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "BDCCIA" ;
--------------------------------------------------------
--  DDL for Index CODPRO_CLAVE_PRIMARIA
--------------------------------------------------------

  CREATE UNIQUE INDEX "X9627033"."CODPRO_CLAVE_PRIMARIA" ON "X9627033"."PROVEEDOR" ("CODPRO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "BDCCIA" ;
--------------------------------------------------------
--  DDL for Index CODPJ_CLAVE_PRIMARIA
--------------------------------------------------------

  CREATE UNIQUE INDEX "X9627033"."CODPJ_CLAVE_PRIMARIA" ON "X9627033"."PROYECTO" ("CODPJ") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "BDCCIA" ;
--------------------------------------------------------
--  DDL for Index CLAVE_PRIMARIA
--------------------------------------------------------

  CREATE UNIQUE INDEX "X9627033"."CLAVE_PRIMARIA" ON "X9627033"."VENTAS" ("CODPRO", "CODPIE", "CODPJ") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "BDCCIA" ;
--------------------------------------------------------
--  Constraints for Table PIEZA
--------------------------------------------------------

  ALTER TABLE "X9627033"."PIEZA" ADD CONSTRAINT "CODPIE_CLAVE_PRIMARIA" PRIMARY KEY ("CODPIE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "BDCCIA"  ENABLE;
  ALTER TABLE "X9627033"."PIEZA" MODIFY ("NOMPIE" CONSTRAINT "NOMPIE_NO_NULO" NOT NULL ENABLE);
  ALTER TABLE "X9627033"."PIEZA" ADD CONSTRAINT "PESO_ENTRE_0_Y_100" CHECK (peso>0 and peso<=100) ENABLE;
--------------------------------------------------------
--  Constraints for Table PROVEEDOR
--------------------------------------------------------

  ALTER TABLE "X9627033"."PROVEEDOR" ADD CONSTRAINT "CODPRO_CLAVE_PRIMARIA" PRIMARY KEY ("CODPRO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "BDCCIA"  ENABLE;
  ALTER TABLE "X9627033"."PROVEEDOR" MODIFY ("CODPRO" CONSTRAINT "CODPRO_NO_NULO" NOT NULL ENABLE);
  ALTER TABLE "X9627033"."PROVEEDOR" MODIFY ("NOMPRO" CONSTRAINT "NOMPRO_NO_NULO" NOT NULL ENABLE);
  ALTER TABLE "X9627033"."PROVEEDOR" ADD CONSTRAINT "STATUS_ENTRE_1_Y_10" CHECK (status>=1 and status<=10) ENABLE;
--------------------------------------------------------
--  Constraints for Table PROYECTO
--------------------------------------------------------

  ALTER TABLE "X9627033"."PROYECTO" ADD CONSTRAINT "CODPJ_CLAVE_PRIMARIA" PRIMARY KEY ("CODPJ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "BDCCIA"  ENABLE;
  ALTER TABLE "X9627033"."PROYECTO" MODIFY ("NOMPJ" CONSTRAINT "NOMPJ_NO_NULO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table VENTAS
--------------------------------------------------------

  ALTER TABLE "X9627033"."VENTAS" ADD CONSTRAINT "CLAVE_PRIMARIA" PRIMARY KEY ("CODPRO", "CODPIE", "CODPJ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "BDCCIA"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table VENTAS
--------------------------------------------------------

  ALTER TABLE "X9627033"."VENTAS" ADD CONSTRAINT "CODPIE_CLAVE_EXTERNA_PIEZA" FOREIGN KEY ("CODPIE")
	  REFERENCES "X9627033"."PIEZA" ("CODPIE") ENABLE;
  ALTER TABLE "X9627033"."VENTAS" ADD CONSTRAINT "CODPJ_CLAVE_EXTERNA_PROYECTO" FOREIGN KEY ("CODPJ")
	  REFERENCES "X9627033"."PROYECTO" ("CODPJ") ENABLE;
  ALTER TABLE "X9627033"."VENTAS" ADD CONSTRAINT "CODPRO_CLAVE_EXTERNA_PROVEEDOR" FOREIGN KEY ("CODPRO")
	  REFERENCES "X9627033"."PROVEEDOR" ("CODPRO") ENABLE;
