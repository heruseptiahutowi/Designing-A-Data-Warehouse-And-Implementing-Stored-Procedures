CREATE DATABASE DWH ;


CREATE TABLE DimAccount(
	account_id INT NOT NULL,
	customer_id INT NOT NULL,
	account_type VARCHAR(50) NOT NULL,
	balance INT NOT NULL,
	date_opened DATETIME2(0) NULL,
	status VARCHAR(50) NOT NULL,
	CONSTRAINT PKaccount_id PRIMARY KEY (account_id)
	);    

CREATE TABLE DimBranch(
	branch_id INT NOT NULL,
	branch_name VARCHAR(50) NULL,
	branch_location VARCHAR(50) NULL,
	CONSTRAINT PKbranch_id PRIMARY KEY (BRANCH_ID)
	);

CREATE TABLE DimCustomer(
	customer_id INT NOT NULL,
	customer_name VARCHAR(50) NULL,
	address VARCHAR(MAX) NULL,
	city_name VARCHAR(50) NULL,
	state_name VARCAHR(50) NULL,
	age VARCHAR(3) NULL,
	gender VARCHAR(10) NULL,
	email VARCHAR(50) NULL,
	CONSTRAINT PKcustomer_id PRIMARY KEY (customer_id))
	);

CREATE TABLE FactTransaction(
	transaction_id INT NOT NULL,
	account_id INT NULL,
	transaction_date DATETIME2(0) NULL,
	amount INT NULL,
	transaction_type VARCHAR(50) NULL,
	branch_id INT NULL,
	CONSTRAINT PKtransaction_id PRIMARY KEY (transaction_id)
	);