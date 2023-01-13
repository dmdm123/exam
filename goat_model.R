rm(list=ls())
dat = read.table("exam2022_part2.txt", header=T)
mass<-dat$mass
sex<-dat$sex
dense<-dat$density


m1<-lm(mass~dense*sex)
m2<-lm(mass~dense+sex)
m3<-lm(mass~dense)
m4<-lm(mass~sex)
m5<-lm(mass~1)

mlist = list(m1, m2, m3, m4, m5)
AICTab = AIC(m1, m2, m3, m4, m5)
AICTab$logLik = unlist(lapply(mlist, logLik))
AICTab = AICTab[order(AICTab$AIC, decreasing=F),]
AICTab$delta = round(AICTab$AIC - min(AICTab$AIC), 2)
lh = exp(-0.5*AICTab$delta)
AICTab$w = round(lh/sum(lh), 2)
AICTab

