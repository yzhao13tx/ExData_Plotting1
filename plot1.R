
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# question 1
d1999<-NEI[NEI[,6]==1999,]
d2002<-NEI[NEI[,6]==2002,]
d2005<-NEI[NEI[,6]==2005,]
d2008<-NEI[NEI[,6]==2008,]
total<-c(sum(d1999[,4]),sum(d2002[,4]),sum(d2005[,4]),sum(d2008[,4]))
png("plot1.png")
plot(total~c(1999,2002,2005,2008),type='l',ylab="total PM2.5",xlab="year")
dev.off()

