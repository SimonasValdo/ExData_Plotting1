y <- read.csv("household_power_consumption.txt", sep = ";")
t <- y[(y["Date"] == "1/2/2007")|(y["Date"] == "2/2/2007"), ]
gap <- as.numeric(sapply(t$Global_active_power, as.character))
rownames(t) <- NULL
t["Date"] <- lapply(t["Date"], as.Date, "%d/%m/%Y")
Sys.setlocale("LC_ALL","C")
datetime <- paste(t$Date, t$Time)
full <- strptime(datetime, "%Y-%m-%d %H:%M:%S")
plot(full, gap, type="l", ylab="Global Active Power (kilowatts)", xlab = "")
dev.copy(png,'plot2.png')
dev.off()