library("UScensus2010")
library("UScensus2010cdp")
library(ggplot2)
library(patchwork)

#Importing data
data("oregon.cdp10")

#Making age group list 
age.grp<-c("15-24","25-34","35-44","45-54","55-59","60-64","65-74","75-84","85+")

#Any city in oregon
portland<-city(name="portland",state="or")

portland.age<-dplyr::select(portland@data, H0170003:H0170011)
portland.age<- as.data.frame(t(portland.age))

df1<-c()
df1<-cbind(df1,age.grp)
df1<-cbind(df1,portland.age)

p<-ggplot(data=df1,aes(x=age.grp,y=oregon.cdp10_115)) + 
  geom_bar(stat="identity",fill="cyan")+
  xlab("Age Group(in years)")+
  ylab("population")+
  ggtitle("Portland")+
  theme_minimal()

#capital of oregon
salem<-city(name="salem",state = "or")
salem.age<-dplyr::select(salem@data, H0170003:H0170011)
salem.age<- as.data.frame(t(salem.age))
df2<-c()
df2<-cbind(df2,age.grp)
df2<-cbind(df2,salem.age)
p1<-ggplot(data=df2,aes(x=age.grp,y=oregon.cdp10_29)) + 
  geom_bar(stat="identity",fill="orange")+
  xlab("Age Group(in years)")+
  ylab("population")+
  ggtitle("Salem")+
  theme_minimal()

patchwork <-p+p1
patchwork+plot_annotation(
  title="Age pyramid using the 2010 census data",
  subtitle = "Comparision between Portand and Salem"
)
