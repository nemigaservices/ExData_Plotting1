hist(dtt$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
png(filename = paste(current.dir, "/plot1.png", sep=""), width=480, height = 480)
hist(dtt$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
