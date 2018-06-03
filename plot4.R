# ingestion
csvFile <- read.csv("household_power_consumption.txt",sep = ";")
csvFile$Date <- as.Date(csvFile$Date,format="%d/%m/%Y")
csvFile$datetime <- strptime(paste(csvFile$Date, csvFile$Time), "%Y-%m-%d %H:%M:%S")
csvFile$Global_active_power <- as.numeric(csvFile$Global_active_power)

# subset data
subsetCsvFile <- subset(csvFile, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
subsetCsvFile$Sub_metering_2 <- as.numeric(subsetCsvFile$Sub_metering_2)
subsetCsvFile$Voltage <- as.numeric(subsetCsvFile$Voltage)
subsetCsvFile$Global_reactive_power <- as.numeric(subsetCsvFile$Global_reactive_power)
subsetCsvFile$Sub_metering_2 <- subsetCsvFile$Sub_metering_2/5

# output
png("plot4.png",height=480,width=480)

par(mfrow = c(2, 2)) 

#1
plot(subsetCsvFile$datetime,subsetCsvFile$Global_active_power/500,typ="l",xlab="",ylab="Global Active Power")
#2
plot(subsetCsvFile$datetime,subsetCsvFile$Voltage/8,typ="l",xlab="datetime",ylab="Voltage")
#3
plot(subsetCsvFile$datetime,subsetCsvFile$Sub_metering_1, type="l",col="black",xlab="",ylab="Energy sub metering")
lines(subsetCsvFile$datetime,subsetCsvFile$Sub_metering_2,col="red")
lines(subsetCsvFile$datetime,subsetCsvFile$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n")
#4
plot(subsetCsvFile$datetime,subsetCsvFile$Global_reactive_power/400,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()

