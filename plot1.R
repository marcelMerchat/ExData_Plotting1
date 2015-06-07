## plot1.R
library(datasets)

## Optional steps to download and unzip data files
## fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip"
## download.file(fileUrl, dest="zipData.zip")
## unzip("zipData.zip", exdir=".")

## Read data from the first 69,516 data records 
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 69516)

## Make data frame for February 1, 2007 and February 2, 2007
df2 <- df[66637:69516,]

## Make histogram for global active power  
global_active_power <- as.numeric(df2[,3])
hist(global_active_power)
png = png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12)
hist(global_active_power,
        breaks = c(0,500,1000,1500,2000,2500,3000,3500,4000,4500,5000,5500,6000),
        col ="red",
        density = NULL, 
        main = paste("Global Active Power"),
        xlab = "Global Active Power (kilowatts)",
        ylab = "Frequency",
        axes = TRUE, ps = 12)

dev.copy(png,"plot1.png")

## After the plot has been saved, the following error message is produced:
## "Error in dev.copy(png, "plot1.png") : 'device' should be a function"
dev.off()
