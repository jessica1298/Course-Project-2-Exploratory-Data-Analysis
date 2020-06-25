# PLOT 4 ------------------------------------------------------------------
NEI <- readRDS("summarySCC_PM25.rds")
SCC<- readRDS("Source_Classification_Code.rds")
library(dplyr)
library(ggplot2)
coal_SCC <- SCC[grep("[Cc][Oo][Aa][Ll]", SCC$EI.Sector), "SCC"]
coal_NEI <- NEI %>% filter(SCC %in% coal_SCC)
sumyear <- coal_NEI %>% group_by(year) %>% summarise(sum(Emissions))
colnames(sumyear) <- c("year","Emissions")

png(filename = "plot4.png")
ggplot(sumyear, aes(x=year, y=Emissions, fill=year)) + geom_bar(stat="identity") +
  labs(title = "Coal Combustion Emissions 1999 to 2008")
dev.off()
