library(data.table)

Sys.setlocale()

## Read the file into a data frame
plot2DF <- read.table("../household_power_consumption.txt", sep=";",header=TRUE, na.strings="?")

## Cast Date column values as Date
plot2DF$Date <- as.Date(plot2DF$Date,"%d/%m/%Y")

## Subset the DF with the desired date range
plot2DF <- subset(plot2DF,plot2DF$Date == "2007-2-1" | plot2DF$Date == "2007-2-2")
xAxisDays <- strptime( paste(plot2DF$Date,plot2DF$Time), format="%Y-%m-%d %H:%M:%S")
## Create histogram on a screen device
with(plot2DF,plot(xAxisDays,plot2DF$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="l"))

## Copy the plot to a PNG file
dev.copy(png,file="figure/plot2.png",width=480,height=480)

## Close the device
dev.off()
