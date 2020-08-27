# Reading the zip file 
data <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header=T, quote="", sep=";", na.strings ="?")

# Select date interval
finalData <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
# Add on time 
SetTime <- strptime(paste(finalData$Date, finalData$Time, sep=" ") , "%d/%m/%Y %H:%M:%S")
# Final set of data
finalData <- cbind(SetTime, finalData)

# Plot 2
png(filename = "Plot2.png", width = 480, height = 480)

plot(finalData$SetTime,as.numeric(finalData$Global_active_power), 
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = " ")

dev.off()
