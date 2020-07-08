library(datasets)
library(cluster)

stateData = state.x77

scaledState = scale(stateData)
myClusters = kmeans(scaledState, 6)

# Summary of the clusters
summary(myClusters)

# Centers (mean values) of the clusters
myClusters$centers

# Cluster assignments
myClusters$cluster

# Within-cluster sum of squares and total sum of squares across clusters
myClusters$withinss
myClusters$tot.withinss


# Plotting a visual representation of k-means clusters
clusplot(scaledState, myClusters$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)

myClusters$size

kVals <- c(0)
sqMean <- c(0)

for (i in 1:25) {
  myClusters = kmeans(scaledState, i)
  
  kVals[i - 1] <- i
  sqMean[i - 1] <- myClusters$tot.withinss
}

wss.data <- data.frame(kVals, sqMean)
plot(wss.data)

