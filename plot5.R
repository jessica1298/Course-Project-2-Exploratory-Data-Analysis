# PLOT 5 ------------------------------------------------------------------
NEI <- readRDS("summarySCC_PM25.rds")
SCC<- readRDS("Source_Classification_Code.rds")
library(dplyr)
library(ggplot2)
baltimore <- NEI[NEI$fips=="24510",]
scc_vehicles <- SCC[grep("[Vv]ehicle", SCC$EI.Sector), "SCC"]
balti <- baltimore %>% filter(SCC %in% scc_vehicles)
baltif <- balti %>% group_by(year) %>% summarise(sum(Emissions))
colnames(baltif) <- c("year","Emissions")

png(filename = "plot5.png")
ggplot(baltif, aes(x=year, y=Emissions)) + geom_line(col="red",lwd=0.8) +
  labs(title="Emissions from motor vehicle sources from 1999–2008 in Baltimore City")
dev.off()
