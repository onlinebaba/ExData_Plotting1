library(data.table)

Sys.setlocale()

## Read the file into a data frame
plot3DF <- read.table("../household_power_consumption.txt", sep=";",header=TRUE, na.strings="?")

## Cast Date column values as Date
plot3DF$Date <- as.Date(plot3DF$Date,"%d/%m/%Y")

## Subset the DF with the desired date range
plot3DF <- subset(plot3DF,plot3DF$Date == "2007-2-1" | plot3DF$Date == "2007-2-2")
xAxisDays <- strptime( paste(plot3DF$Date,plot3DF$Time), format="%Y-%m-%d %H:%M:%S")

## Create line chart at a time on a screen device for each sub metering type
plot(xAxisDays, plot3DF$Sub_metering_1, ylab="Energy Sub Metering", xlab="", type="n")
points(xAxisDays, plot3DF$Sub_metering_1, type="l", col="black")
points(xAxisDays, plot3DF$Sub_metering_2, type="l", col="red")
points(xAxisDays, plot3DF$Sub_metering_3, type="l", col="blue")

# Add Legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= "solid",col = c("black", "red", "blue"), cex=0.6)

## Copy the plot to a PNG file
dev.copy(png,file="figure/plot3.png",width=480,height=480)

## Close the device
dev.off()
