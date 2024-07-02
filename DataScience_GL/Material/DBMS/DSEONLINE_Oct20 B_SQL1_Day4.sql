

# Question 1:
# 1) Print customer Id, customer name and average account_balance maintained by each customer for all 
# of his/her accounts in the bank.
/*
select .....
from Bank_customer BC
join Bank_Account_Details BAD
On .........
group by .....
*/
/*
Select bc.customer_id , customer_name, avg(Balance_amount) 
as All_account_balance_amount from bank_customer bc
inner join Bank_Account_Details bad
on bc.customer_id = bad.Customer_id
group by bc.customer_id, customer_name;

select bc.customer_id,bc.customer_name,avg(ad.balance_amount) 
from bank_customer bc,bank_account_details ad 
where bc.customer_id=ad.customer_id 
group by bc.customer_id,bc.customer_name;

*/
# Question 2:
# 2) Print customer_id , account_number and balance_amount for all the accounts.
# for account_type = "Credit Card" apply the condition that if balance_amount is nil then assign transaction_amount 
/*
select customer_id , account_number ,
case when account_Type='Credit Card' and (ifnull(balance_amount,0)=0) 
		then transaction_amount
	 else balance_Amount
end as balance_amount
from Bank_Account_Details BAD
join B...A..T... BAT
on ........

SELECT a.customer_id, a.account_number, 
IF(account_type = "Credit Card" AND balance_amount = 0, b.transaction_amount, a.balance_amount) AS balance_amount FROM bank_account_details a
JOIN bank_account_transaction b
ON a.account_number = b.account_number; 
*/

use bank;


select cust.customer_id,acc.account_number,
case when acc.account_type='Credit Card' and ifnull(acc.balance_amount,0)=0 then tran.transaction_amount
	 else acc.balance_amount
end as 'bal_amount', acc.account_type,tran.transaction_amount
from bank_customer cust,bank_account_details acc,bank_account_transaction tran
where cust.customer_id=acc.customer_id and tran.account_number=acc.account_number;

select customer_id, bad.account_number,
case when account_type = 'Credit Card' and (ifnull(balance_amount,0) = 0) 
	then bat.transaction_amount
	else bad.balance_amount
end as balance
from bank_account_details bad join bank_account_transaction bat
on bad.account_number = bat.account_number;

# Question 3:
# 3) Print account_number and balance_amount , transaction_amount,Transaction_Date from Bank_Account_Details and 
# bank_account_transaction for all the transactions occurred during march,2020 and april, 2020

from bank_account_details bad 
join bank_account_transaction bat
on.......
where transaction_Date between ....... and .......
#where Year(transaction_date)=2020 and month(transaction_Date) IN (3,4)


# Question 4:
# 4) Print all the customer ids, account number,  balance_amount, transaction_amount , Transaction_Date 
# from bank_customer, Bank_Account_Details and bank_account_transaction tables where excluding 
# all of their transactions in march, 2020  month

not between ...... and .......

# Question 5:
# 5) Print the customer ids, account_number, balance_amount,transaction_amount ,transaction_date who did transactions 
# during the first quarter. Do not display the accounts if they have not done any transactions in the first quarter.

#between 1st jan and  31st march 

#Quarter(transaction_Date) and year(...)=2020

select bad.account_number, balance_amount, transaction_amount,Transaction_Date 
from bank_account_details bad 
inner join 
bank_account_transaction bat
on bad.Account_Number=bat.Account_Number
where  Transaction_date between "2020-01-01" and "2020-03-31";

select bad.account_number, balance_amount, transaction_amount,Transaction_Date 
from bank_account_details bad 
inner join 
bank_account_transaction bat
on bad.Account_Number=bat.Account_Number
where quarter(Transaction_Date)=1 and year(transaction_date)=2020;



# Question 6:
# 6) Print account_number, Event and Customer_message from BANK_CUSTOMER_MESSAGES and Bank_Account_Details to 
# display an “Adhoc" Event for all customers who have  “SAVINGS" account_type account.

select ......
from BANK_CUSTOMER_MESSAGES
join Bank_Account_Details
where event='Adhoc' and account_type='Savings';


# Question 7:
# 7) Print all the Customer_ids, Account_Number, Account_type, and display deducted balance_amount by  
# subtracting only negative transaction_amounts for Relationship_type =
#  "P" ( P - means  Primary , S - means Secondary ) .


select Customer_id, bad.Account_Number, Account_type,
case when transaction_amount<0 then balance_amount - abs(transaction_Amount)
	 else balance_Amount 
end as balance_Amount
from  bank_Account_DEtails bad
join bant_Account_Transaction bat
on bad.account_number=bat.account_number
where relationship_Type= 'P';



# Question 8:
# a) Display records of All Accounts , their Account_types, the balance amount.
# b) Along with first step, Display other columns with corresponding linking account number, account types 

select bad.account_number, bad.account_Type, bad.balance_Amount, 
bard.account_number as secondary_Acc_no , bard.account_Type as sec_type 
From Bank_Account_Details bad
join Bank_Account_Relationship_details bard
on  bad.account_number= bard.linking_Account_number;
#or left join is ok as well


# Question 9:
# a) Display records of All Accounts , their Account_types, the balance amount.
# b) Along with first step, Display other columns with corresponding linking account number, account types 
# c) After retrieving all records of accounts and their linked accounts, display the  
# transaction amount of accounts appeared  in another column.


select bad.account_number, bad.account_Type, bad.balance_Amount, 
bard.account_number as secondary_Acc_no , bard.account_Type as sec_type , bat.transaction_Amount
From Bank_Account_Details bad
left join Bank_Account_Relationship_details bard
on  bad.account_number= bard.linking_Account_number
left join Bank_Account_transaction bat
on  bad.account_number=bat.account_number;


# Question 10:
# 10) Display all account holders from Bank_Accounts_Details table who have “Add-on Credit Cards" and “Credit cards" 


like '%Credit%'

# Question 11:
# 11)  Display  records of “SAVINGS” accounts linked with “Credit card" account_type and its credit
# aggregate sum of transaction amount.

# Ref: Use bank_Account_Details for Credit card types
		#Check linking relationship in bank_transaction_relationship_details.
        # Check transaction_amount in bank_account_transaction. 
select account_number ,....... , sum(transaction_Amount)
From Bank_Account_Details bad
left join Bank_Account_Relationship_details bard
on  bad.account_number= bard.linking_Account_number
left join Bank_Account_transaction bat
on  bad.account_number=bat.account_number
where bad.account_Type='Savings'   and bard.account_Type like '%Credit%'
group by .......;



# Question 12:
# 12) Display all type of “Credit cards”  accounts including linked “Add-on Credit Cards" 
# type accounts with their respective aggregate sum of transaction amount.

# Ref: Check Bank_Account_Details_table for all types of credit card.
        # Check transaction_amount in bank_account_transaction. 
	
select account_number ,....... , sum(transaction_Amount)
From Bank_Account_Details bad
left join Bank_Account_Relationship_details bard
on  bad.account_number= bard.linking_Account_number
left join Bank_Account_transaction bat
on  bad.account_number=bat.account_number
where bad.account_Type='Credit Card'   and bard.account_Type ='Add-on Credit Cards'
group by .......;
    
    
       
    
# Question 13:
# 13) Display “SAVINGS” accounts and their corresponding aggregate sum of transaction amount 
# of all recurring deposits

	
select bad.account_number as primary_Acc_no  ,bard.account_number as sec_Acc_no , 
sum(transaction_Amount)
From Bank_Account_Details bad
left join Bank_Account_Relationship_details bard
on  bad.account_number= bard.linking_Account_number
left join Bank_Account_transaction bat
on  bard.account_number=bat.account_number
where bad.account_Type='savings'   and bard.account_Type ='recurring deposits'
group by bad.account_number ,bard.account_number;
    
    
# Question 14:
# 14) Display recurring deposits and their transaction amounts in  Feb 2020  along with 
# associated SAVINGS account_number , balance. 

#same as 13th - add a where clause

# Question 15:
# 15) Display every account's total no of transactions for every year and each month.

select account_number,year(transaction_DAte),month(transaction_date), count(bat.transaction_date)
from bad
join bat
on ....
group by account_number,year(transaction_DAte),month(transaction_date);


# Question 16:
# 16) Compare the aggregate sum transaction amount of Feb2020 month versus Jan2020 Month for each account number.
-- Display account_number, transaction_amount , 
-- sum of feb month transaction amount ,
-- sum of Jan month transaction amount , 

select month(transaction_Date) , sum(transaction_amount)
from bank_account_transaction
where month(transaction_Date) in (1,2) and year(transaction_DAte)=2020
group by month(transaction_Date) ;

select bat1.account_number, sum(bat1.transaction_amount) as jan, sum(bat2.transaction_amount) as feb
from bank_account_transaction bat1
join bank_Account_transaction bat2 
on bat1.account_number=bat2.account_number
where month(bat1.transaction_Date)=1 and month(bat2.transaction_Date)=2
group by bat1.account_number;
 
# Question 17:
# 17) Display the customer names who have all three account types - 
# savings, recurring and credit card account holders.

select bc.customer_name, bad.account_number as savings_Account, bard.account_number as RD_Acc_no
, bard1.account_number as CC_Acc_no
from bank_customer bc
join Bank_Account_Details bad
on bc.customer_id=bad.customer_id
join Bank_Account_Relationship_details bard
on  bad.account_number= bard.linking_Account_number
join  Bank_Account_Relationship_details bard1
on  bad.account_number= bard1.linking_Account_number
where bad.account_type='Savings'  and bard.account_type='Recurring Deposits' and bard1.account_Type='Credit Card'

# Question 18:
# 18) Display savings accounts and its corresponding Recurring deposits transactions that are occuring more than 4 times.

select ............... , count(bat.transaction_DAte)
from bad 
join bard 
join bat 
on bard.account_number=bat.account_number
group by ........
having count(bat.transaction_DAte)>4;

# Question 19:
# 19) Display savings accounts and its recurring deposits account with their aggregate 
# transactions per month occurs in 3 different months.

select ............... ,count(distinct month(transaction_Date) )
from bad 
join bard 
join bat 
on bard.account_number=bat.account_number
group by ........
having count(distinct month(transaction_Date) )>3;

# Question 20:
# 20) Find the no. of transactions of credit cards including add-on Credit Cards

select bad.account_number ,count(transaction_DAte) 
from bad
join bat
on .....
where type like '%Credit%'
