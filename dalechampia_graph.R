rm(list=ls())
dale<-read.csv(file = "~/exam2022_part1.csv")
dalechampia<-na.omit(dale)
gland<-dalechampia$GA
species<-dalechampia$sp
treat<-dalechampia$treat

#getting the means of gland area by species and treatment
gd<- dalechampia %>%
  group_by(sp, treat) %>%
  summarise(GA=mean(GA))


ggplot(data=gd, aes(x=treat, y=GA, colour=sp))+
  geom_point(aes(shape=sp), size=3)+
  geom_line(aes(group=sp), size=1)+ theme_bw() + theme(aspect.ratio = 1,text = element_text(size=16)) + 
  labs(x="Treatment", y="Gland area (mm)")+
  theme(legend.position = c(0.85,0.878))+theme(legend.title=element_blank())+
  ylim(2,5) 
