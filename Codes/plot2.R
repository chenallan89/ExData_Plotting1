# creating relevant data frame
d <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
ds1 <- subset(d, Date == "1/2/2007")
ds2 <- subset(d, Date == "2/2/2007")
ds <- rbind(ds1, ds2)

# Concatenating date and time 
ds$Date <- strptime(paste(ds$Date, ds$Time), "%d/%m/%Y %H:%M:%S")

# Launching a graphics device
png(file = "plot2.png")

# Constructing a line graph
plot(ds$Date, ds$Global_active_power, type = 'n', ylab = "Global Active Power (Kilowatts)", xlab = "")
lines(ds$Date, ds$Global_active_power)

# saving as a PNG file 
dev.off()