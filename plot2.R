## plot2.R
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

## Make histogram for global active power

df2[,1] <- gsub("/2/", "/02/", df2[,1])
df2[,1] <- gsub("1/02/", "01/02/", df2[,1])

tdf <- paste(df2[,1],df2[,2]) 

xlabels <- as.Date(df2[,1], "%d/%m/%Y")
xtime <- as.Date(df2[,2], "%H:%M:%S")
x <- strptime(tdf, "%d/%m/%Y %H:%M:%S")
x0 <- x[1]
t_days = (x - x0)/(24*60*60)
week_day <- weekdays(x0 + t_days)

global_active_power <- (as.numeric(df2[,3]))/1000

xlims <- c("2007-02-01 00:00:00", "2007-02-03 00:00:00")  # example data
xlimits <- as.Date(xlims)  # new step to convert data

png = png(filename = "plot2.png", width = 480, height = 480, units = "px", pointsize = 12)
plot(x, global_active_power,
## Alternate plot(t_days, global_active_power,
        type ="l", 
        xlab = "",
        ylab = "Global Active Power (kilowatts)",
        axes = TRUE, ps = 12)

dev.copy(png,"plot2.png")

## After the plot has been saved, the following error message is produced:
## "Error in dev.copy(png, "plot1.png") : 'device' should be a function"
dev.off()
