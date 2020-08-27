# Reading the zip file 
data <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header=T, quote="", sep=";", na.strings ="?")

# Select date interval
finalData <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
# Add on time 
SetTime <- strptime(paste(finalData$Date, finalData$Time, sep=" ") , "%d/%m/%Y %H:%M:%S")
# Final set of data
finalData <- cbind(SetTime, finalData)

# Plot 3
png(filename = "Plot3.png", width = 480, height = 480)

plot(finalData$SetTime, as.numeric(finalData$Sub_metering_1),
     col = "black",
     type = "l", 
     xlab = " ", ylab = "Energy Sub Metering") 

points(finalData$SetTime, as.numeric(finalData$Sub_metering_2),
       col = "red",
       type = "l")

lines(finalData$SetTime, as.numeric(finalData$Sub_metering_2),
      col = "red",
      type = "l") 

points(finalData$SetTime, as.numeric(finalData$Sub_metering_3),
       col = "blue",
       type = "l") 

lines(finalData$SetTime, as.numeric(finalData$Sub_metering_3),
       col = "blue",
       type = "l") 

legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty="solid")

dev.off()
