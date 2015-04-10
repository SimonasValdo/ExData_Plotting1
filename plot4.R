y <- read.csv("household_power_consumption.txt", sep = ";")
t <- y[(y["Date"] == "1/2/2007")|(y["Date"] == "2/2/2007"), ]
gap <- as.numeric(sapply(t$Global_active_power, as.character))
rownames(t) <- NULL
t["Date"] <- lapply(t["Date"], as.Date, "%d/%m/%Y")
Sys.setlocale("LC_ALL","C")
datetime <- paste(t$Date, t$Time)
full <- strptime(datetime, "%Y-%m-%d %H:%M:%S")
par(mfcol = c(2, 2))

plot(full, gap, type="l", ylab="Global Active Power (kilowatts)", xlab = "")

plot(full, as.numeric(as.character(t$Sub_metering_1)), type = "n", ylab = "Energy sub metering", xlab = "")
points(full, as.numeric(as.character(t$Sub_metering_1)), col = "black", type ='l')
points(full, as.numeric(as.character(t$Sub_metering_2)), col = "red", type ='l')
points(full, as.numeric(as.character(t$Sub_metering_3)), col = "blue", type ='l')
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1), cex = 0.50, pt.cex = 1, inset=0.1, bty = "n")

vol <- as.numeric(sapply(t$Voltage, as.character))
plot(full, vol, type="l", ylab="Voltage", xlab = "datetime")

grp <- as.numeric(sapply(t$Global_reactive_power, as.character))
plot(full, grp, type="l", ylab = "Global_reactive_power", xlab = "datetime")

dev.copy(png,'plot4.png')
dev.off()