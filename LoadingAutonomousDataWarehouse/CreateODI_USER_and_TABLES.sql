CREATE USER ODI_USER IDENTIFIED BY <ENTER_PASSWORD_HERE>;
GRANT CREATE SESSION TO ODI_USER;
GRANT DWROLE TO ODI_USER;
GRANT SELECT ANY TABLE to ODI_USER;
GRANT INSERT ANY TABLE to ODI_USER;
GRANT UPDATE ANY TABLE to ODI_USER;


CREATE TABLE ODI_USER.DATE_DIM 
   (	
    DT_DIM_ID NUMBER, 
	DT DATE, 
	DAY_NAME VARCHAR2(36 BYTE), 
	DAY_SHORT_NAME VARCHAR2(12 BYTE), 
	BUSINESS_DAY_FLAG CHAR(1 BYTE), 
	MONTH_NUM VARCHAR2(2 BYTE), 
	MONTH_NAME VARCHAR2(36 BYTE), 
	MONTH_SHORT_NAME VARCHAR2(12 BYTE), 
	QTR_NUM VARCHAR2(1 BYTE), 
	QTR_NAME VARCHAR2(2 BYTE), 
	HALF_YR_NAME CHAR(2 BYTE), 
	YEAR_HALF_YR_NAME VARCHAR2(45 BYTE), 
	YR_QTR_NAME VARCHAR2(45 BYTE), 
	YR_NUM NUMBER, 
	DAY_OF_WK_NUM NUMBER, 
	DAY_OF_MONTH_NUM NUMBER, 
	DAY_OF_YR_NUM NUMBER, 
	WK_OF_YR_NUM NUMBER, 
	CYCLE_ID NUMBER, 
	 CONSTRAINT PK_DATE_DIM PRIMARY KEY (DT_DIM_ID)
	 );
	  ALTER TABLE ODI_USER.DATE_DIM 
	ADD CONSTRAINT UK_DATE_DIM UNIQUE (DT) ;
	
CREATE TABLE ODI_USER.CUST_DIM
   (
	CUST_DIM_ID NUMBER(10,0) NOT NULL ENABLE, 
	SRC_CUST_ID NUMBER(10,0) NOT NULL ENABLE, 
	CUST_LAST_NAME VARCHAR2(100 BYTE), 
	CUST_FIRST_NAME VARCHAR2(100 BYTE), 
	CUST_CITY VARCHAR2(100 BYTE), 
	CUST_REGION VARCHAR2(100 BYTE), 
	EFF_DT DATE, 
	END_DT DATE, 
	CYCLE_ID NUMBER, 
	CURRENT_RECORD NUMBER(1,0),
	 CONSTRAINT PK_CUST_DIM PRIMARY KEY (CUST_DIM_ID)
	 );
	 ALTER TABLE ODI_USER.CUST_DIM 
	ADD CONSTRAINT UK_CUST_DIM UNIQUE (SRC_CUST_ID, END_DT, EFF_DT) ;
	
	
CREATE TABLE ODI_USER.PRODUCT_DIM 
   (PRODUCT_DIM_ID NUMBER NOT NULL ENABLE, 
	SRC_PRODUCT_CODE NUMBER(10,0) NOT NULL ENABLE, 
	PRODUCT_NAME VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	PRODUCT_FAMILY VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	EFF_DT DATE, 
	END_DT DATE, 
	CYCLE_ID NUMBER, 
	CURRENT_RECORD NUMBER(1,0), 
	 PRIMARY KEY (PRODUCT_DIM_ID)
	 );
	 ALTER TABLE ODI_USER.PRODUCT_DIM
	 ADD CONSTRAINT UK_PRODUCT_DIM UNIQUE (SRC_PRODUCT_CODE, END_DT)  ;
	 
	
CREATE TABLE ODI_USER.SALES_FACT 
   (
    SALES_DATE DATE NOT NULL ENABLE, 
	SALES_DT_DIM_ID NUMBER(8,0) NOT NULL ENABLE, 
	CUST_DIM_ID NUMBER(10,0) NOT NULL ENABLE, 
	PRODUCT_DIM_ID NUMBER(10,0) NOT NULL ENABLE, 
	SALES_QTY NUMBER(10,0) NOT NULL ENABLE, 
	SALES_AMOUNT NUMBER(10,2) NOT NULL ENABLE, 
	SALES_PRICE NUMBER(12,3) NOT NULL ENABLE, 
	ORDER_ID NUMBER(32,0) NOT NULL ENABLE, 
	ORDER_LINE_ID NUMBER(32,0) NOT NULL ENABLE, 
	CYCLE_ID NUMBER NOT NULL ENABLE
   )  ;
   
CREATE TABLE ODI_USER.SALES_FACT_ANALYSIS
   (SALES_YEAR  VARCHAR2(10 BYTE), 
	PRODUCT_FAMILY VARCHAR2(100 BYTE), 
	SALES_REGION VARCHAR2(100 BYTE), 
	SALES_AMT NUMBER(20,0), 
	YOY_GROWTH_PCT NUMBER(10,2), 
	TOTAL_YR_PRODUCT_AMT NUMBER(20,0), 
	PRIOR_3_YR_HIGH NUMBER(20,0)
   ) ;
   
CREATE SEQUENCE ODI_USER.SEQ_CUSTOMER_DIM  CACHE 2000;
CREATE SEQUENCE ODI_USER.SEQ_PRODUCT_DIM  CACHE 2000;