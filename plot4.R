library(data.table)

Sys.setlocale()

###### Read the file into a data frame ######
plot4DF <- read.table("../household_power_consumption.txt", sep=";",header=TRUE, na.strings="?")

###### Cast Date column values as Date ######
plot4DF$Date <- as.Date(plot4DF$Date,"%d/%m/%Y")

###### Subset the DF with the desired date range ######
#plot4DF <- subset(plot4DF,plot4DF$Date == "2007-2-1" | plot4DF$Date == "2007-2-2")
xAxisDays <- strptime( paste(plot4DF$Date,plot4DF$Time), format="%Y-%m-%d %H:%M:%S")

###### Set the Graphical Parameters as 2x2 ######
par(mfrow = c(2,2))

###### Plot 1: Global Active Power (kilowatts) ######
with(plot4DF,plot(xAxisDays,plot4DF$Global_active_power,ylab="Global Active Power",xlab="",type="l"))

###### Plot 2: Datetime and Voltage ######
with(plot4DF,plot(xAxisDays,plot4DF$Voltage, xlab="datetime", ylab="Voltage",type="l"))

###### Plot 3: Sub metering type line chart ######
plot(xAxisDays, plot4DF$Sub_metering_1, ylab="Energy Sub Metering", xlab="", type="l", col="black")
lines(xAxisDays, plot4DF$Sub_metering_2, type="l", col="red")
lines(xAxisDays, plot4DF$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty="solid", col = c("black", "red", "blue"),bty="n",pt.cex=10,cex=0.3)

###### Plot 4: Global Re-active Power ######
with(plot4DF,plot(xAxisDays,plot4DF$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l"))

###### Copy the plot to a PNG file ######
dev.copy(png,file="figure/plot4.png",width=480,height=480)

###### Close the device ######
dev.off()
