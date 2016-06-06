

if (!file.exists("./data/")) {dir.create("./data/")}
#Read data set.
plotData <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Keep only 2 days of data.
subSetDates <- plotData[plotData$Date %in% c("1/2/2007", "2/2/2007"), ]

subSetDates$dateTime <- paste(subSetDates$Date, subSetDates$Time)

dateTime <- strptime(subSetDates$dateTime, "%d/%m/%Y %H:%M:%S")
str(dateTime)
theData <- cbind(dateTime, subSetDates)
str(theData)

#Begin plotting
submeter <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
colorLines <- c("black", "red", "blue")
#Set PNG file with a width of 480 pixels and a height of 480 pixels.
png("plot4.png", width = 480, height = 480)
#Plot data

#Identify order of the 4 plots.
par(mfrow = c(2, 2))
#Plot1
plot(dateTime, theData$Global_active_power, type = "l", col = "black", main = "", ylab = "Global Active Power", xlab = "")
#Plot2
plot(dateTime, theData$Voltage, type = "l", col = "black", main = "", ylab = "Voltage", xlab = "datetime")
#Plot3
plot(dateTime, theData$Sub_metering_1, type = "l", col = colorLines[1], main = "", ylab = "Energy sub metering", xlab = "")
lines(dateTime, theData$Sub_metering_2, type = "l", col = colorLines[2])
lines(dateTime, theData$Sub_metering_3, type = "l", col = colorLines[3])
legend("topright", legend = submeter, col = colorLines, lty = "solid", bty = "n")
#Plot4
plot(dateTime, theData$Global_reactive_power, type = "l", col = "black", main = "", ylab = "Global_reactive_power", xlab = "datetime")

#Close plot and find in folder.
dev.off()


