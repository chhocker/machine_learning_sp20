library(arules)
library(Matrix)
library(utf8)
library(plyr)


txn = read.transactions(file="C:/Users/Clair/machine_learning_sp20/neg_list_small.csv", rm.duplicates=TRUE, format="basket", sep=",", 
                        cols=1, encoding="UTF-8")


rules <- apriori(txn, parameter = list(support=0.001, confidence=0.7, minlen=3))


rules<-sort(rules, by="confidence", decreasing=TRUE)
inspect(rules[0:50])

