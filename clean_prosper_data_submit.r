library('dplyr')
library(ggplot2)
library(tidyr)
library('reshape2')
library(scales)
library(MASS)
library(scales)
library(memisc)
library(lattice)
library(RColorBrewer)
library(ggplot2)

getwd()
pr <- read.csv('~/prosperLoanData.csv')



pr <- subset(pr, select = c('LoanStatus',
                            'BorrowerAPR',
                            'BorrowerRate',
                            'LenderYield',
                            'ProsperScore',
                            'BorrowerState',
                            'Occupation',
                            'EmploymentStatus',
                            'IsBorrowerHomeowner',
                            'TotalCreditLinespast7years',
                            'TotalInquiries',
                            'BankcardUtilization',
                            'AvailableBankcardCredit',
                            'IncomeRange',
                            'IncomeVerifiable',
                            'LoanOriginalAmount',
                            'LoanOriginationDate',
                            'MonthlyLoanPayment',
                            'Investors'
))


range_list <- c('$0','$1-24,999','$25,000-49,999','$50,000-74,999',
                '$75,000-99,999',
                '$100,000+','Not employed','Not displayed')
pr$income_range <- factor(pr$IncomeRange,levels = range_list)



pr$available_bank_credit_bracket <- cut(pr$AvailableBankcardCredit/1000,
                                        breaks = seq(0, 15, by = 2))


pr$borrower_rate_bracket <- cut(pr$BorrowerRate * 100,
                                breaks = seq(0,40,5))


head(pr)

write.csv(write.csv(pr, "Prosper_Data_Cleaned.csv"))
