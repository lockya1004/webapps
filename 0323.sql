--------------------------------------------------------
--  督析戚 持失喫 - 榎推析-3杉-23-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CLIENTPROFILE
--------------------------------------------------------

  CREATE TABLE "PROJECT"."CLIENTPROFILE" 
   (	"NUM" NUMBER, 
	"ID" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(20 BYTE), 
	"KINDS" VARCHAR2(10 BYTE), 
	"ADDRESS" VARCHAR2(50 BYTE), 
	"IMAGE" VARCHAR2(50 BYTE), 
	"WRITEDATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "PROJECT"."MEMBER" 
   (	"NAME" VARCHAR2(30 BYTE), 
	"USERID" VARCHAR2(30 BYTE), 
	"PWD" VARCHAR2(20 BYTE), 
	"EMAIL" VARCHAR2(30 BYTE), 
	"PHONE" CHAR(13 BYTE), 
	"ADMIN" NUMBER(1,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MESSAGE
--------------------------------------------------------

  CREATE TABLE "PROJECT"."MESSAGE" 
   (	"NUM" NUMBER, 
	"FROMID" VARCHAR2(20 BYTE), 
	"TOID" VARCHAR2(20 BYTE), 
	"CONTENT" VARCHAR2(1000 BYTE), 
	"SENDTIME" DATE DEFAULT sysdate, 
	"READTIME" DATE, 
	"READORNOT" NUMBER DEFAULT 0, 
	"WASTE" NUMBER DEFAULT 0, 
	"KEEP" NUMBER DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table REQUEST
--------------------------------------------------------

  CREATE TABLE "PROJECT"."REQUEST" 
   (	"NUM" NUMBER, 
	"PASS" VARCHAR2(20 BYTE), 
	"USERID" VARCHAR2(30 BYTE), 
	"TITLE" VARCHAR2(30 BYTE), 
	"SOURCELANG" VARCHAR2(30 BYTE), 
	"TARGETLANG" VARCHAR2(30 BYTE), 
	"CONTENT" VARCHAR2(1000 BYTE), 
	"REFILE" VARCHAR2(100 BYTE), 
	"DEADLINE" DATE DEFAULT sysdate, 
	"CASH" NUMBER, 
	"READCOUNT" NUMBER DEFAULT 0, 
	"WRITEDATE" DATE DEFAULT sysdate, 
	"NOW" VARCHAR2(2 BYTE) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table SUPPORT
--------------------------------------------------------

  CREATE TABLE "PROJECT"."SUPPORT" 
   (	"NUM" NUMBER(5,0), 
	"TITLE" VARCHAR2(50 BYTE), 
	"KINDS" VARCHAR2(50 BYTE), 
	"ID" VARCHAR2(20 BYTE), 
	"PWD" VARCHAR2(20 BYTE), 
	"EMAIL" VARCHAR2(50 BYTE), 
	"CONTENT" VARCHAR2(1000 BYTE) DEFAULT NULL, 
	"ANSWERCOUNT" NUMBER(5,0) DEFAULT 0, 
	"WRITEDATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TRANSJOB
--------------------------------------------------------

  CREATE TABLE "PROJECT"."TRANSJOB" 
   (	"JOBNUM" NUMBER, 
	"JOBCONTENT" VARCHAR2(2000 BYTE), 
	"AGENTNAME" VARCHAR2(50 BYTE), 
	"JOBREGEDATE" DATE DEFAULT sysdate, 
	"JOBTYPE" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TRANSPROFILE
--------------------------------------------------------

  CREATE TABLE "PROJECT"."TRANSPROFILE" 
   (	"TRANS_NUM" NUMBER, 
	"TRANS_PICURL" VARCHAR2(50 BYTE), 
	"TRANS_SRC_LANGUAGE" VARCHAR2(20 BYTE), 
	"TRANS_AREA" VARCHAR2(40 BYTE), 
	"TRANS_PORTFOLIO" VARCHAR2(2000 BYTE), 
	"TRANS_NAME" VARCHAR2(20 BYTE), 
	"TRANS_ADDRESS" VARCHAR2(200 BYTE), 
	"TRANS_ID" VARCHAR2(30 BYTE), 
	"TRANS_PAYRATE" VARCHAR2(20 BYTE), 
	"TRANS_CONTACT" VARCHAR2(20 BYTE), 
	"TRANS_SOFTWARE" VARCHAR2(200 BYTE), 
	"TRANS_TARG_LANGUAGE" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table WEATHER
--------------------------------------------------------

  CREATE TABLE "PROJECT"."WEATHER" 
   (	"LOCATION" VARCHAR2(20 BYTE), 
	"TEMP" NUMBER, 
	"ICON" VARCHAR2(20 BYTE), 
	"D" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Sequence CP_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PROJECT"."CP_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 8 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence MESSAGE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PROJECT"."MESSAGE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 49 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PRODUCT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PROJECT"."PRODUCT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence RE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PROJECT"."RE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 8 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SUPPORT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PROJECT"."SUPPORT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 22 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TRANS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PROJECT"."TRANS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 12 NOCACHE  NOORDER  NOCYCLE ;
REM INSERTING into PROJECT.CLIENTPROFILE
SET DEFINE OFF;
Insert into PROJECT.CLIENTPROFILE (NUM,ID,NAME,KINDS,ADDRESS,IMAGE,WRITEDATE) values (7,'somi','戚社耕','鯵昔','採至','coffee-cup-1252671_12802.jpg',to_date('18/03/13','RR/MM/DD'));
Insert into PROJECT.CLIENTPROFILE (NUM,ID,NAME,KINDS,ADDRESS,IMAGE,WRITEDATE) values (2,'admin','戚社耕','鯵昔','aaaaaaffffff','coffee-cup-1252671_12801.jpg',to_date('18/02/09','RR/MM/DD'));
Insert into PROJECT.CLIENTPROFILE (NUM,ID,NAME,KINDS,ADDRESS,IMAGE,WRITEDATE) values (4,null,'ddddd','鯵昔','aaasf','紬虞左傾戚芝3.jpg',to_date('18/02/09','RR/MM/DD'));
Insert into PROJECT.CLIENTPROFILE (NUM,ID,NAME,KINDS,ADDRESS,IMAGE,WRITEDATE) values (5,null,'ddddd','鯵昔','aaasf','薄仙 git 失因1.jpg',to_date('18/02/09','RR/MM/DD'));
Insert into PROJECT.CLIENTPROFILE (NUM,ID,NAME,KINDS,ADDRESS,IMAGE,WRITEDATE) values (6,'somi','戚社耕','鯵昔','採至','CUP.jpg',to_date('18/03/12','RR/MM/DD'));
REM INSERTING into PROJECT.MEMBER
SET DEFINE OFF;
Insert into PROJECT.MEMBER (NAME,USERID,PWD,EMAIL,PHONE,ADMIN) values ('戚社耕','somi','1234','gmd@naver.com','010-2362-5157',0);
Insert into PROJECT.MEMBER (NAME,USERID,PWD,EMAIL,PHONE,ADMIN) values ('沿企井','kdg88612','1234','kdg88612@naver.com','010-8606-8165',0);
Insert into PROJECT.MEMBER (NAME,USERID,PWD,EMAIL,PHONE,ADMIN) values ('沿曽鉢','kgh89209','1234','kgh89209@naver.com','010-1234-1234',0);
Insert into PROJECT.MEMBER (NAME,USERID,PWD,EMAIL,PHONE,ADMIN) values ('admin','admin','1234','admin','000-0000-0000',2);
REM INSERTING into PROJECT.MESSAGE
SET DEFINE OFF;
Insert into PROJECT.MESSAGE (NUM,FROMID,TOID,CONTENT,SENDTIME,READTIME,READORNOT,WASTE,KEEP) values (23,'admin','admin','151213213',to_date('18/03/19','RR/MM/DD'),null,0,0,0);
Insert into PROJECT.MESSAGE (NUM,FROMID,TOID,CONTENT,SENDTIME,READTIME,READORNOT,WASTE,KEEP) values (39,'admin','admin','2222222',to_date('18/03/19','RR/MM/DD'),null,0,0,0);
Insert into PROJECT.MESSAGE (NUM,FROMID,TOID,CONTENT,SENDTIME,READTIME,READORNOT,WASTE,KEEP) values (22,'admin','admin','2132654321321',to_date('18/03/19','RR/MM/DD'),to_date('18/03/19','RR/MM/DD'),1,0,0);
Insert into PROJECT.MESSAGE (NUM,FROMID,TOID,CONTENT,SENDTIME,READTIME,READORNOT,WASTE,KEEP) values (41,'admin','admin','kjhkjhukjh',to_date('18/03/19','RR/MM/DD'),null,0,0,0);
Insert into PROJECT.MESSAGE (NUM,FROMID,TOID,CONTENT,SENDTIME,READTIME,READORNOT,WASTE,KEEP) values (44,'admin','admin','lkjlkjlkjlkjlkj',to_date('18/03/19','RR/MM/DD'),to_date('18/03/20','RR/MM/DD'),1,0,0);
Insert into PROJECT.MESSAGE (NUM,FROMID,TOID,CONTENT,SENDTIME,READTIME,READORNOT,WASTE,KEEP) values (47,'admin','admin','神潅馬欠...毘級陥.......',to_date('18/03/20','RR/MM/DD'),null,0,0,0);
Insert into PROJECT.MESSAGE (NUM,FROMID,TOID,CONTENT,SENDTIME,READTIME,READORNOT,WASTE,KEEP) values (35,'admin','admin','馬馬馬馬馬馬',to_date('18/03/19','RR/MM/DD'),null,0,0,0);
Insert into PROJECT.MESSAGE (NUM,FROMID,TOID,CONTENT,SENDTIME,READTIME,READORNOT,WASTE,KEEP) values (40,'admin','admin','151121521321',to_date('18/03/19','RR/MM/DD'),to_date('18/03/21','RR/MM/DD'),1,1,0);
Insert into PROJECT.MESSAGE (NUM,FROMID,TOID,CONTENT,SENDTIME,READTIME,READORNOT,WASTE,KEEP) values (37,'admin','admin','校猿推~?
',to_date('18/03/19','RR/MM/DD'),null,0,0,0);
Insert into PROJECT.MESSAGE (NUM,FROMID,TOID,CONTENT,SENDTIME,READTIME,READORNOT,WASTE,KEEP) values (42,'admin','admin','kjhkjhuhkhkj',to_date('18/03/19','RR/MM/DD'),null,0,0,0);
Insert into PROJECT.MESSAGE (NUM,FROMID,TOID,CONTENT,SENDTIME,READTIME,READORNOT,WASTE,KEEP) values (45,'admin','admin','kljlkjlkjljljk',to_date('18/03/19','RR/MM/DD'),to_date('18/03/21','RR/MM/DD'),1,1,0);
Insert into PROJECT.MESSAGE (NUM,FROMID,TOID,CONTENT,SENDTIME,READTIME,READORNOT,WASTE,KEEP) values (31,'admin','admin','jklkjlklkmn,n,njkhh',to_date('18/03/19','RR/MM/DD'),null,0,0,0);
Insert into PROJECT.MESSAGE (NUM,FROMID,TOID,CONTENT,SENDTIME,READTIME,READORNOT,WASTE,KEEP) values (34,'admin','admin','kjlkjlkj',to_date('18/03/19','RR/MM/DD'),null,0,0,0);
Insert into PROJECT.MESSAGE (NUM,FROMID,TOID,CONTENT,SENDTIME,READTIME,READORNOT,WASTE,KEEP) values (38,'admin','admin','更走???',to_date('18/03/19','RR/MM/DD'),null,0,0,0);
Insert into PROJECT.MESSAGE (NUM,FROMID,TOID,CONTENT,SENDTIME,READTIME,READORNOT,WASTE,KEEP) values (43,'admin','admin','jkhkjhkjhk',to_date('18/03/19','RR/MM/DD'),null,0,0,1);
Insert into PROJECT.MESSAGE (NUM,FROMID,TOID,CONTENT,SENDTIME,READTIME,READORNOT,WASTE,KEEP) values (48,'admin','admin','焼戚酔拭神',to_date('18/03/20','RR/MM/DD'),to_date('18/03/21','RR/MM/DD'),1,0,0);
Insert into PROJECT.MESSAGE (NUM,FROMID,TOID,CONTENT,SENDTIME,READTIME,READORNOT,WASTE,KEEP) values (32,'admin','admin','ljlkjlkjljk',to_date('18/03/19','RR/MM/DD'),null,0,0,0);
Insert into PROJECT.MESSAGE (NUM,FROMID,TOID,CONTENT,SENDTIME,READTIME,READORNOT,WASTE,KEEP) values (36,'admin','admin','更走????',to_date('18/03/19','RR/MM/DD'),to_date('18/03/20','RR/MM/DD'),1,0,0);
Insert into PROJECT.MESSAGE (NUM,FROMID,TOID,CONTENT,SENDTIME,READTIME,READORNOT,WASTE,KEEP) values (33,'admin','admin','kjhkjhkjh',to_date('18/03/19','RR/MM/DD'),null,0,0,0);
Insert into PROJECT.MESSAGE (NUM,FROMID,TOID,CONTENT,SENDTIME,READTIME,READORNOT,WASTE,KEEP) values (46,'admin','admin','Wkwmd!!!!!!!!

促装貝!!!!',to_date('18/03/19','RR/MM/DD'),to_date('18/03/21','RR/MM/DD'),1,1,0);
REM INSERTING into PROJECT.REQUEST
SET DEFINE OFF;
Insert into PROJECT.REQUEST (NUM,PASS,USERID,TITLE,SOURCELANG,TARGETLANG,CONTENT,REFILE,DEADLINE,CASH,READCOUNT,WRITEDATE,NOW) values (5,'1234','admin','砺什闘','82','81','税軽杯艦陥',null,to_date('18/03/22','RR/MM/DD'),10000,20,to_date('18/03/22','RR/MM/DD'),'0');
Insert into PROJECT.REQUEST (NUM,PASS,USERID,TITLE,SOURCELANG,TARGETLANG,CONTENT,REFILE,DEADLINE,CASH,READCOUNT,WRITEDATE,NOW) values (6,'1234','admin','1111','11','14','123',null,to_date('17/12/03','RR/MM/DD'),1000,0,to_date('18/03/22','RR/MM/DD'),'0');
Insert into PROJECT.REQUEST (NUM,PASS,USERID,TITLE,SOURCELANG,TARGETLANG,CONTENT,REFILE,DEADLINE,CASH,READCOUNT,WRITEDATE,NOW) values (7,'1234','admin','55555','4','11','123456',null,to_date('17/12/03','RR/MM/DD'),1000,2,to_date('18/03/22','RR/MM/DD'),'0');
REM INSERTING into PROJECT.SUPPORT
SET DEFINE OFF;
Insert into PROJECT.SUPPORT (NUM,TITLE,KINDS,ID,PWD,EMAIL,CONTENT,ANSWERCOUNT,WRITEDATE) values (18,'aaa',null,'admin',null,null,'asdfasdfasdfasdf',0,to_date('18/02/08','RR/MM/DD'));
Insert into PROJECT.SUPPORT (NUM,TITLE,KINDS,ID,PWD,EMAIL,CONTENT,ANSWERCOUNT,WRITEDATE) values (21,'dsfasdfasdf','焼戚巨/搾腔腰硲達奄','admin','dfsasdf','asdfasdf','sdfasdfasf',0,to_date('18/02/09','RR/MM/DD'));
REM INSERTING into PROJECT.TRANSJOB
SET DEFINE OFF;
Insert into PROJECT.TRANSJOB (JOBNUM,JOBCONTENT,AGENTNAME,JOBREGEDATE,JOBTYPE) values (8,'hello','test',to_date('18/02/10','RR/MM/DD'),'腰蝕');
REM INSERTING into PROJECT.TRANSPROFILE
SET DEFINE OFF;
Insert into PROJECT.TRANSPROFILE (TRANS_NUM,TRANS_PICURL,TRANS_SRC_LANGUAGE,TRANS_AREA,TRANS_PORTFOLIO,TRANS_NAME,TRANS_ADDRESS,TRANS_ID,TRANS_PAYRATE,TRANS_CONTACT,TRANS_SOFTWARE,TRANS_TARG_LANGUAGE) values (2,null,'191','けけ','aaa','沿','採至','admin','1111','010','けけ','11');
Insert into PROJECT.TRANSPROFILE (TRANS_NUM,TRANS_PICURL,TRANS_SRC_LANGUAGE,TRANS_AREA,TRANS_PORTFOLIO,TRANS_NAME,TRANS_ADDRESS,TRANS_ID,TRANS_PAYRATE,TRANS_CONTACT,TRANS_SOFTWARE,TRANS_TARG_LANGUAGE) values (3,null,'191','けけ','aaa','沿','採至','admin','1111','010','けけ','11');
Insert into PROJECT.TRANSPROFILE (TRANS_NUM,TRANS_PICURL,TRANS_SRC_LANGUAGE,TRANS_AREA,TRANS_PORTFOLIO,TRANS_NAME,TRANS_ADDRESS,TRANS_ID,TRANS_PAYRATE,TRANS_CONTACT,TRANS_SOFTWARE,TRANS_TARG_LANGUAGE) values (4,'Screenshot_23.jpg','194','けけ',' ','沿ss','採至','admin','1111','010','けけ','4');
Insert into PROJECT.TRANSPROFILE (TRANS_NUM,TRANS_PICURL,TRANS_SRC_LANGUAGE,TRANS_AREA,TRANS_PORTFOLIO,TRANS_NAME,TRANS_ADDRESS,TRANS_ID,TRANS_PAYRATE,TRANS_CONTACT,TRANS_SOFTWARE,TRANS_TARG_LANGUAGE) values (5,'Screenshot_31.jpg','Arabic','けけ',' ','沿ss','採至','123456','1111','010','けけ','Basque');
Insert into PROJECT.TRANSPROFILE (TRANS_NUM,TRANS_PICURL,TRANS_SRC_LANGUAGE,TRANS_AREA,TRANS_PORTFOLIO,TRANS_NAME,TRANS_ADDRESS,TRANS_ID,TRANS_PAYRATE,TRANS_CONTACT,TRANS_SOFTWARE,TRANS_TARG_LANGUAGE) values (11,'急檎.jpg','Aramaic','123',' 123','admin','aa','admin','123','010','123','Avestan');
REM INSERTING into PROJECT.WEATHER
SET DEFINE OFF;
Insert into PROJECT.WEATHER (LOCATION,TEMP,ICON,D) values ('Daegu',15,'01d',to_date('18/03/23','RR/MM/DD'));
Insert into PROJECT.WEATHER (LOCATION,TEMP,ICON,D) values ('Incheon',11,'50d',to_date('18/03/23','RR/MM/DD'));
Insert into PROJECT.WEATHER (LOCATION,TEMP,ICON,D) values ('Gwangju',10,'02d',to_date('18/03/23','RR/MM/DD'));
Insert into PROJECT.WEATHER (LOCATION,TEMP,ICON,D) values ('Daejeon',14,'01d',to_date('18/03/23','RR/MM/DD'));
Insert into PROJECT.WEATHER (LOCATION,TEMP,ICON,D) values ('Ulsan',12,'01d',to_date('18/03/23','RR/MM/DD'));
Insert into PROJECT.WEATHER (LOCATION,TEMP,ICON,D) values ('Jeju',10,'01d',to_date('18/03/23','RR/MM/DD'));
Insert into PROJECT.WEATHER (LOCATION,TEMP,ICON,D) values ('Seoul',11,'50d',to_date('18/03/23','RR/MM/DD'));
Insert into PROJECT.WEATHER (LOCATION,TEMP,ICON,D) values ('Busan',12,'01d',to_date('18/03/23','RR/MM/DD'));
--------------------------------------------------------
--  DDL for Index CLIENTPROFILE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PROJECT"."CLIENTPROFILE_PK" ON "PROJECT"."CLIENTPROFILE" ("NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MEMBER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PROJECT"."MEMBER_PK" ON "PROJECT"."MEMBER" ("USERID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SUPPORT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PROJECT"."SUPPORT_PK" ON "PROJECT"."SUPPORT" ("NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TRANSJOB_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PROJECT"."TRANSJOB_PK" ON "PROJECT"."TRANSJOB" ("JOBNUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TRANSPROFILE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PROJECT"."TRANSPROFILE_PK" ON "PROJECT"."TRANSPROFILE" ("TRANS_ID", "TRANS_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Procedure PRINT_TABLE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "PROJECT"."PRINT_TABLE" ( p_query in varchar2 )
AUTHID CURRENT_USER
is
    l_theCursor     integer default dbms_sql.open_cursor;
    l_columnValue   varchar2(4000);
    l_status        integer;
    l_descTbl       dbms_sql.desc_tab;
    l_colCnt        number;
begin
    execute immediate
    'alter session set
        nls_date_format=''yyyy-mm-dd:hh24:mi:ss'' ';
    dbms_sql.parse(  l_theCursor,  p_query, dbms_sql.native );
    dbms_sql.describe_columns
    ( l_theCursor, l_colCnt, l_descTbl );
    for i in 1 .. l_colCnt loop
        dbms_sql.define_column
        (l_theCursor, i, l_columnValue, 4000);
    end loop;
    l_status := dbms_sql.execute(l_theCursor);
    while ( dbms_sql.fetch_rows(l_theCursor) > 0 ) loop
        for i in 1 .. l_colCnt loop
            dbms_sql.column_value
            ( l_theCursor, i, l_columnValue );
            dbms_output.put_line
            ( rpad( l_descTbl(i).col_name, 30 )
              || ': ' ||
              l_columnValue );
        end loop;
        dbms_output.put_line( '-----------------' );
    end loop;
    execute immediate
        'alter session set nls_date_format=''yyyy-mm-dd'' ';
exception
    when others then
      execute immediate
          'alter session set nls_date_format=''yyyy-mm-dd'' ';
      raise;
end;

/
--------------------------------------------------------
--  Constraints for Table CLIENTPROFILE
--------------------------------------------------------

  ALTER TABLE "PROJECT"."CLIENTPROFILE" ADD CONSTRAINT "CLIENTPROFILE_PK" PRIMARY KEY ("NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "PROJECT"."CLIENTPROFILE" MODIFY ("NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "PROJECT"."MEMBER" MODIFY ("USERID" NOT NULL ENABLE);
  ALTER TABLE "PROJECT"."MEMBER" ADD CONSTRAINT "MEMBER_PK" PRIMARY KEY ("USERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MESSAGE
--------------------------------------------------------

  ALTER TABLE "PROJECT"."MESSAGE" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "PROJECT"."MESSAGE" MODIFY ("TOID" NOT NULL ENABLE);
  ALTER TABLE "PROJECT"."MESSAGE" MODIFY ("FROMID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REQUEST
--------------------------------------------------------

  ALTER TABLE "PROJECT"."REQUEST" MODIFY ("NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SUPPORT
--------------------------------------------------------

  ALTER TABLE "PROJECT"."SUPPORT" MODIFY ("NUM" NOT NULL ENABLE);
  ALTER TABLE "PROJECT"."SUPPORT" ADD CONSTRAINT "SUPPORT_PK" PRIMARY KEY ("NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TRANSJOB
--------------------------------------------------------

  ALTER TABLE "PROJECT"."TRANSJOB" MODIFY ("JOBNUM" NOT NULL ENABLE);
  ALTER TABLE "PROJECT"."TRANSJOB" ADD CONSTRAINT "TRANSJOB_PK" PRIMARY KEY ("JOBNUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TRANSPROFILE
--------------------------------------------------------

  ALTER TABLE "PROJECT"."TRANSPROFILE" MODIFY ("TRANS_PAYRATE" NOT NULL ENABLE);
  ALTER TABLE "PROJECT"."TRANSPROFILE" MODIFY ("TRANS_ID" NOT NULL ENABLE);
  ALTER TABLE "PROJECT"."TRANSPROFILE" MODIFY ("TRANS_NAME" NOT NULL ENABLE);
  ALTER TABLE "PROJECT"."TRANSPROFILE" ADD CONSTRAINT "TRANSPROFILE_PK" PRIMARY KEY ("TRANS_ID", "TRANS_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "PROJECT"."TRANSPROFILE" MODIFY ("TRANS_NUM" NOT NULL ENABLE);
