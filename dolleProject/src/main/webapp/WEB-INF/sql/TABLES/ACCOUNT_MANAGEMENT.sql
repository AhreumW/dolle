--------------------------------------------------------
--  DDL for Table ACCOUNT_MANAGEMENT
--------------------------------------------------------

  CREATE TABLE "GZONE"."ACCOUNT_MANAGEMENT" 
   (	"ACC_IDX" NUMBER, 
	"TOWN_IDX" NUMBER, 
	"ACC_ACCOUNT_NUM" VARCHAR2(50 BYTE), 
	"ACC_BANK" VARCHAR2(50 BYTE), 
	"ACC_DEPOSITOR" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;