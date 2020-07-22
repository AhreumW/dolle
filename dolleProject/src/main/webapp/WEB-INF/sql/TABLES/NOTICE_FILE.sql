--------------------------------------------------------
--  DDL for Table NOTICE_FILE
--------------------------------------------------------

  CREATE TABLE "GZONE"."NOTICE_FILE" 
   (	"NOTICE_FILE_IDX" NUMBER, 
	"NOTICE_IDX" NUMBER, 
	"NOTICE_ORIGINAL_FILE_NAME" VARCHAR2(300 BYTE), 
	"NOTICE_STORED_FILE_NAME" VARCHAR2(300 BYTE), 
	"NOTICE_FILE_SIZE" NUMBER DEFAULT 0, 
	"NOTICE_FILE_CRE_DATE" DATE DEFAULT SYSDATE, 
	"NOTICE_FILE_MOD_DATE" DATE DEFAULT SYSDATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;