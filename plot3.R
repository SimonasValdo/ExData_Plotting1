y <- read.csv("household_power_consumption.txt", sep = ";")
t <- y[(y["Date"] == "1/2/2007")|(y["Date"] == "2/2/2007"), ]
rownames(t) <- NULL
t["Date"] <- lapply(t["Date"], as.Date, "%d/%m/%Y")
Sys.setlocale("LC_ALL","C")
datetime <- paste(t$Date, t$Time)
full <- strptime(datetime, "%Y-%m-%d %H:%M:%S")

plot(full, as.numeric(as.character(t$Sub_metering_1)), type = "n", ylab = "Energy sub metering", xlab = "")
points(full, as.numeric(as.character(t$Sub_metering_1)), col = "black", type ='l')
points(full, as.numeric(as.character(t$Sub_metering_2)), col = "red", type ='l')
points(full, as.numeric(as.character(t$Sub_metering_3)), col = "blue", type ='l')
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), cex = 0.70, pt.cex = 1, lty = c(1, 1, 1))

dev.copy(png,'plot3.png')
dev.off()