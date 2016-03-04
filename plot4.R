# reading in data (change this to your own url)
a<-read.csv2("D:/Users/HBOUALI/Desktop/Coursera/household_power_consumption.txt", na.strings = "?",dec = ".")
# subsetting data
b<- subset(a, Date == "1/2/2007" | Date == "2/2/2007")
# set date/time variable
b$times <- as.POSIXlt(paste(as.Date(b$Date, "%d/%m/%Y"),b$Time))
# draw plot 4
png(file = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
# plot topleft
plot(b$times,b$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
# plot topright
plot(b$times,b$Voltage, type="l", xlab= "datetime", ylab = "Voltage", yaxt="n")
axis(2, at = seq(232,246, by=2), c("","234","","238","","242","","246"))
# plot lowleft
plot(b$times, b$Sub_metering_1, col='grey', type='l',ylab="Energy sub metering", xlab = "", lwd=2)
lines(b$times, b$Sub_metering_2, col='red', type='l')
lines(b$times, b$Sub_metering_3, col='blue', type='l')
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1),lwd=c(2.5,2.5),col=c("grey","red","blue"))
# plot lowright
plot(b$times,b$Global_reactive_power, type="l", xlab= "datetime", ylab = "Global_reactive_power")
dev.off()