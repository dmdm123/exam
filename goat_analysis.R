rm(list=ls())
dat = read.table("exam2022_part2.txt", header=T)
mass<-dat$mass
sex<-dat$sex
dense<-dat$density

#anova
m<-lm(mass~dense*sex)
anova(m)
summary(m)


means<- tapply(mass, list(dense, sex), mean)
means
#sex means
colMeans(means)
#density means
rowMeans(means)
