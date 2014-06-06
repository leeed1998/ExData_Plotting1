## Read in the power file
power <- read.table("household_power_consumption.txt",sep=";",header = TRUE)

## Convert date and time to readable format

power$ndate <- as.Date(power$Date,"%d/%m/%Y")

## subset just the 2 needed days

twoday <- subset(power, ndate == "2007-02-01" |ndate == "2007-02-02" )

## Now let's fix the time and date together

twoday$datetime <- strptime(paste(twoday$Date,twoday$Time),format = "%d/%m/%Y %H:%M:%S")

## Time to graph
png("plot4.png", width=480, height=480, units="px")

par(mfrow = c(2,2))
with (twoday, {
 plot(datetime, as.numeric(as.character(Global_active_power)), type = "l", main = "",ylab="Global Active Power",xlab = "")
 plot(datetime, as.numeric(as.character(Voltage)), type = "l", main = "",ylab="Voltage")
 plot(twoday$datetime,as.numeric(as.character(twoday$Sub_metering_1)), col = "black", type = "l", main = "",xlab=" ",ylab = "Energy sub metering")
	lines(twoday$datetime,as.numeric(as.character(twoday$Sub_metering_2)), col = "red")
	lines(twoday$datetime,as.numeric(as.character(twoday$Sub_metering_3)), col = "blue")
	legend("topright",lty=1,col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
 plot(datetime, as.numeric(as.character(Global_reactive_power)), type = "l", main = "",ylab = "Global_reactive_power")
})

dev.off() 