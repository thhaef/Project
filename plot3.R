# Loading the full dataset
dataset <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

# Subsetting the data
data <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataset)

# Convert the date and time variables
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Creating the Plot 3
with(data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="",
       cex.lab=0.7, cex.axis=0.7, cex.main=0.7, cex.sub=0.7)
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex=0.7, y.intersp = 0.4)

# Copying to a png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()