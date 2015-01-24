NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#question 5
library("ggplot2")
scc_motor<-SCC[grep("[Vv]ehicle", SCC$SCC.Level.Three), ]
NEI_motor<-NEI[NEI$fips=="24510" & NEI$SCC %in% scc_motor$SCC, ]
Year<-NEI_motor[,6]
Emission<-NEI_motor[,4]

png("plot5.png")
qplot(Year,Emission,data=NEI_motor,geom=c("point"),xlab="Year",ylab="Emission from Motor Vehicle in Baltimore City")
dev.off()

