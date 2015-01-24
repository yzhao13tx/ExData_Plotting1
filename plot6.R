NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#question 6
library("ggplot2")
scc_motor<-SCC[grep("[Vv]ehicle", SCC$SCC.Level.Three), ]

neibal<-NEI[NEI$fips=="24510" & NEI$SCC %in% scc_motor$SCC, ]
yearbal<-neibal[,6]
emissionbal<-neibal[,4]
p1<-data.frame(year=yearbal,emission=emissionbal)

neila<-NEI[NEI$fips=="06037" & NEI$SCC %in% scc_motor$SCC, ]
yearla<-neila[,6]
emissionla<-neila[,4]
p2<-data.frame(year=yearla,emission=emissionla)

png("plot6.png")

p <- ggplot() + 
  geom_line(data = p1, aes(x = year, y = emission, color = "Baltimore City")) +
 geom_line(data = p2, aes(x = year, y = emission, color = "Los Angelos"))  +
 xlab("year") +
 ylab("emission from Motor Vehicle")+labs(color="Legend")


print(p)
dev.off()




