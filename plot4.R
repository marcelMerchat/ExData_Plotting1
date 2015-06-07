## plot4.R: 2 X 2 Plot Matrix

##install.packages("lubridate")
library(datasets)

## Optional steps to download and unzip data files
## fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip"
## download.file(fileUrl, dest="zipData.zip")
## unzip("zipData.zip", exdir=".")

## Read data from the first 69,516 data records 
df1 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 69516)

## Make data frame for February 1, 2007 and February 2, 2007
df2 <- df1[66637:69516,]
df2[,1] <- gsub("/2/", "/02/", df2[,1])
df2[,1] <- gsub("1/02/", "01/02/", df2[,1])
tdf <- paste(df2[,1],df2[,2]) 

##df2[,1] <- gsub("/2/", "/02/", df2[,1])
##df2[,1] <- gsub("1/02/", "01/02/", df2[,1])
##tdf <- paste(df2[,1],df2[,2]) 

x <- strptime(tdf, "%d/%m/%Y %H:%M:%S")
png = png(filename = "plot4.png", width = 480, height = 480, units = "px", pointsize = 9)
par(mfrow = c(2,2))

## Make plot of global active power
global_active_power <- (as.numeric(df2[,3]))/1000
xlims <- c("2007-02-01 00:00:00", "2007-02-03 00:00:00")  # example data
xlimits <- as.Date(xlims)  # new step to convert data

plot(x, global_active_power,
     type ="l", 
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     axes = TRUE, ps = 9)

## Make plot of voltage
voltage <- as.numeric(df2[,5])
xlims <- c("2007-02-01 00:00:00", "2007-02-03 00:00:00")  # example data
xlimits <- as.Date(xlims)  # new step to convert data

plot(x, voltage,
     type ="l", 
     xlab = "",
     ylab = "Voltage",
     axes = TRUE, ps = 9)

## Make histogram for global active power
x <- strptime(tdf, "%d/%m/%Y %H:%M:%S")

Sub_metering_1 <- as.numeric(df2[,7])
Sub_metering_2 <- as.numeric(df2[,8])
Sub_metering_3 <- as.numeric(df2[,9])

xlims <- c("2007-02-01 00:00:00", "2007-02-03 00:00:00")  # example data
xlimits <- as.Date(xlims)  # new step to convert data

plot(x, Sub_metering_1,
        type ="l", 
        xlab = "",
        ylab = "Energy sub metering",
        axes = TRUE, ps = 9)

points(x, Sub_metering_2,
     col = "red",
     type ="l", 
     ps = 12)

points(x, Sub_metering_3,
     col = "blue",
     type ="l", 
     ps = 12)

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       #text.width = strwidth("500,000"),
       lty = 1, xjust = 1, yjust = 1, text.font = 6, col = c(1,"red","blue"))

## Make plot of global reactive power
global_reactive_power <- as.numeric(df2[,4])
xlims <- c("2007-02-01 00:00:00", "2007-02-03 00:00:00")  # example data
xlimits <- as.Date(xlims)  # new step to convert data

plot(x, global_reactive_power,
     type ="l", 
     xlab = "",
     ylab = "Global_reactive_power",
     axes = TRUE, ps = 9)

dev.copy(png,"plot4.png")
## After the plot has been saved, the following error message is produced:
## "Error in dev.copy(png, "plot1.png") : 'device' should be a function"
dev.off()
