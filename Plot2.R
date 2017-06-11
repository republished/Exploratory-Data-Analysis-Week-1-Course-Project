dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
extractDates <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
png("plot2.png", width=480, height=480)
Timedate <- strptime(paste(extractDates$Date, extractDates$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(Timedate ,as.numeric(extractDates$Global_active_power),type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
