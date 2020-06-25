# plot 2 ------------------------------------------------------------------
NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS("Source_Classification_Code.rds")
basef <- NEI[NEI$fips =="24510",]
sumyear <- aggregate(basef$Emissions, by=list(basef$year), FUN=sum)


png(filename = "plot2.png")
plot(sumyear$Group.1, sumyear$x, type = "l", 
     main = "Total Emissions of PM2.5 in Baltimore City",
     ylab = "Total emissions of PM2.5 (tons)",
     xlab = "Year", col="blue", lwd=1.5)
dev.off()

