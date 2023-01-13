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

ggplot(dat, aes(x=mass, y=horn))+
  geom_point(size=1)+
  geom_smooth(method=lm, se=FALSE, fullrange=TRUE, color="steelblue2")+
  theme_bw() + theme(aspect.ratio = 1,text = element_text(size=16)) + 
  labs(x="Body mass (kg)", y="Horn length (mm)")
