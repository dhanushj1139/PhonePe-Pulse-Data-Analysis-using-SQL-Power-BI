--home
--total amount
select sum(amount) as total_payment from All_transactions
where Payment_Status='successful'
--total transactions
select count(transaction_id) from All_transactions
--sucessful transactions 
select count(transaction_id) from All_transactions
where Payment_Status='successful'
--failed transactions
select * from All_transactions
where  Payment_Status<>'successful' and Reason <>'successful'
--failed payment reason's
select Reason,count(transaction_id) as total_count from All_transactions
group by Reason
having Reason<>'Successful'
--monthly wise payments
select datename(MONTH,date) as month_name,sum(amount) as total_amount from All_transactions
where Payment_Status not in ('failed','Server error','Wrong PIN','Insufficient amount')
group by datename(MONTH,date)

--service wise payments
select Service,sum(amount) as amount from All_transactions
where Payment_Status='successful'
group by Service

--insurence page
--total amount for insurence
select sum(amount) as total_amount from All_transactions
where Service='Insurance' 

--payment status
select payment_status,count(transaction_id) as total_count from All_transactions
where Service='Insurance'
group by payment_status

--failed process payments
select reason,count(transaction_id) as total_count from All_transactions
where Service='Insurance'
group by reason
having reason<>'Successful'

--mothly wise payment in insurence
select sum(total_amount)
from(select datename(MONTH,date) as month_name,sum(amount) as total_amount from All_transactions
where Payment_Status='successful' and Service='Insurance'
group by datename(MONTH,date)) t

--total transactions by each category
select service_type,sum(amount) as total_amount from All_transactions
where Service='Insurance' and Payment_Status='successful'
group by service_type
--loan page
--total amount for insurence
select sum(amount) as total_amount from All_transactions
where Service='loans'and Payment_Status='successful'


--payment status
select payment_status,count(transaction_id) as total_count from All_transactions
where Service='Insurance'
group by payment_status

--failed process payments
select reason,count(transaction_id) as total_count from All_transactions
where Service='loans'
group by reason
having reason<>'Successful'

--mothly wise payment in insurence
select datename(MONTH,date) as month_name,sum(amount) as total_amount from All_transactions
where Payment_Status='successful' and Service='loans'
group by datename(MONTH,date)

--total transactions by each category
select service_type,sum(amount) as total_amount from All_transactions
where Service='loans' and Payment_Status='successful'
group by service_type
order by sum(amount) desc



--Money_Transfer page
--total amount for insurence
select sum(amount) as total_amount from All_transactions
where Service='Money_Transfer'


--payment status
select payment_status,count(transaction_id) as total_count from All_transactions
where Service='Money_Transfer'
group by payment_status

--failed process payments
select reason,count(transaction_id) as total_count from All_transactions
where Service='Money_Transfer'
group by reason
having reason<>'Successful'

--mothly wise payment in insurence
select datename(MONTH,date) as month_name,sum(amount) as total_amount from All_transactions
where Payment_Status='successful' and Service='Money_Transfer'
group by datename(MONTH,date)

--total transactions by each category
select service_type,sum(amount) as total_amount from All_transactions
where Service='Money_Transfer' and Payment_Status='successful'
group by service_type


--Recharge_Bills page
--total amount for insurence
select sum(amount) as total_amount from All_transactions
where Service='Recharge_Bills'


--payment status
select payment_status,count(transaction_id) as total_count from All_transactions
where Service='Recharge_Bills'
group by payment_status

--failed process payments
select reason,count(transaction_id) as total_count from All_transactions
where Service='Recharge_Bills'
group by reason
having reason<>'Successful'

--mothly wise payment in insurence
select datename(MONTH,date) as month_name,sum(amount) as total_amount from All_transactions
where Payment_Status='successful' and Service='Recharge_Bills'
group by datename(MONTH,date)

--total transactions by each category
select service_type,sum(amount) as total_amount from All_transactions
where Service='Recharge_Bills' and Payment_Status='successful'
group by service_type
