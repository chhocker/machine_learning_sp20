library(e1071)
library(caret)

voweldata <- read.csv("C:/Users/Clair/machine_learning_sp20/R_Programs/vowel.csv", header=TRUE)

allRows <- 1:nrow(voweldata)
testRows <- sample(allRows, trunc(length(allRows) * 0.3))

# The test set contains all the test rows
testset <- voweldata[testRows,]

# The training set contains all the other rows
trainset <- voweldata[-testRows,]

for (gam in c(0.002, 0.004, 0.005, 0.006, 0.008, 1, 1.5)) {
  
  model <- svm(factor(Class)~., data = trainset, kernel = "radial", gamma = gam, cost = 20, type = "C-classification")
  
  prediction <- predict(model, testset[,-13])
  
  confusionMatrix <- table(pred = prediction, true = testset$Class)
  
  agreement <- prediction == testset$Class
  accuracy <- prop.table(table(agreement))
  
  print(paste0("With a gamma of: ", gam))
  print(accuracy)
}

