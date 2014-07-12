library(data.table)

Sys.setlocale()

## Read the file into a data frame
plot1DF <- read.table("../household_power_consumption.txt", sep=";",header=TRUE, na.strings="?")

## Cast Date column values as Date
plot1DF$Date <- as.Date(plot1DF$Date,"%d/%m/%Y")

## Subset the DF with the desired date range
plot1DF <- subset(plot1DF,plot1DF$Date == "2007-2-1" | plot1DF$Date == "2007-2-2")

## Create histogram on a scren device
with(plot1DF,hist(plot1DF$Global_active_power,xlab="Global Active Power (kilowatts)", col="red",main="Global Active Power"))

## Copy the plot to a PNG file
dev.copy(png,file="figure/plot1.png",width=480,height=480)

## Close the device
dev.off()
