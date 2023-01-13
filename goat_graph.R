rm(list=ls())
dat = read.table("exam2022_part2.txt", header=T)
mass<-dat$mass
sex<-dat$sex
dense<-dat$density

ggplot(dat, aes(x=dense, y=mass))+
  geom_boxplot(aes(fill=sex))+ 
  labs(x="Population density", y="Body mass (kg)")+theme_bw()+
  theme(aspect.ratio = 1, text = element_text(size=16))+
  theme(legend.position = c(0.9,0.94))+theme(legend.title=element_blank())
