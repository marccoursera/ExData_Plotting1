data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = c("?"))
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"), ]

png(file = "plot1.png")

hist(data$Global_active_power, col = "red", breaks = 12, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.off()
