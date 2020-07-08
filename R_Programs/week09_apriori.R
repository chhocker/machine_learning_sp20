library(arules)
library(Matrix)
data(Groceries)

inspect(head(Groceries))

itemFrequencyPlot(Groceries,topN=20,type="absolute")

rules <- apriori(Groceries, parameter = list(supp = 0.001, conf = 0.7))

options(digits=2)
#rules<-sort(rules, by="confidence", decreasing=TRUE)
#print("Highest confidence")
#inspect(rules[1:5])

print("Highest Support")

rules <- apriori (data=Groceries, parameter=list (supp=0.001, conf = 0.7), appearance = list(none = c("whole milk", "yogurt"), default="both"))
                                                                                             
rules<-sort(rules, by="count", decreasing=TRUE)
inspect(rules[1:8])
