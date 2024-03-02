CREATE PROCEDURE daily_transaction
	(@start_date date null,
	@end_date date null) AS
	BEGIN
		select  distinct transaction_date AS DATE, count(transaction_date) 
		as totaL_transaction, sum(amount) as Total_amount 
		from FactTransaction
		WHERE transaction_date BETWEEN @start_date AND @end_date  
		group by  transaction_date  ;
	END 


EXEC daily_transaction @start_date= '2024-01-18', @end_date ='2024-01-20' ;