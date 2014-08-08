# creating relevant data frame
d <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
ds1 <- subset(d, Date == "1/2/2007")
ds2 <- subset(d, Date == "2/2/2007")
ds <- rbind(ds1, ds2)

# Concatenating date and time 
ds$Date <- strptime(paste(ds$Date, ds$Time), "%d/%m/%Y %H:%M:%S")

# Launching a graphics device
png(file = "plot3.png")

# Constructing a line graph
plot(ds$Date, ds$Sub_metering_1, type = 'n', ylab = "Energy sub metering", xlab = "")
lines(ds$Date, ds$Sub_metering_1, col = "black")
lines(ds$Date, ds$Sub_metering_2, col = "red")
lines(ds$Date, ds$Sub_metering_3, col = "blue")

# Creating a legend
legend("topright", lwd = 2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       y.intersp = 1)

# Closing the graphics device
dev.off()