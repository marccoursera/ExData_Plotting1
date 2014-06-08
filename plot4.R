data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = c("?"))
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"), ]
data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png(file = "plot4.png")

par(mfrow = c(2, 2))
with(data, {
	plot(datetime, Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")

	plot(datetime, Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

	plot(c(data$datetime, data$datetime, data$datetime), c(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3), xlab = "", ylab = "Energy sub metering", type = "n")
	lines(data$datetime, data$Sub_metering_1, col = "black")
	lines(data$datetime, data$Sub_metering_2, col = "red")
	lines(data$datetime, data$Sub_metering_3, col = "blue")
	legend("topright", bty = "n", lty = 1, lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

	plot(datetime, Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
})

dev.off()
