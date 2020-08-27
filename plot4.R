# Reading the zip file 
data <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header=T, quote="", sep=";", na.strings ="?")

# Select date interval
finalData <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
# Add on time 
SetTime <- strptime(paste(finalData$Date, finalData$Time, sep=" ") , "%d/%m/%Y %H:%M:%S")
# Final set of data
finalData <- cbind(SetTime, finalData)

# Plot 4
png(filename = "Plot4.png", width = 480, height = 480)

op <- par(mfrow = c(2, 2))  # Divided the screen in 2 rows x 2 columns

plot(finalData$SetTime,finalData$Global_active_power, 
     ylab = "Global Active Power",
     xlab = " ",
     col = "black",
     type = "l")

plot(finalData$SetTime,finalData$Voltage,
     ylab = "Voltage",
     xlab ="Datetime",
     col = "black",
     type = "l" )

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

plot(finalData$SetTime, finalData$Global_reactive_power,
     ylab = "Global Reactive Power",
     xlab ="Datetime",
     col = "black",
     type = "l")

dev.off()

