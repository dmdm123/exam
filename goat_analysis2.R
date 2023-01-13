rm(list=ls())
dat = read.table("exam2022_part2.txt", header=T)
mass<-dat$mass
age<-dat$age
left<-dat$hornL
right<-dat$hornR
horn<-c()

for (i in 1:length(left)) {
  horn[i]<- (left[i] + right[i])/2
}
dat$horn<-horn

#linear regression
m<-lm(horn~mass)
summary(m)
#increase of horn size by sd increase in mass 
coefs = summary(m)$coef
(coefs[2,1]*(mean(mass) + sd(mass))) - (coefs[2,1]*mean(mass))
#fitted models intercept
coefs[1,1]
#fitted models slope
coefs[2,1]
