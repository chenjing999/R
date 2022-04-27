# Part 4
library(ISLR)
nci.data = NCI60$data
dim(nci.data)

X = scale(t(nci.data))
P = X %*% prcomp(X)$rotation

hc1 = hclust(dist(X), method ="complete")
par(mfrow = c(1,3))
#plot(hc1,main ="Complete Linkage", xlab="", sub ="",cex =.9)

table(cutree(hc1,3))
table(cutree(hc1,4))
table(cutree(hc1,5))
table(cutree(hc1,6))
Cols=function(vec){
  cols=rainbow (length (unique(vec)))
  return (cols[as.numeric(as.factor(vec))])
}
par(mfrow = c(2,2))
plot(P[,1:2], col =Cols(cutree(hc1,3)),pch =19, main ="3 clusters",xlab ="PC1",ylab="PC2")
plot(P[,1:2], col =Cols(cutree(hc1,4)),pch =19, main ="4 clusters",xlab ="PC1",ylab="PC2")
plot(P[,1:2], col =Cols(cutree(hc1,5)),pch =19, main ="5 clusters",xlab ="PC1",ylab="PC2")
plot(P[,1:2], col =Cols(cutree(hc1,6)),pch =19, main ="6 clusters",xlab ="PC1",ylab="PC2")

cd=as.dist(1-cor(t(X)))
hc2 = hclust(cd)
# plot(hc1, main=" ", xlab="", sub ="")
table(cutree(hc2,3))
table(cutree(hc2,4))
table(cutree(hc2,5))
table(cutree(hc2,6))
par(mfrow = c(2,2))
plot(P[,1:2], col =Cols(cutree(hc2,3)),pch =19, main ="3 clusters",xlab ="PC1",ylab="PC2")
plot(P[,1:2], col =Cols(cutree(hc2,4)),pch =19, main ="4 clusters",xlab ="PC1",ylab="PC2")
plot(P[,1:2], col =Cols(cutree(hc2,5)),pch =19, main ="5 clusters",xlab ="PC1",ylab="PC2")
plot(P[,1:2], col =Cols(cutree(hc2,6)),pch =19, main ="6 clusters",xlab ="PC1",ylab="PC2")

km3 = kmeans(X,3,nstart=50)
table(km3$cluster)
km4 = kmeans(X,4,nstart=50)
table(km4$cluster)
km5 = kmeans(X,5,nstart=50)
table(km5$cluster)
km6 = kmeans(X,6,nstart=50)
table(km6$cluster)
par(mfrow = c(2,2))
plot(P[,1:2], col =Cols(km3$cluster),pch =19, main ="3 clusters",xlab ="PC1",ylab="PC2")
plot(P[,1:2], col =Cols(km4$cluster),pch =19, main ="4 clusters",xlab ="PC1",ylab="PC2")
plot(P[,1:2], col =Cols(km5$cluster),pch =19, main ="5 clusters",xlab ="PC1",ylab="PC2")
plot(P[,1:2], col =Cols(km6$cluster),pch =19, main ="6 clusters",xlab ="PC1",ylab="PC2")

# compare three methods
par(mfrow=c(1,3))
plot(P[,1:2], col =Cols(cutree(hc1,3)),pch =19, main ="3 clusters HC-Eucl-Complete",xlab ="PC1",ylab="PC2")
plot(P[,1:2], col =Cols(cutree(hc2,3)),pch =19, main ="3 clusters HC-Corr-Complete",xlab ="PC1",ylab="PC2")
plot(P[,1:2], col =Cols(km3$cluster),pch =19, main ="3 clusters K-means",xlab ="PC1",ylab="PC2")

par(mfrow=c(1,3))
plot(P[,1:2], col =Cols(cutree(hc1,4)),pch =19, main ="4 clusters HC-Eucl-Complete",xlab ="PC1",ylab="PC2")
plot(P[,1:2], col =Cols(cutree(hc2,4)),pch =19, main ="4 clusters HC-Corr-Complete",xlab ="PC1",ylab="PC2")
plot(P[,1:2], col =Cols(km4$cluster),pch =19, main ="4 clusters K-means",xlab ="PC1",ylab="PC2")

par(mfrow=c(1,3))
plot(P[,1:2], col =Cols(cutree(hc1,5)),pch =19, main ="5 clusters HC-Eucl-Complete",xlab ="PC1",ylab="PC2")
plot(P[,1:2], col =Cols(cutree(hc2,5)),pch =19, main ="5 clusters HC-Corr-Complete",xlab ="PC1",ylab="PC2")
plot(P[,1:2], col =Cols(km5$cluster),pch =19, main ="5 clusters K-means",xlab ="PC1",ylab="PC2")

par(mfrow=c(1,3))
plot(P[,1:2], col =Cols(cutree(hc1,6)),pch =19, main ="6 clusters HC-Eucl-Complete",xlab ="PC1",ylab="PC2")
plot(P[,1:2], col =Cols(cutree(hc2,6)),pch =19, main ="6 clusters HC-Corr-Complete",xlab ="PC1",ylab="PC2")
plot(P[,1:2], col =Cols(km6$cluster),pch =19, main ="6 clusters K-means",xlab ="PC1",ylab="PC2")
