#We are going to do some basic VAR modeling
#First we will import the MTS library
library(MTS)

#We will use the Euro Stock Markets dataset
#Contains the daily closing prices of major European stock indices: 
#Germany DAX (Ibis), Switzerland SMI, France CAC, and UK FTSE.
eurostocks = diffM(EuStockMarkets)

#Here we are plotting the dataset
plot.ts(eurostocks)

#Now we are going to do our lag order identification
#We import the vars library
library(vars)
VARselect(eurostocks, type = 'none', lag.max = 10)
#The selection tells you which lag is the best choice
#For AIC it's 9. For HQ it's 1. For SC it's 1, and for FPE it's 9
#In general we use the AIC criteria

#Here we will build a VAR model using vars
eurovar <- vars::VAR(eurostocks,
                     lag.max = 10, 
                     ic = 'AIC',
                     type = 'none')

summary(eurovar)
