# creating relevant data frame
d <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
ds1 <- subset(d, Date == "1/2/2007")
ds2 <- subset(d, Date == "2/2/2007")
ds <- rbind(ds1, ds2)

# Concatenating date and time 
ds$Date <- strptime(paste(ds$Date, ds$Time), "%d/%m/%Y %H:%M:%S")

# Launching a graphics device
png(file = "plot4.png")

# Setting up the par()
par(mfcol = c(2,2), mar = c(4, 4.5, 2, 2))

# Constructing the first graph
plot(ds$Date, ds$Global_active_power, type = 'n', ylab = "Global Active Power", xlab = "")
lines(ds$Date, ds$Global_active_power)

# Constructing the second graph 
plot(ds$Date, ds$Sub_metering_1, type = 'n', ylab = "Energy sub metering", xlab = "")
lines(ds$Date, ds$Sub_metering_1, col = "black")
lines(ds$Date, ds$Sub_metering_2, col = "red")
lines(ds$Date, ds$Sub_metering_3, col = "blue")
legend("topright", lwd = 2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       cex = 0.65, bty = "n", y.intersp = 2.5)

# Constructing the third graph
plot(ds$Date, ds$Voltage, type = 'n', ylab = "Voltage", xlab = "datetime")
lines(ds$Date, ds$Voltage)

# Constructing the fourth graph
plot(ds$Date, ds$Global_reactive_power, type = 'n', ylab = "Global_reactive_power", xlab = "datetime")
lines(ds$Date, ds$Global_reactive_power)

# saving as a PNG file 
dev.off()