library(arules)
library(Matrix)
library(utf8)
library(plyr)

txn = read.transactions(file="C:/Users/Clair/machine_learning_sp20/dummy.csv", rm.duplicates=TRUE, format="basket", sep=",", cols=1);


rules <- apriori(txn, parameter = list(support=0.001, confidence=0.3))


rules<-sort(rules, by="count", decreasing=TRUE)
inspect(rules[1:5])

