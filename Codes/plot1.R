# creating relevant data frame
d <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
ds1 <- subset(d, Date == "1/2/2007")
ds2 <- subset(d, Date == "2/2/2007")
ds <- rbind(ds1, ds2)

# Launching a graphics device
png(file = "plot1.png")

# constructing a histogram
hist(ds$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# saving as a PNG file 
dev.off()
