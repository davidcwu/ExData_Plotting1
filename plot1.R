

if (!file.exists("./data/")) {dir.create("./data/")}
#Read data
plotData <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Get an idea of the data set
names(plotData)
lapply(plotData, class)
head(plotData$Date)
head(plotData$Time)

#Keep only 2 days of data
subSetDates <- plotData[plotData$Date %in% c("1/2/2007", "2/2/2007"), ]
tail(subSetDates)
names(subSetDates)
str(subSetDates)
subSetDates$dateTime <- paste(subSetDates$Date, subSetDates$Time)
head(subSetDates)
dateTime <- strptime(subSetDates$dateTime, "%d/%m/%Y %H:%M:%S")
str(dateTime)
theData <- cbind(dateTime, subSetDates)
str(theData)

#Set PNG file with a width of 480 pixels and a height of 480 pixels.
#Begin plot
png("plot1.png", width = 480, height = 480)
#Plot data
hist(theData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatt)")

#Close plot and find png in the folder.
dev.off()
