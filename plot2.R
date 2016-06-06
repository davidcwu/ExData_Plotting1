

if (!file.exists("./data/")) {dir.create("./data/")}
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
png("plot2.png", width = 480, height = 480)
#Plot data
plot(dateTime, theData$Global_active_power, type = "l", col = "black", main = "", ylab = "Global Active Power (in kilowatts)", xlab = "")

#Close plot and find png in folder.
dev.off()
