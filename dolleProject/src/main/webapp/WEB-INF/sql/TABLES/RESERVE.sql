--------------------------------------------------------
--  DDL for Table RESERVE
--------------------------------------------------------

  CREATE TABLE "GZONE"."RESERVE" 
   (	"RESERVE_IDX" NUMBER, 
	"TOUR_IDX" NUMBER, 
	"MEMBER_IDX" NUMBER, 
	"RESERVE_TOUR_DATE" DATE DEFAULT SYSDATE, 
	"RESERVE_APPLY_NUM" NUMBER DEFAULT 0, 
	"RESERVE_PRICE" NUMBER DEFAULT 0, 
	"RESERVE_APPLY_DATE" DATE DEFAULT SYSDATE, 
	"RESERVE_DEPOSIT_DATE" DATE, 
	"RESERVE_DEPOSIT_STATE" VARCHAR2(10 BYTE) DEFAULT 'standby'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "GZONE"."RESERVE"."RESERVE_IDX" IS '예약번호';
   COMMENT ON COLUMN "GZONE"."RESERVE"."TOUR_IDX" IS '투어번호';
   COMMENT ON COLUMN "GZONE"."RESERVE"."MEMBER_IDX" IS '회원번호';
   COMMENT ON COLUMN "GZONE"."RESERVE"."RESERVE_TOUR_DATE" IS '투어일';
   COMMENT ON COLUMN "GZONE"."RESERVE"."RESERVE_APPLY_NUM" IS '신청인원수';
   COMMENT ON COLUMN "GZONE"."RESERVE"."RESERVE_APPLY_DATE" IS '신청일';
   COMMENT ON COLUMN "GZONE"."RESERVE"."RESERVE_DEPOSIT_DATE" IS '입금일';
   COMMENT ON COLUMN "GZONE"."RESERVE"."RESERVE_DEPOSIT_STATE" IS '입금상태';
   COMMENT ON TABLE "GZONE"."RESERVE"  IS '예약 테이블';
