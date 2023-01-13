#model selection
dalechampia<-read.csv(file = "~/exam2022_part1.csv")
gland<-dalechampia$GA
species<-dalechampia$sp
treat<-dalechampia$treat

m1<-lm(gland~species*treat)
m2<-lm(gland~species+treat)
m3<-lm(gland~species)
m4<-lm(gland~treat)
m5<-lm(gland~1)

mlist = list(m1, m2, m3, m4, m5)
AICTab = AIC(m1, m2, m3, m4, m5)
AICTab$logLik = unlist(lapply(mlist, logLik))
AICTab = AICTab[order(AICTab$AIC, decreasing=F),]
AICTab$delta = round(AICTab$AIC - min(AICTab$AIC), 2)
lh = exp(-0.5*AICTab$delta)
AICTab$w = round(lh/sum(lh), 2)
AICTab



