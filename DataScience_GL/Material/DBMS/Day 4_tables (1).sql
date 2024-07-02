#Create Table:
CREATE TABLE CUSTOMER     ( Cust_Id     INT , 
			             Name        VARCHAR(20), 
			             Address     VARCHAR(20),
			             State       VARCHAR(3) ,         
			             Phone       VARCHAR(10));
#Insert records:		    
INSERT INTO CUSTOMER VALUES 
(123001,"Oliver", "225-5, Emeryville",  "CA" , "1897614500"),
(123002,"George", "194-6,New brighton", "MN" , "189761700"),
(123003,"Harry",  "2909-5,walnut creek","CA" , "1897617866"),
(123004,"Jack",   "229-5, Concord",     "CA" , "1897627999"),
(123005,"Jacob",  "325-7, Mission Dist","SFO", "1897637000"),
(123006,"Noah",   "275-9, saint-paul" , "MN" , "1897613200"),
(123007,"Charlie","125-1,Richfield",    "MN" , "1897617666"),
(123008,"Robin",  "3005-1, Heathrow",   "NY", "1897614000");


# Create Table:
CREATE TABLE   CUSTOMER_REMOTE ( 
   Cust_Id     CHAR(10),
			        Name        CHAR(20), 
			        Address     CHAR(20),
			        State       CHAR(3) ,         
			        Phone       CHAR(10));
# Insert records:
INSERT INTO CUSTOMER_REMOTE VALUES 
(123001 ,"Oliver", "225-5,Emeryville", "CA" , "1897614500"),
(123002,"George", "194-6,New brighton","MN" , "189761700");

#Create Table:
CREATE TABLE ACCOUNT ( Cust_Id INT,  Acct_Num VARCHAR(19),    Acct_Type VARCHAR(25),
                            Balance INT , Acct_status VARCHAR(10), Relation varchar(1) ) ;
#Insert records:  # Relation - P ( primary) - S ( Secondary ) 
INSERT INTO ACCOUNT  VALUES (123001, "4000-1956-3456",  "SAVINGS", 200000 ,"ACTIVE","P"),
(123001, "5000-1700-3456",  "FIXED DEPOSITS" ,9400000 ,"ACTIVE","S"),  
(123002, "4000-1956-2001",  "SAVINGS"            , 400000 ,"ACTIVE","P"),
(123002, "5000-1700-5001",  "FIXED DEPOSITS" ,7500000 ,"ACTIVE","S"), 
(123003, "4000-1956-2900",  "SAVINGS"            ,750000,"INACTIVE","P"), 
(123004, "5000-1700-6091",  "FIXED DEPOSITS" ,7500000 ,"ACTIVE","S"), 
(123004, "4000-1956-3401",  "SAVINGS"            , 655000 ,"ACTIVE","P"), 
(123005, "4000-1956-5102",  "SAVINGS"            , 300000 ,"ACTIVE","P"), 
(123006, "4000-1956-5698",  "SAVINGS"            , 455000 ,"ACTIVE" ,"P"), 
(123007, "5000-1700-9800",  "SAVINGS"            , 355000 ,"ACTIVE" ,"P"), 
(123007, "4000-1956-9977",  "FIXED DEPOSITS" , 7025000,"ACTIVE" ,"S"),
(123007, "9000-1700-7777-4321",  "CREDITCARD"    ,0      ,"INACTIVE","P"), 
(123008, "5000-1700-7755",  "SAVINGS"            ,NULL   ,"INACTIVE","P"),
(123009, "5000-1700-9911",  "SAVINGS"            ,2000   ,"INACTIVE","P");


#Create Table:
CREATE TABLE ACCT_RELATION( Cust_id INT,		     	                        
     Acct_Num VARCHAR(19),
		                Acct_type VARCHAR(25),
 		                Link_Acct VARCHAR(19) );
#Insert records:
INSERT INTO ACCT_RELATION VALUES 
(123001, "4000-1956-3456",  "SAVINGS"        	, ""),
(123001, "5000-1700-3456",  "FIXED DEPOSITS" , "4000-1956-3456"),
(123002, "4000-1956-2001",  "SAVINGS"        	, "" ),
(123002, "5000-1700-5001",  "FIXED DEPOSITS" , "4000-1956-2001" ),
(123003, "4000-1956-2900",  "SAVINGS"        	, "" ),
(123004, "5000-1700-6091",  "FIXED DEPOSITS" , "4000-1956-2900" ),
(123007, "5000-1700-9800",  "SAVINGS"        	, "" ),
(123007, "4000-1956-9977",  "FIXED DEPOSITS" , "5000-1700-9800" ),
(123007, "9000-1700-7777-4321",  "CREDITCARD"	, "5000-1700-9800" );


#Create table :
CREATE TABLE Transaction ( Acct_Num VARCHAR(19),Tran_Amount Decimal(18,2) ,
              	Channel VARCHAR(18) , Area varchar(3), Tran_Date Date) ;
#Insert records :
INSERT INTO Transaction VALUES 
( "4000-1956-3456",       -2000, "ATM withdrawal",  "CA", "2020-01-13"),
( "4000-1956-2001",       -4000, "POS-Walmart"   ,  "MN", "2020-02-14"),
( "4000-1956-2001",       -1600, "UPI transfer"  ,  "MN", "2020-01-19"),
( "4000-1956-2001",       -6000, "Bankers cheque",  "CA", "2020-03-23"),
( "4000-1956-2001",       -3000, "Net banking"   ,  "CA", "2020-04-24"),
( "4000-1956-2001",       -2970, "Net banking"   ,  "CA", "2020-04-26"),
( "4000-1956-5102",       -6500, "ATM withdrawal",  "NY", "2020-04-24"),
( "4000-1956-5102",       -3600, "ATM withdrawal",  "NY", "2020-04-25"),
( "4000-1956-2001",       23000, "cheque deposit",  "MN", "2020-03-15"),
( "5000-1700-6091",       40000, "ECS transfer"  ,  "NY", "2020-02-19"),
( "4000-1956-3401",        8000, "Cash Deposit"  ,  "NY", "2020-01-19"),
( "4000-1956-5102",       -6500, "ATM withdrawal",  "NY", "2020-03-14"),
( "4000-1956-5698",       -9000, "Cash Deposit"  ,  "NY", "2020-03-27"),
( "4000-1956-9977",       50000, "ECS transfer"  ,  "NY", "2020-01-16"),
( "9000-1700-7777-4321",  -5000, "POS-Walmart",     "NY", "2020-02-17"),
( "9000-1700-7777-4321",  -8000, "Shopping Cart",   "MN", "2020-03-13"),
( "5000-1700-7755",           0,   "NIL",           "MN", "2020-04-21"),
( "5000-1700-9911",        2000,   "Cash Deposit",  "MN", "2020-04-24"),
( "4000-1700-4444-7722",  -5500, "Shopping Cart",   "MN", "2016-02-22"),
( "4000-1700-4444-6688",  -2500, "Shopping Cart",   "MN", "2016-04-21");


#Create Table:
CREATE TABLE Message (  Event VARCHAR(24),
			            Notice VARCHAR(100), 
			            Delivery_mode VARCHAR(15),
                        Event_dt Date) ;

#Insert records:
INSERT INTO Message VALUES ("Holiday", "banks are closed today", "Mobile" , '2020-02-19' ),
("Holiday", "banks are closed today", "Mobile" , '2020-03-16' ),
("Adhoc", "All banks are closed due to Lockdown", "Mobile", '2020-03-24' ),
("Tran_Limit", "Limit of only 4000/- withdrawal per card is allowed", "Mobile" , '2020-03-24' ),
("Holiday", "banks are closed today", "Mobile" , '2020-04-24' );


# Create table:
CREATE TABLE Interest ( acct_type varchar(24), 
                        rate  decimal(4,2), 
                        month varchar(2), 
                        year  varchar(4));
# Insert records
INSERT  INTO Interest VALUES 
( "SAVINGS" ,                  0.04 , '02' , '2020' ),
( "FIXED DEPOSITS" ,           0.07 , '02' , '2020' ),
( "RECURRING DEPOSITS" ,       0.06 , '02' , '2020' ),
( "PRIVILEGED" ,               0.08 , '02' , '2020' );


