# PLOT 3 ------------------------------------------------------------------
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
base_baltimore <- NEI[NEI$fips=="24510",]
sumyear <- aggregate(base_baltimore$Emissions, by=list(base_baltimore$year, base_baltimore$type),
                     FUN=sum)
png(filename = "plot3.png")
ggplot(sumyear, aes(x=Group.1, y=x, group = Group.2, colour =Group.2 )) +
  geom_line()  +
  geom_point( size=2, shape=21, fill="white") +
  theme_minimal() + labs(x = "year", y="Emmisions",
                         title="Emissions for year in Baltimore City")
dev.off()
