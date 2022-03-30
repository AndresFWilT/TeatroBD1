/*==============================================================*/
/* DBMS name:      ORACLE Version 19c                           */
/* Created on:     3/27/2022 12:04:33 PM                        */
/*==============================================================*/


alter table ACTIVITY_LIST
   drop constraint FK_ACTIVITY_RELATIONS_TERM;

alter table CHARACTER
   drop constraint FK_CHARACTE_RELATIONS_PLAY;

alter table CHARACTER_STUDENT
   drop constraint FK_CHARACTE_RELATIONS_CHARACTE;

alter table CHARACTER_STUDENT
   drop constraint FK_CHARACTE_RELATIONS_STUDENT;

alter table EMPLOYEE
   drop constraint FK_EMPLOYEE_RELATIONS_UNIT;

alter table EXPEND_PLAY
   drop constraint FK_EXPEND_P_RELATIONS_PLAY;

alter table EXPEND_PLAY
   drop constraint FK_EXPEND_P_RELATIONS_EXPENSE_;

alter table EXPENSE_LIST
   drop constraint FK_EXPENSE__RELATIONS_TERM;

alter table FUNCTION
   drop constraint FK_FUNCTION_RELATIONS_MODALITY;

alter table FUNCTION
   drop constraint FK_FUNCTION_RELATIONS_THEATER;

alter table FUNCTION
   drop constraint FK_FUNCTION_RELATIONS_PLAY;

alter table PLAY
   drop constraint FK_PLAY_RELATIONS_TYPE_PLA;

alter table PLAY
   drop constraint FK_PLAY_RELATIONS_COUNTRY;

alter table PLAY
   drop constraint FK_PLAY_RELATIONS_PLAYWRIG;

alter table PLAYWRIGHT
   drop constraint FK_PLAYWRIG_RELATIONS_COUNTRY;

alter table STAGE_PLAY_STAFF
   drop constraint FK_STAGE_PL_RELATIONS_EMPLOYEE;

alter table STAGE_PLAY_STAFF
   drop constraint FK_STAGE_PL_RELATIONS_ROLE;

alter table STAGE_PLAY_STAFF
   drop constraint FK_STAGE_PL_RELATIONS_PLAY;

alter table STUDENT
   drop constraint FK_STUDENT_RELATIONS_UNIT;

alter table STUDENT_ATTENDANCE
   drop constraint FK_STUDENT__RELATIONS_STUDENT;

alter table STUDENT_ATTENDANCE
   drop constraint FK_STUDENT__RELATIONS_FUNCTION;

alter table UNIT
   drop constraint FK_UNIT_RELATIONS_UNIT;

alter table UNIT
   drop constraint FK_UNIT_RELATIONS_TYPE_UNI;

alter table WORK_PLAY_STAFF
   drop constraint FK_WORK_PLA_RELATIONS_STAGE_PL;

alter table WORK_PLAY_STAFF
   drop constraint FK_WORK_PLA_RELATIONS_FUNCTION;

alter table WORK_PLAY_STAFF
   drop constraint FK_WORK_PLA_RELATIONS_ACTIVITY;

drop index RELATIONSHIP_8_FK;

drop table ACTIVITY_LIST cascade constraints;

drop index RELATIONSHIP_18_FK;

drop table CHARACTER cascade constraints;

drop index RELATIONSHIP_20_FK;

drop index RELATIONSHIP_19_FK;

drop table CHARACTER_STUDENT cascade constraints;

drop table COUNTRY cascade constraints;

drop index RELATIONSHIP_11_FK;

drop table EMPLOYEE cascade constraints;

drop index RELATIONSHIP_7_FK;

drop index RELATIONSHIP_5_FK;

drop table EXPEND_PLAY cascade constraints;

drop index RELATIONSHIP_6_FK;

drop table EXPENSE_LIST cascade constraints;

drop index RELATIONSHIP_17_FK;

drop index RELATIONSHIP_16_FK;

drop index RELATIONSHIP_14_FK;

drop table FUNCTION cascade constraints;

drop table MODALITY cascade constraints;

drop index RELATIONSHIP_4_FK;

drop index RELATIONSHIP_2_FK;

drop index RELATIONSHIP_1_FK;

drop table PLAY cascade constraints;

drop index RELATIONSHIP_3_FK;

drop table PLAYWRIGHT cascade constraints;

drop table ROLE cascade constraints;

drop index RELATIONSHIP_23_FK;

drop index RELATIONSHIP_22_FK;

drop index RELATIONSHIP_21_FK;

drop table STAGE_PLAY_STAFF cascade constraints;

drop index RELATIONSHIP_12_FK;

drop table STUDENT cascade constraints;

drop index RELATIONSHIP_15_FK;

drop index RELATIONSHIP_13_FK;

drop table STUDENT_ATTENDANCE cascade constraints;

drop table TERM cascade constraints;

drop table THEATER cascade constraints;

drop table TYPE_PLAY cascade constraints;

drop table TYPE_UNIT cascade constraints;

drop index RELATIONSHIP_10_FK;

drop index RELATIONSHIP_9_FK;

drop table UNIT cascade constraints;

drop index RELATIONSHIP_26_FK;

drop index RELATIONSHIP_25_FK;

drop index RELATIONSHIP_24_FK;

drop table WORK_PLAY_STAFF cascade constraints;

/*==============================================================*/
/* Table: ACTIVITY_LIST                                         */
/*==============================================================*/
create table ACTIVITY_LIST (
   ID_TERM              INTEGER               not null,
   ACTIVITY_CODE        VARCHAR2(5)           not null,
   ACTIVITY_DESC        VARCHAR2(40)          not null,
   HOUR_VALUE           NUMBER(4,2)           not null,
   constraint PK_ACTIVITY_LIST primary key (ID_TERM, ACTIVITY_CODE)
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_8_FK on ACTIVITY_LIST (
   ID_TERM ASC
);

/*==============================================================*/
/* Table: CHARACTER                                             */
/*==============================================================*/
create table CHARACTER (
   ID_PLAY              VARCHAR2(4)           not null,
   ID_CHARACTER         VARCHAR2(4)           not null,
   CHARACTER_NAME       VARCHAR2(40)          not null,
   constraint PK_CHARACTER primary key (ID_PLAY, ID_CHARACTER)
);

/*==============================================================*/
/* Index: RELATIONSHIP_18_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_18_FK on CHARACTER (
   ID_PLAY ASC
);

/*==============================================================*/
/* Table: CHARACTER_STUDENT                                     */
/*==============================================================*/
create table CHARACTER_STUDENT (
   ID_CHARACTER_STUDENT NUMBER(4)           
      generated as identity ( start with 1 nocycle noorder)  not null,
   ID_PLAY              VARCHAR2(4)           not null,
   ID_CHARACTER         VARCHAR2(4)           not null,
   STUDENT_CODE         VARCHAR2(11)          not null,
   START_CHARACTER_DATE DATE                  not null,
   END_CHARACTER_DATE   DATE                  not null,
   constraint PK_CHARACTER_STUDENT primary key (ID_CHARACTER_STUDENT)
);

/*==============================================================*/
/* Index: RELATIONSHIP_19_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_19_FK on CHARACTER_STUDENT (
   ID_PLAY ASC,
   ID_CHARACTER ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_20_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_20_FK on CHARACTER_STUDENT (
   STUDENT_CODE ASC
);

/*==============================================================*/
/* Table: COUNTRY                                               */
/*==============================================================*/
create table COUNTRY (
   COUNTRY_CODE         VARCHAR2(20)          not null,
   COUNTRY_NAME         VARCHAR2(45)          not null,
   constraint PK_COUNTRY primary key (COUNTRY_CODE)
);

/*==============================================================*/
/* Table: EMPLOYEE                                              */
/*==============================================================*/
create table EMPLOYEE (
   UNIT_CODE            VARCHAR2(5)           not null,
   EMPLOYEE_CODE        VARCHAR2(4)           not null,
   NAMES                VARCHAR2(20)          not null,
   SURNAMES             VARCHAR2(20)          not null,
   IDENTIFICATION_NUMBER VARCHAR2(10),
   PHONE_NUMBER         VARCHAR2(10)          not null,
   EMAIL_ADDRESS        VARCHAR2(40)          not null,
   constraint PK_EMPLOYEE primary key (UNIT_CODE, EMPLOYEE_CODE)
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_11_FK on EMPLOYEE (
   UNIT_CODE ASC
);

/*==============================================================*/
/* Table: EXPEND_PLAY                                           */
/*==============================================================*/
create table EXPEND_PLAY (
   ID_TERM              INTEGER               not null,
   EXPENSE_CODE         VARCHAR2(5)           not null,
   ID_EXPEND_PLAY       NUMBER(5)           
      generated as identity ( start with 1 nocycle noorder)  not null,
   ID_PLAY              VARCHAR2(4)           not null,
   EXPEND_DATE          DATE                  not null,
   constraint PK_EXPEND_PLAY primary key (ID_TERM, EXPENSE_CODE, ID_EXPEND_PLAY)
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_5_FK on EXPEND_PLAY (
   ID_PLAY ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_7_FK on EXPEND_PLAY (
   ID_TERM ASC,
   EXPENSE_CODE ASC
);

/*==============================================================*/
/* Table: EXPENSE_LIST                                          */
/*==============================================================*/
create table EXPENSE_LIST (
   ID_TERM              INTEGER               not null,
   EXPENSE_CODE         VARCHAR2(5)           not null,
   constraint PK_EXPENSE_LIST primary key (ID_TERM, EXPENSE_CODE)
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_6_FK on EXPENSE_LIST (
   ID_TERM ASC
);

/*==============================================================*/
/* Table: FUNCTION                                              */
/*==============================================================*/
create table FUNCTION (
   ID_PLAY              VARCHAR2(4)           not null,
   ID_FUNCTION          VARCHAR2(4)           not null,
   ID_TYPE_MODALITY     VARCHAR2(2)           not null,
   THEATER_CODE         VARCHAR2(3)           not null,
   FUNCTION_DATE        DATE                  not null,
   START_TIME           TIMESTAMP             not null,
   END_TIME             TIMESTAMP             not null,
   constraint PK_FUNCTION primary key (ID_PLAY, ID_FUNCTION)
);

/*==============================================================*/
/* Index: RELATIONSHIP_14_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_14_FK on FUNCTION (
   ID_TYPE_MODALITY ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_16_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_16_FK on FUNCTION (
   THEATER_CODE ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_17_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_17_FK on FUNCTION (
   ID_PLAY ASC
);

/*==============================================================*/
/* Table: MODALITY                                              */
/*==============================================================*/
create table MODALITY (
   ID_TYPE_MODALITY     VARCHAR2(2)           not null,
   TYPE_MODALITY_DESC   VARCHAR2(40)          not null,
   constraint PK_MODALITY primary key (ID_TYPE_MODALITY)
);

/*==============================================================*/
/* Table: PLAY                                                  */
/*==============================================================*/
create table PLAY (
   ID_PLAY              VARCHAR2(4)           not null,
   ID_TYPE_PLAY         INTEGER               not null,
   COUNTRY_CODE         VARCHAR2(20)          not null,
   ID_PLAYWRIGHT        VARCHAR2(3)           not null,
   DATE_PLAY            DATE                  not null,
   TITLE                VARCHAR2(45)          not null,
   STATE                SMALLINT              not null,
   constraint PK_PLAY primary key (ID_PLAY)
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_1_FK on PLAY (
   ID_TYPE_PLAY ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_2_FK on PLAY (
   COUNTRY_CODE ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_4_FK on PLAY (
   ID_PLAYWRIGHT ASC
);

/*==============================================================*/
/* Table: PLAYWRIGHT                                            */
/*==============================================================*/
create table PLAYWRIGHT (
   ID_PLAYWRIGHT        VARCHAR2(3)           not null,
   COUNTRY_CODE         VARCHAR2(20)          not null,
   PLAYWRIGHT_NAME      VARCHAR2(30)          not null,
   constraint PK_PLAYWRIGHT primary key (ID_PLAYWRIGHT)
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_3_FK on PLAYWRIGHT (
   COUNTRY_CODE ASC
);

/*==============================================================*/
/* Table: ROLE                                                  */
/*==============================================================*/
create table ROLE (
   ID_ROLE              NUMBER(3)           
      generated as identity ( start with 1 nocycle noorder)  not null,
   NAME_ROLE            VARCHAR2(30)          not null,
   DESC_ROLE            VARCHAR2(50)          not null,
   constraint PK_ROLE primary key (ID_ROLE)
);

/*==============================================================*/
/* Table: STAGE_PLAY_STAFF                                      */
/*==============================================================*/
create table STAGE_PLAY_STAFF (
   UNIT_CODE            VARCHAR2(5)           not null,
   EMPLOYEE_CODE        VARCHAR2(4)           not null,
   ID_STA_PLA_STAFF     NUMBER(4)           
      generated as identity ( start with 1 nocycle noorder)  not null,
   ID_ROLE              INTEGER,
   ID_PLAY              VARCHAR2(4),
   STAFF_START_DATE     DATE                  not null,
   STAFF_END_DATE       DATE                  not null,
   constraint PK_STAGE_PLAY_STAFF primary key (UNIT_CODE, EMPLOYEE_CODE, ID_STA_PLA_STAFF)
);

/*==============================================================*/
/* Index: RELATIONSHIP_21_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_21_FK on STAGE_PLAY_STAFF (
   UNIT_CODE ASC,
   EMPLOYEE_CODE ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_22_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_22_FK on STAGE_PLAY_STAFF (
   ID_ROLE ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_23_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_23_FK on STAGE_PLAY_STAFF (
   ID_PLAY ASC
);

/*==============================================================*/
/* Table: STUDENT                                               */
/*==============================================================*/
create table STUDENT (
   STUDENT_CODE         VARCHAR2(11)          not null,
   UNIT_CODE            VARCHAR2(5)           not null,
   STUDENT_NAMES        VARCHAR2(30)          not null,
   STUDENT_SURNAMES     VARCHAR2(30)          not null,
   BIRTH_DATE           DATE                  not null,
   INSCRIPTION_DATE     DATE                  not null,
   EMAIL_ADDRESS2       VARCHAR2(30)          not null,
   constraint PK_STUDENT primary key (STUDENT_CODE)
);

/*==============================================================*/
/* Index: RELATIONSHIP_12_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_12_FK on STUDENT (
   UNIT_CODE ASC
);

/*==============================================================*/
/* Table: STUDENT_ATTENDANCE                                    */
/*==============================================================*/
create table STUDENT_ATTENDANCE (
   ID_STUDENT_ATTENDANCE NUMBER(4)           
      generated as identity ( start with 1 nocycle noorder)  not null,
   STUDENT_CODE         VARCHAR2(11)          not null,
   ID_PLAY              VARCHAR2(4)           not null,
   ID_FUNCTION          VARCHAR2(4)           not null,
   constraint PK_STUDENT_ATTENDANCE primary key (ID_STUDENT_ATTENDANCE)
);

/*==============================================================*/
/* Index: RELATIONSHIP_13_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_13_FK on STUDENT_ATTENDANCE (
   STUDENT_CODE ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_15_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_15_FK on STUDENT_ATTENDANCE (
   ID_PLAY ASC,
   ID_FUNCTION ASC
);

/*==============================================================*/
/* Table: TERM                                                  */
/*==============================================================*/
create table TERM (
   ID_TERM              NUMBER(4)           
      generated as identity ( start with 1 nocycle noorder)  not null,
   TERM_DESC            VARCHAR2(6)           not null,
   constraint PK_TERM primary key (ID_TERM)
);

/*==============================================================*/
/* Table: THEATER                                               */
/*==============================================================*/
create table THEATER (
   THEATER_CODE         VARCHAR2(3)           not null,
   THEATER_NAME         VARCHAR2(30)          not null,
   THEATER_ADDRESS      VARCHAR2(50)          not null,
   constraint PK_THEATER primary key (THEATER_CODE)
);

/*==============================================================*/
/* Table: TYPE_PLAY                                             */
/*==============================================================*/
create table TYPE_PLAY (
   ID_TYPE_PLAY         NUMBER(2)           
      generated as identity ( start with 1 nocycle noorder)  not null,
   NAME_TYPE_PLAY       VARCHAR2(40)          not null,
   constraint PK_TYPE_PLAY primary key (ID_TYPE_PLAY)
);

/*==============================================================*/
/* Table: TYPE_UNIT                                             */
/*==============================================================*/
create table TYPE_UNIT (
   ID_TYPE_UNIT         VARCHAR2(2)           not null,
   UNIT_TYPE_DESCRIPTION VARCHAR2(30),
   constraint PK_TYPE_UNIT primary key (ID_TYPE_UNIT)
);

/*==============================================================*/
/* Table: UNIT                                                  */
/*==============================================================*/
create table UNIT (
   UNIT_CODE            VARCHAR2(5)           not null,
   ID_TYPE_UNIT         VARCHAR2(2)           not null,
   DEPENDENCY_UNIT      VARCHAR2(5),
   UNI_NAME             VARCHAR2(40)          not null,
   constraint PK_UNIT primary key (UNIT_CODE)
);

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_9_FK on UNIT (
   ID_TYPE_UNIT ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_10_FK on UNIT (
   DEPENDENCY_UNIT ASC
);

/*==============================================================*/
/* Table: WORK_PLAY_STAFF                                       */
/*==============================================================*/
create table WORK_PLAY_STAFF (
   ID_WORK_PL_STA       NUMBER(4)           
      generated as identity ( start with 1 nocycle noorder)  not null,
   UNIT_CODE            VARCHAR2(5),
   EMPLOYEE_CODE        VARCHAR2(4),
   ID_STA_PLA_STAFF     INTEGER,
   ID_PLAY              VARCHAR2(4),
   ID_FUNCTION          VARCHAR2(4),
   ID_TERM              INTEGER               not null,
   ACTIVITY_CODE        VARCHAR2(5)           not null,
   constraint PK_WORK_PLAY_STAFF primary key (ID_WORK_PL_STA)
);

/*==============================================================*/
/* Index: RELATIONSHIP_24_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_24_FK on WORK_PLAY_STAFF (
   UNIT_CODE ASC,
   EMPLOYEE_CODE ASC,
   ID_STA_PLA_STAFF ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_25_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_25_FK on WORK_PLAY_STAFF (
   ID_PLAY ASC,
   ID_FUNCTION ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_26_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_26_FK on WORK_PLAY_STAFF (
   ID_TERM ASC,
   ACTIVITY_CODE ASC
);

alter table ACTIVITY_LIST
   add constraint FK_ACTIVITY_RELATIONS_TERM foreign key (ID_TERM)
      references TERM (ID_TERM);

alter table CHARACTER
   add constraint FK_CHARACTE_RELATIONS_PLAY foreign key (ID_PLAY)
      references PLAY (ID_PLAY);

alter table CHARACTER_STUDENT
   add constraint FK_CHARACTE_RELATIONS_CHARACTE foreign key (ID_PLAY, ID_CHARACTER)
      references CHARACTER (ID_PLAY, ID_CHARACTER);

alter table CHARACTER_STUDENT
   add constraint FK_CHARACTE_RELATIONS_STUDENT foreign key (STUDENT_CODE)
      references STUDENT (STUDENT_CODE);

alter table EMPLOYEE
   add constraint FK_EMPLOYEE_RELATIONS_UNIT foreign key (UNIT_CODE)
      references UNIT (UNIT_CODE);

alter table EXPEND_PLAY
   add constraint FK_EXPEND_P_RELATIONS_PLAY foreign key (ID_PLAY)
      references PLAY (ID_PLAY);

alter table EXPEND_PLAY
   add constraint FK_EXPEND_P_RELATIONS_EXPENSE_ foreign key (ID_TERM, EXPENSE_CODE)
      references EXPENSE_LIST (ID_TERM, EXPENSE_CODE);

alter table EXPENSE_LIST
   add constraint FK_EXPENSE__RELATIONS_TERM foreign key (ID_TERM)
      references TERM (ID_TERM);

alter table FUNCTION
   add constraint FK_FUNCTION_RELATIONS_MODALITY foreign key (ID_TYPE_MODALITY)
      references MODALITY (ID_TYPE_MODALITY);

alter table FUNCTION
   add constraint FK_FUNCTION_RELATIONS_THEATER foreign key (THEATER_CODE)
      references THEATER (THEATER_CODE);

alter table FUNCTION
   add constraint FK_FUNCTION_RELATIONS_PLAY foreign key (ID_PLAY)
      references PLAY (ID_PLAY);

alter table PLAY
   add constraint FK_PLAY_RELATIONS_TYPE_PLA foreign key (ID_TYPE_PLAY)
      references TYPE_PLAY (ID_TYPE_PLAY);

alter table PLAY
   add constraint FK_PLAY_RELATIONS_COUNTRY foreign key (COUNTRY_CODE)
      references COUNTRY (COUNTRY_CODE);

alter table PLAY
   add constraint FK_PLAY_RELATIONS_PLAYWRIG foreign key (ID_PLAYWRIGHT)
      references PLAYWRIGHT (ID_PLAYWRIGHT);

alter table PLAYWRIGHT
   add constraint FK_PLAYWRIG_RELATIONS_COUNTRY foreign key (COUNTRY_CODE)
      references COUNTRY (COUNTRY_CODE);

alter table STAGE_PLAY_STAFF
   add constraint FK_STAGE_PL_RELATIONS_EMPLOYEE foreign key (UNIT_CODE, EMPLOYEE_CODE)
      references EMPLOYEE (UNIT_CODE, EMPLOYEE_CODE);

alter table STAGE_PLAY_STAFF
   add constraint FK_STAGE_PL_RELATIONS_ROLE foreign key (ID_ROLE)
      references ROLE (ID_ROLE);

alter table STAGE_PLAY_STAFF
   add constraint FK_STAGE_PL_RELATIONS_PLAY foreign key (ID_PLAY)
      references PLAY (ID_PLAY);

alter table STUDENT
   add constraint FK_STUDENT_RELATIONS_UNIT foreign key (UNIT_CODE)
      references UNIT (UNIT_CODE);

alter table STUDENT_ATTENDANCE
   add constraint FK_STUDENT__RELATIONS_STUDENT foreign key (STUDENT_CODE)
      references STUDENT (STUDENT_CODE);

alter table STUDENT_ATTENDANCE
   add constraint FK_STUDENT__RELATIONS_FUNCTION foreign key (ID_PLAY, ID_FUNCTION)
      references FUNCTION (ID_PLAY, ID_FUNCTION);

alter table UNIT
   add constraint FK_UNIT_RELATIONS_UNIT foreign key (DEPENDENCY_UNIT)
      references UNIT (UNIT_CODE);

alter table UNIT
   add constraint FK_UNIT_RELATIONS_TYPE_UNI foreign key (ID_TYPE_UNIT)
      references TYPE_UNIT (ID_TYPE_UNIT);

alter table WORK_PLAY_STAFF
   add constraint FK_WORK_PLA_RELATIONS_STAGE_PL foreign key (UNIT_CODE, EMPLOYEE_CODE, ID_STA_PLA_STAFF)
      references STAGE_PLAY_STAFF (UNIT_CODE, EMPLOYEE_CODE, ID_STA_PLA_STAFF);

alter table WORK_PLAY_STAFF
   add constraint FK_WORK_PLA_RELATIONS_FUNCTION foreign key (ID_PLAY, ID_FUNCTION)
      references FUNCTION (ID_PLAY, ID_FUNCTION);

alter table WORK_PLAY_STAFF
   add constraint FK_WORK_PLA_RELATIONS_ACTIVITY foreign key (ID_TERM, ACTIVITY_CODE)
      references ACTIVITY_LIST (ID_TERM, ACTIVITY_CODE);

