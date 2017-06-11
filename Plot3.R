dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
extractDates <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
png("plot3.png", width=480, height=480)
Timedate <- strptime(paste(extractDates$Date, extractDates$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(Timedate,as.numeric(extractDates$Sub_metering_1), type="l", xlab="", ylab="Energy sub metering")
lines(Timedate,as.numeric(extractDates$Sub_metering_2),type="l", col="Red")
lines(Timedate,as.numeric(extractDates$Sub_metering_3),type="l",col="Blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
