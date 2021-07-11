--------------------------------------------------------
-- Archivo creado  - miércoles-abril-08-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table PLANTILLA
--------------------------------------------------------

  CREATE TABLE PLANTILLA
   (	"DNI" CHAR(8 BYTE), 
	"NOMBRE" VARCHAR2(15 BYTE), 
	"ESTADOCIVIL" VARCHAR2(10 BYTE), 
	"FECHAALTA" DATE, 
	"FECHABAJA" DATE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "BDCCIA" ;
--------------------------------------------------------
--  DDL for Table SERJEFE
--------------------------------------------------------

  CREATE TABLE SERJEFE
   (	"DNIJEFE" CHAR(8 BYTE), 
	"DNITRABAJADOR" CHAR(8 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "BDCCIA" ;
SET DEFINE OFF;
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index SYS_C00205462
--------------------------------------------------------

  CREATE UNIQUE INDEX SYS_C00205462 ON PLANTILLA ("DNI") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "BDCCIA" ;
--------------------------------------------------------
--  DDL for Index SYS_C00205463
--------------------------------------------------------

  CREATE UNIQUE INDEX SYS_C00205463 ON SERJEFE ("DNITRABAJADOR") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "BDCCIA" ;
--------------------------------------------------------
--  Constraints for Table PLANTILLA
--------------------------------------------------------

  ALTER TABLE PLANTILLA ADD CHECK (estadocivil IN ('soltero', 'casado', 'divorciado', 'viudo')) ENABLE;
  ALTER TABLE PLANTILLA ADD PRIMARY KEY ("DNI")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "BDCCIA"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SERJEFE
--------------------------------------------------------

  ALTER TABLE SERJEFE ADD PRIMARY KEY ("DNITRABAJADOR")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "BDCCIA"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SERJEFE
--------------------------------------------------------

  ALTER TABLE SERJEFE ADD FOREIGN KEY ("DNIJEFE")
	  REFERENCES PLANTILLA ("DNI") ENABLE;
  ALTER TABLE SERJEFE ADD FOREIGN KEY ("DNITRABAJADOR")
	  REFERENCES PLANTILLA ("DNI") ENABLE;
