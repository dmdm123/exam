rm(list=ls())
dale<-read.csv(file = "~/exam2022_part1.csv")
dalechampia<-na.omit(dale)
gland<-dalechampia$GA
species<-dalechampia$sp
treat<-dalechampia$treat

#anova
m<-lm(gland~species*treat)
anova(m)
summary(m)

#means of GA by species and treatment
means<- tapply(gland, list(species, treat), mean)
means
#treatment means
colMeans(means)
#species means
rowMeans(means)
