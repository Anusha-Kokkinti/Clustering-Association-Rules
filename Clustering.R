# setup working directory
# make sure that you put all three csv files in the same folder, which is the file path
setwd ("C:/Users/HP/Desktop/Sem 3/665 -Big Data Analytics/Class 12")


# Part One
Iris <- read.csv  
head(Iris)

# Exclude Id column
Iris.feature<-Iris[,-1]
head(Iris.feature)

set.seed(7)
km1 = kmeans(Iris.feature, 2, nstart=100)
km1
plot(Iris.feature, col =(km1$cluster +1) , main="K-Means result with 2 clusters", pch=20, cex=2)


# Check for the optimal number of clusters given the data 

mydata <- Iris.feature
wss <- (nrow(mydata)-1)*sum(apply(mydata,2,var))
for (i in 2:15) wss[i] <- sum(kmeans(mydata,
                                     centers=i)$withinss)
plot(1:15, wss, type="b", xlab="Number of Clusters",
     ylab="Within groups sum of squares",
     main="Assessing the Optimal Number of Clusters with the Elbow Method",
     pch=20, cex=2)


# Perform K-Means with the optimal number of clusters identified from the Elbow method
set.seed(7)
km2 = kmeans(Iris.feature, 3, nstart=100)

# Examine the result of the clustering algorithm
km2

# Plot results
plot(Iris.feature, col =(km2$cluster +1) , main="K-Means result with 3 clusters", pch=20, cex=2)


# Part Two
# Hierarchical Clustering
# Create distance matrix
d <- dist(Iris.feature,method="euclidean")
fit <- hclust(d)

#display dendogram
plot(fit)

#cut tree into 3 clusters
groups <- cutree(fit, k=3)
#draw dendogram with red borders around the 3 clusters
rect.hclust(fit,k=3,border="red")

