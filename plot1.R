y <- read.csv("household_power_consumption.txt", sep = ";")
t <- y[(y["Date"] == "1/2/2007")|(y["Date"] == "2/2/2007"), ]
rownames(t) <- NULL
gap <- as.numeric(sapply(t$Global_active_power, as.character))
hist(gap, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png,'plot1.png')
dev.off()