# ingestion
csvFile <- read.csv("household_power_consumption.txt",sep = ";")
csvFile$Date <- as.Date(csvFile$Date,format="%d/%m/%Y")
csvFile$datetime <- strptime(paste(csvFile$Date, csvFile$Time), "%Y-%m-%d %H:%M:%S")
csvFile$Global_active_power <- as.numeric(csvFile$Global_active_power)

# subset data
subsetCsvFile <- subset(csvFile, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
subsetCsvFile$Sub_metering_2 <- as.numeric(subsetCsvFile$Sub_metering_2)
subsetCsvFile$Sub_metering_2 <- subsetCsvFile$Sub_metering_2/5

# output
png("plot3.png",height=480,width=480)
plot(subsetCsvFile$datetime,subsetCsvFile$Sub_metering_1, type="l",col="black",xlab="",ylab="Energy sub metering")
lines(subsetCsvFile$datetime,subsetCsvFile$Sub_metering_2,col="red")
lines(subsetCsvFile$datetime,subsetCsvFile$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

