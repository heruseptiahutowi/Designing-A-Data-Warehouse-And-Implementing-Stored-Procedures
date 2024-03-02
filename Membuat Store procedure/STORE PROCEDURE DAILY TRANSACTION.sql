
CREATE PROCEDURE BalancePerCustomer
	@name VARCHAR(50) NULL AS
	BEGIN
	SELECT
		customer_name,
		account_type,
		balance,
		sum(case 
			when transaction_type = 'Deposit' THEN balance + amount
			else balance /2 - amount
		END	)
		as current_balance
		from FactTransaction join DimAccount
			on FactTransaction.account_id = DimAccount.account_id
			join DimCustomer on DimAccount.customer_id = DimCustomer.customer_id
		WHERE 
		customer_name =@name and status ='active'
		GROUP By balance, account_type, customer_name 
		order by balance desc
		;
	END

EXEC BalancePerCustomer @name = 'aji pangestu';