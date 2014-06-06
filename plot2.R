## Read in the power file
power <- read.table("household_power_consumption.txt",sep=";",header = TRUE)

## Convert date and time to readable format

power$ndate <- as.Date(power$Date,"%d/%m/%Y")

## subset just the 2 needed days

twoday <- subset(power, ndate == "2007-02-01" |ndate == "2007-02-02" )

## Now let's fix the time and date together

twoday$datetime <- strptime(paste(twoday$Date,twoday$Time),format = "%d/%m/%Y %H:%M:%S")

## Time to graph
png("plot2.png", width=480, height=480, units="px")

plot(twoday$datetime,as.numeric(as.character(twoday$Global_active_power)),type = "l", main = "Global Active Power",xlab=" ",ylab = "Global Active Power(kilowatts)")

dev.off() 