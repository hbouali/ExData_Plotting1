# reading in data (change this to your own url)
a<-read.csv2("D:/Users/HBOUALI/Desktop/Coursera/household_power_consumption.txt", na.strings = "?",dec = ".")
# subsetting data
b<- subset(a, Date == "1/2/2007" | Date == "2/2/2007")
# set date/time variable
b$times <- as.POSIXlt(paste(as.Date(b$Date, "%d/%m/%Y"),b$Time))
# draw plot 1
png(file = "plot1.png", width = 480, height = 480)
hist(b$Global_active_power, col= "red", main= "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()