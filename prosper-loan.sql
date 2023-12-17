-- track loan book performance - disbursements, amount paid MOM, returns, debt-to-income ratio, loss rate

-- alter table prosper_loan_data.prosperloandata
-- modify LoanOriginationDate date;

select 
-- LoanOriginationDate,
date_format(LoanOriginationDate, '%Y-%m-01 00:00:00') as month,
date_format(LoanOriginationDate, '%Y') as year,
sum(LoanOriginalAmount) as total_dis,
round(sum(LP_CustomerPayments),0) as total_paid,
round(avg(EstimatedReturn),2) as profit,
round(avg(EstimatedLoss),2) as lossrate,
round(avg(DebtToIncomeRatio),2) as debtincome

from prosper_loan_data.prosperloandata
where LoanOriginationDate > '2009-12-31'
group by 1,2
order by 1;