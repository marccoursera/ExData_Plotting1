data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = c("?"))
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"), ]
data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png(file = "plot3.png")

plot(c(data$datetime, data$datetime, data$datetime), c(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3), xlab = "", ylab = "Energy sub metering", type = "n")

lines(data$datetime, data$Sub_metering_1, col = "black")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")

legend("topright", lty = 1, lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
