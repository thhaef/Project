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

# Creating the Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="",
     cex.lab=0.7, cex.axis=0.7, cex.main=0.7, cex.sub=0.7)

# Copying to a png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()