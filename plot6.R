# PLOT 6 -------------------------------------------------------------------
NEI <- readRDS("summarySCC_PM25.rds")
SCC<- readRDS("Source_Classification_Code.rds")
library(dplyr)
library(ggplot2)
require(gridExtra)
LA <- NEI[NEI$fips == "06037",]
baltimore <- NEI[NEI$fips=="24510",]
baltimoref <- baltimore %>% group_by(year) %>% summarise(sum(Emissions))
colnames(baltimoref) <- c("year","Emissions")
LAF <- LA %>% group_by(year) %>% summarise(sum(Emissions))
colnames(LAF) <- c("year","Emissions")

png(filename = "plot6.png")
plot1 <- ggplot(baltimoref,aes(x=year,y=Emissions, fill=year)) + geom_bar(stat='identity') + labs(title="Baltimore")
plot2 <- ggplot(LAF,aes(x=year,y=Emissions, fill=year)) + geom_bar(stat='identity') + labs(title=" The Angeles County")
grid.arrange(plot1, plot2, ncol=2)
dev.off()
