# Part 1
# load the data
Credit = read.csv("D:/comp2020/424/Credit.csv",header=TRUE,row.names=1)
head(Credit)
dim(Credit)
summary(Credit)

X =model.matrix(Balance~.*., Credit)[,-1]
y =Credit$Balance
head(X)
dim(X)

# generate the training and test sets
set.seed(12345)
train = sample(1:nrow(X),nrow(X)/2)
test = -train
dim(Credit[train,])
dim(Credit[test,])

library("glmnet")
grid = 10^seq(3, -1, length=100)

# cross-validation for ridge regression
set.seed(12345)
cv.out = cv.glmnet(X[train,],y[train],alpha=0,lambda=grid,nfolds=10,thresh = 1e-10)
cv.out$lambda.min
bestlam=cv.out$lambda.min
ridge.pred = predict(cv.out,s=bestlam,newx=X[test,])
mean((ridge.pred-y[test])^2)

# cross-validation for lasso
set.seed(12345)
cv.out = cv.glmnet(X[train,],y[train],alpha=1,lambda=grid,nfolds=10,thresh = 1e-10)
cv.out$lambda.min
bestlam=cv.out$lambda.min
lasso.pred = predict(cv.out,s=bestlam,newx=X[test,])
mean((lasso.pred-y[test])^2)
out=glmnet (X,y,alpha =1, lambda =grid)
lasso.coef=predict (out,type ="coefficients",s=bestlam)[1:66,]
lasso.coef[lasso.coef!=0]
length(lasso.coef[lasso.coef!=0])-1

# linear regression
set.seed(12345)
train = sample(1:nrow(X),nrow(X)/2)
test = -train
linear.mod = lm(y[train]~X[train,])
linear.pred = coef(linear.mod)[1]+X[test,] %*% coef(linear.mod)[-1]
mean((linear.pred-y[test])^2)


#plot a comparison of the test predictions for three models
plot(y[test],linear.pred,ylim=c(-400,1700),xlab="y_test",ylab="predicted")
points(y[test],ridge.pred,col="blue")
points(y[test],lasso.pred,col="orange")
abline(0,1)

warnings('off')

# Part 2
# Q2.1
options(warn = -1)
Credit = read.csv("D:/comp2020/424/Credit.csv",header=TRUE,row.names=1)
X =model.matrix(Balance~.*., Credit)[,-1]
y =Credit$Balance
dim(X)
set.seed(123456)
library(gam)
train = sample(1:nrow(Credit),nrow(Credit)/2)
test = -train

gam.mod1 = gam(Balance~ ns(Income,df=4)+ ns(Age,df=1)+Student,data=Credit[train,])
gam.mod2 = gam(Balance~ns(Income,df=4)+ns(Age,df=2)+Student,data=Credit[train,])
gam.mod3 = gam(Balance~ns(Income,df=4)+ns(Age,df=3)+Student,data=Credit[train,])
gam.mod4 = gam(Balance~ ns(Income,df=4)+ ns(Age,df=4)+Student,data=Credit[train,])
gam.mod5 = gam(Balance~ns(Income,df=4)+ns(Age,df=5)+Student,data=Credit[train,])
gam.mod6 = gam(Balance~ns(Income,df=4)+ns(Age,df=6)+Student,data=Credit[train,])
gam.mod7 = gam(Balance~ns(Income,df=4)+ns(Age,df=7)+Student,data=Credit[train,])
gam.mod8 = gam(Balance~ns(Income,df=4)+ns(Age,df=8)+Student,data=Credit[train,])
gam.mod9 = gam(Balance~ns(Income,df=4)+ns(Age,df=9)+Student,data=Credit[train,])
gam.mod10 = gam(Balance~ns(Income,df=4)+ns(Age,df=10)+Student,data=Credit[train,])

pred.mod1 = predict(gam.mod1,newdata=Credit[test,])
pred.mod2 = predict(gam.mod2,newdata=Credit[test,])
pred.mod3 = predict(gam.mod3,newdata=Credit[test,])
pred.mod4 = predict(gam.mod4,newdata=Credit[test,])
pred.mod5 = predict(gam.mod5,newdata=Credit[test,])
pred.mod6 = predict(gam.mod6,newdata=Credit[test,])
pred.mod7 = predict(gam.mod7,newdata=Credit[test,])
pred.mod8 = predict(gam.mod8,newdata=Credit[test,])
pred.mod9 = predict(gam.mod9,newdata=Credit[test,])
pred.mod10 = predict(gam.mod10,newdata=Credit[test,])

mse1 = mean((pred.mod1-Credit $Balance[test])^2)
mse2 = mean((pred.mod2-Credit $Balance[test])^2)
mse3 = mean((pred.mod3-Credit $Balance[test])^2)
mse4 = mean((pred.mod4-Credit $Balance[test])^2)
mse5 = mean((pred.mod5-Credit $Balance[test])^2)
mse6 = mean((pred.mod6-Credit $Balance[test])^2)
mse7 = mean((pred.mod7-Credit $Balance[test])^2)
mse8 = mean((pred.mod8-Credit $Balance[test])^2)
mse9 = mean((pred.mod9-Credit $Balance[test])^2)
mse10 = mean((pred.mod10-Credit $Balance[test])^2)

c(mse1,mse2,mse3,mse4,mse5,mse6,mse7,mse8,mse9,mse10)
y1= c(mse1,mse2,mse3,mse4,mse5,mse6,mse7,mse8,mse9,mse10)
x1= c(1,2,3,4,5,6,7,8,9,10)
plot(x1,y1,type = "o",pch = 15,col = "red", main = "The Natural Spline",
     xlab = "Degrees of freedom - Age",ylab = "The test mean squared error")

# Q2.2
gam.mod4 = gam(Balance~ ns(Income,df=4)+ ns(Age,df=4)+ Student,data=Credit[train,])
par(mfrow=c(1,3))
plot(gam.mod4,col="orange",lwd=2)

# need to modify
ns.fit=lm(Balance~ ns(Age,df=4),data=Credit[train,])
#Age.grid = seq(min(Age),max(Age),10)
age.grid = seq(20,100,10)
ns.pred = predict(ns.fit,newdata=list(Age=age.grid))
#plot(Age,Balance, cex.lab=1.5,col="darkgrey")
plot(Balance~Age,cex.lab=1.5,col="darkgrey")
lines(age.grid,ns.pred,col="blue",lwd=2)


# Q2.3
sqrt(mse4)
median(Credit$Balance)

# Part 3 parkinsons
# load the data
set.seed(123456789)
Parkinsons = read.csv("D:/comp2020/424/parkinsons.csv",header=TRUE,row.names=1)
X =model.matrix(UPDRS~., Credit)[,-1]
y =Parkinsons$UPDRS
X = scale(X)
train = sample(1:nrow(X), 30)
test = -train
dim(Parkinsons[train,])
dim(Parkinsons[test,])
linear.mod = lm(y[train]~X[train,])
summary(linear.mod)

# lasso -LOOCV
library("glmnet")
grid = 10^seq(3, -1, length=100)
cv.out = cv.glmnet(X[train,],y[train],alpha=1,lambda=grid,nfolds=30,thresh = 1e-10)
cv.out$lambda.min
bestlam=cv.out$lambda.min
lasso.pred = predict(cv.out,s=bestlam,newx=X[test,])
mean((lasso.pred-y[test])^2)
plot(cv.out)

out=glmnet (X,y,alpha =1, lambda =grid)
lasso.coef=predict (out,type ="coefficients",s=bestlam)[1:98,]
lasso.coef[lasso.coef!=0]

# a different random split
train = sample(1:nrow(X), 35)
test = -train
dim(Parkinsons[train,])
dim(Parkinsons[test,])
linear.mod = lm(y[train]~X[train,])

library("glmnet")
grid = 10^seq(3, -1, length=100)
cv.out = cv.glmnet(X[train,],y[train],alpha=1,lambda=grid,nfolds=30,thresh = 1e-10)
cv.out$lambda.min
bestlam=cv.out$lambda.min
lasso.pred = predict(cv.out,s=bestlam,newx=X[test,])
mean((lasso.pred-y[test])^2)

out=glmnet (X,y,alpha =1, lambda =grid)
lasso.coef=predict (out,type ="coefficients",s=bestlam)[1:98,]
lasso.coef[lasso.coef!=0]

