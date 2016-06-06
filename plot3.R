

if (!file.exists("./data/")) {dir.create("./data/")}
#Read data set
plotData <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Keep only 2 days of data
subSetDates <- plotData[plotData$Date %in% c("1/2/2007", "2/2/2007"), ]

subSetDates$dateTime <- paste(subSetDates$Date, subSetDates$Time)

dateTime <- strptime(subSetDates$dateTime, "%d/%m/%Y %H:%M:%S")
str(dateTime)
theData <- cbind(dateTime, subSetDates)
str(theData)

#Begin plotting
#Set PNG file with a width of 480 pixels and a height of 480 pixels.
png("plot3.png", width = 480, height = 480)
#Plot data
submeter <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
colorLines <- c("black", "red", "blue")
plot(dateTime, theData$Sub_metering_1, type = "l", col = colorLines[1], main = "", ylab = "Energy sub metering", xlab = "")
lines(dateTime, theData$Sub_metering_2, type = "l", col = colorLines[2])
lines(dateTime, theData$Sub_metering_3, type = "l", col = colorLines[3])
legend("topright", legend = submeter, col = colorLines, lty = "solid")

#Close plot and find in folder.
dev.off()
