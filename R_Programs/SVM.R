library(e1071)
voweldata <- read.csv('C:/Users/Clair/machine_learning_sp20/R_Programs/vowel_context.data', head = FALSE)
letterdata <- read.csv('C:/Users/Clair/machine_learning_sp20/R_Programs/letter_recognition.data', head = FALSE)

indexvow <- 1:nrow(voweldata)
testvowindex <- sample(indexvow, trunc(length(indexvow)*30/100))
testvowset <- voweldata[testvowindex,]
trainvowset <- voweldata[-testvowindex,]

indexlet <- 1:nrow(letterdata)
testletindex <- sample(indexlet, trunc(length(indexlet)*30/100))
testletset <- letterdata[testletindex,]
trainletset <- letterdata[-testletindex,]

names(voweldata)
names(letterdata)

