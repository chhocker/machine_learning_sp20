library(e1071)
library(caret)
letterdata <- read.csv('C:/Users/Clair/machine_learning_sp20/R_Programs/letters.csv', head = TRUE)

allRows <- 1:nrow(letterdata)
testRows <- sample(allRows, trunc(length(allRows) * 0.3))

# The test set contains all the test rows
testset <- letterdata[testRows,]

# The training set contains all the other rows
trainset <- letterdata[-testRows,]

for (gam in c(0.006, 0.008, 1, 1.5)) {
  
  model <- svm(factor(letter)~., data = trainset, kernel = "radial", gamma = gam, cost = 15, type = "C-classification")
  
  prediction <- predict(model, testset[,-1])
  confusionMatrix <- table(pred = prediction, true = testset$letter)
  
  agreement <- prediction == testset$letter
  accuracy <- prop.table(table(agreement))
  
  print(paste0("With a gamma of: ", gam))
  print(accuracy)
}


