# reading in data (change this to your own url)
a<-read.csv2("D:/Users/HBOUALI/Desktop/Coursera/household_power_consumption.txt", na.strings = "?",dec = ".")
# subsetting data
b<- subset(a, Date == "1/2/2007" | Date == "2/2/2007")
# set date/time variable
b$times <- as.POSIXlt(paste(as.Date(b$Date, "%d/%m/%Y"),b$Time))
# draw plot 3
png(file = "plot3.png", width = 480, height = 480)
plot(b$times, b$Sub_metering_1, col='grey', type='l',ylab="Energy sub metering", xlab = "", lwd=2)
lines(b$times, b$Sub_metering_2, col='red', type='l')
lines(b$times, b$Sub_metering_3, col='blue', type='l')
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1),lwd=c(2.5,2.5),col=c("grey","red","blue"))
dev.off()