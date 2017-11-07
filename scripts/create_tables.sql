CREATE TABLE ROLE (
	ID_ROLE NUMBER,
	ROLE VARCHAR2 (10)
);

CREATE TABLE ACCOUNTS (
	CPF NUMBER,
	NAME VARCHAR2 (50),
	EMAIL VARCHAR2 (64),
	PASSWORD VARCHAR2 (50),
	BIRTH_DATE TIMESTAMP,
	SEX VARCHAR2 (1),
	TEL VARCHAR2 (16),
	CEP VARCHAR2 (10),
	STREET VARCHAR2 (50),
	ADDRESS_NUMBER VARCHAR2 (10),
	DISTRICT VARCHAR2 (50),
	CITY VARCHAR2 (50),
	STATE VARCHAR2 (2),
	ROLE NUMBER,
	PRIMARY KEY (CPF),
	FOREIGN KEY (ROLE) REFERENCES  ROLE(ROLE)
);

CREATE TABLE BOOK (
	ISBN NUMBER,
	TITLE VARCHAR2 (50),
	AUTHOR VARCHAR2 (50),
	PUBLISHER VARCHAR (30),
	QUANTITY NUMBER,
	DESCRIPTION VARCHAR2 (100),
	IMG_URL VARCHAR2 (100),
	PRIMARY KEY (ISBN),
	FOREIGN KEY (CATEGORY) REFERENCES  CATEGORY(CATEGORY)
);

CREATE TABLE BORROWING (
	ID_BORROWING NUMBER,
	CPF NUMBER,
	ISBN NUMBER,
	FOREIGN KEY (CPF) REFERENCES ACCOUNT(CPF),
	FOREIGN KEY (ISBN) REFERENCES BOOK(ISBN)
);