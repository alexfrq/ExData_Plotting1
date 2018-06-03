# ingestion
csvFile <- read.csv("household_power_consumption.txt",sep = ";")
csvFile$Date <- as.Date(csvFile$Date,format="%d/%m/%Y")
csvFile$datetime <- strptime(paste(csvFile$Date, csvFile$Time), "%Y-%m-%d %H:%M:%S")
csvFile$Global_active_power <- as.numeric(csvFile$Global_active_power)

# subset data
subsetCsvFile <- subset(csvFile, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# output
png("plot1.png",height=480,width=480)
hist(subsetCsvFile$Global_active_power/500,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()

