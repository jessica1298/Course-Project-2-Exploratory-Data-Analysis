# Lectura base de datos ---------------------------------------------------
NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS("Source_Classification_Code.rds")
library(tidyverse)
sumyear <- aggregate(NEI$Emissions, by=list(NEI$year), FUN=sum)

png(filename = "plot1.png")
plot(sumyear$Group.1, sumyear$x, type = "l", 
     main = "Total Emissions of PM2.5 in Baltimore City",
     ylab = "Total emissions of PM2.5 (tons)",
     xlab = "Year", col="red", lwd=1.5)
dev.off()
