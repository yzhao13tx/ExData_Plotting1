NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#question 3
library("ggplot2")

d1999<-NEI[NEI[,6]==1999 & NEI[,1] == "24510"&NEI[,5]=="POINT",]
d2002<-NEI[NEI[,6]==2002&NEI[,1] == "24510"&NEI[,5]=="POINT",]
d2005<-NEI[NEI[,6]==2005&NEI[,1] == "24510"&NEI[,5]=="POINT",]
d2008<-NEI[NEI[,6]==2008&NEI[,1] == "24510"&NEI[,5]=="POINT",]
total<-c(sum(d1999[,4]),sum(d2002[,4]),sum(d2005[,4]),sum(d2008[,4]))
POINT=data.frame(pm2.5=total,year=c(1999,2002,2005,2008),type="POINT")

d1999<-NEI[NEI[,6]==1999 & NEI[,1] == "24510"&NEI[,5]=="NONPOINT",]
d2002<-NEI[NEI[,6]==2002&NEI[,1] == "24510"&NEI[,5]=="NONPOINT",]
d2005<-NEI[NEI[,6]==2005&NEI[,1] == "24510"&NEI[,5]=="NONPOINT",]
d2008<-NEI[NEI[,6]==2008&NEI[,1] == "24510"&NEI[,5]=="NONPOINT",]
total<-c(sum(d1999[,4]),sum(d2002[,4]),sum(d2005[,4]),sum(d2008[,4]))
NONPOINT=data.frame(pm2.5=total,year=c(1999,2002,2005,2008),type="NONPOINT")

d1999<-NEI[NEI[,6]==1999 & NEI[,1] == "24510"&NEI[,5]=="ON-ROAD",]
d2002<-NEI[NEI[,6]==2002&NEI[,1] == "24510"&NEI[,5]=="ON-ROAD",]
d2005<-NEI[NEI[,6]==2005&NEI[,1] == "24510"&NEI[,5]=="ON-ROAD",]
d2008<-NEI[NEI[,6]==2008&NEI[,1] == "24510"&NEI[,5]=="ON-ROAD",]
total<-c(sum(d1999[,4]),sum(d2002[,4]),sum(d2005[,4]),sum(d2008[,4]))
ONROAD=data.frame(pm2.5=total,year=c(1999,2002,2005,2008),type="ONROAD")

d1999<-NEI[NEI[,6]==1999 & NEI[,1] == "24510"&NEI[,5]=="NON-ROAD",]
d2002<-NEI[NEI[,6]==2002&NEI[,1] == "24510"&NEI[,5]=="NON-ROAD",]
d2005<-NEI[NEI[,6]==2005&NEI[,1] == "24510"&NEI[,5]=="NON-ROAD",]
d2008<-NEI[NEI[,6]==2008&NEI[,1] == "24510"&NEI[,5]=="NON-ROAD",]
total<-c(sum(d1999[,4]),sum(d2002[,4]),sum(d2005[,4]),sum(d2008[,4]))
NONROAD=data.frame(pm2.5=total,year=c(1999,2002,2005,2008),type="NONROAD")

all=rbind(POINT,NONPOINT,ONROAD,NONROAD)
png("plot3.png")
qplot(year,pm2.5,data=all,geom=c("line","point"),color=type)
dev.off()
