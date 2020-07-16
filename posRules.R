library(arules)
library(Matrix)
library(utf8)
library(plyr)

csv_file <- read.csv(file="C:/Users/Clair/machine_learning_sp20/positive.csv", sep=",", stringsAsFactors = TRUE, na.strings = c("", "NA"),
                     encoding = "UTF-8", quote="", header=FALSE)

#Copy the index column and then remove it from the data frame
tid <- as.character(csv_file$V1)
csv_file <- csv_file[,-1]

#Make sure all other columns are discrete factors
for(i in 1:ncol(csv_file)) csv_file[[i]] <- as.factor(csv_file[[i]])

write.csv(csv_file,"C:/Users/Clair/machine_learning_sp20/pos_trans.csv", row.names = FALSE)

trans = read.transactions(file="C:/Users/Clair/machine_learning_sp20/pos_trans.csv", sep=",", 
                          rm.duplicates=TRUE, format="basket", encoding="UTF-8", quote="", header=FALSE)

#Most common of 4
rules <- apriori(trans, parameter = list(support=0.005, confidence=0.75, minlen=4, maxlen=4))
rules<-sort(rules, by="count", decreasing=TRUE)
inspect(rules[0:10])
df_count_rules = data.frame(
  lhs = labels(lhs(rules)),
  rhs = labels(rhs(rules)), 
  rules@quality)
rules<-sort(rules, by="confidence", decreasing=TRUE)
df_conf_rules = data.frame(
  lhs = labels(lhs(rules)),
  rhs = labels(rhs(rules)), 
  rules@quality)
write.csv(df_count_rules,"C:/Users/Clair/machine_learning_sp20/count_pos_4.csv", row.names = FALSE)
write.csv(df_conf_rules,"C:/Users/Clair/machine_learning_sp20/conf_pos_4.csv", row.names = FALSE)

#Most common of 5
rules <- apriori(trans, parameter = list(support=0.005, confidence=0.75, minlen=5, maxlen=5))
rules<-sort(rules, by="count", decreasing=TRUE)
df_count_rules = data.frame(
  lhs = labels(lhs(rules)),
  rhs = labels(rhs(rules)), 
  rules@quality)
rules<-sort(rules, by="confidence", decreasing=TRUE)
df_conf_rules = data.frame(
  lhs = labels(lhs(rules)),
  rhs = labels(rhs(rules)), 
  rules@quality)
write.csv(df_count_rules,"C:/Users/Clair/machine_learning_sp20/count_pos_5.csv", row.names = FALSE)
write.csv(df_conf_rules,"C:/Users/Clair/machine_learning_sp20/conf_pos_5.csv", row.names = FALSE)

#Most common of 6
rules <- apriori(trans, parameter = list(support=0.007, confidence=0.5, minlen=6, maxlen=6))
rules<-sort(rules, by="count", decreasing=TRUE)
df_count_rules = data.frame(
  lhs = labels(lhs(rules)),
  rhs = labels(rhs(rules)), 
  rules@quality)
rules<-sort(rules, by="confidence", decreasing=TRUE)
df_conf_rules = data.frame(
  lhs = labels(lhs(rules)),
  rhs = labels(rhs(rules)), 
  rules@quality)
write.csv(df_count_rules,"C:/Users/Clair/machine_learning_sp20/count_pos_6.csv", row.names = FALSE)
write.csv(df_conf_rules,"C:/Users/Clair/machine_learning_sp20/conf_pos_6.csv", row.names = FALSE)

#Most common of 7
rules <- apriori(trans, parameter = list(support=0.005, confidence=0.5, minlen=7, maxlen=7))
rules<-sort(rules, by="count", decreasing=TRUE)
df_count_rules = data.frame(
  lhs = labels(lhs(rules)),
  rhs = labels(rhs(rules)), 
  rules@quality)
rules<-sort(rules, by="confidence", decreasing=TRUE)
df_conf_rules = data.frame(
  lhs = labels(lhs(rules)),
  rhs = labels(rhs(rules)), 
  rules@quality)
write.csv(df_count_rules,"C:/Users/Clair/machine_learning_sp20/count_pos_7.csv", row.names = FALSE)
write.csv(df_conf_rules,"C:/Users/Clair/machine_learning_sp20/conf_pos_7.csv", row.names = FALSE)


