NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#question 4
library("ggplot2")
scc_ccs<-SCC[grep("Comb(.*)Coal", SCC$Short.Name), ]
NEI_ccs<-NEI[NEI$SCC %in% scc_ccs$SCC, ]
Year<-NEI_ccs[,6]
Emission<-NEI_ccs[,4]

png("plot4.png")
qplot(Year,Emission,data=NEI_ccs,geom=c("point","smooth"),xlab="Year",ylab="Emission from Coal Combustion related Source")
dev.off()

