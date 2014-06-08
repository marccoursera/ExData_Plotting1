data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = c("?"))
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"), ]
data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png(file = "plot2.png")

plot(data$datetime, data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

dev.off()
