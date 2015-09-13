dataset <- "household_power_consumption.txt"

data <- read.table(dataset,
                   header=TRUE,
                   sep=";",
                   colClasses=c("character", "character", rep("numeric",7)),
                   na="?")
  
  data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  
  intervaldates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
  data <- subset(data, Date %in% intervaldates)
  #subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
  


#Plot1
  
  png("plot1.png", width=500, height=500)  
  
  hist(data$Global_active_power,
       main="Global Active Power",
       xlab="Global Active Power (kilowatts)",
       ylab="Frequency",
       col="red")
  
  dev.off()


#Plot2

  png("plot2.png", width=500, height=500)
  
  plot(data$Time, data$Global_active_power,
       type="l",
       xlab="",
       ylab="Global Active Power (kilowatts)")
  
  dev.off()



#Plot3
  png("plot3.png", width=500, height=500)
  
  plot(data$Time, 
       data$Sub_metering_1, 
       type="l", 
       col="black",
       xlab="", 
       ylab="Energy sub metering")
  lines(data$Time, data$Sub_metering_2, col="red")
  lines(data$Time, data$Sub_metering_3, col="blue")
  legend("topright",
         col=c("black", "red", "blue"),
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty=1)
  
  dev.off()


#Plot4

png("plot4.png", width=500, height=500)
  
  par(mfrow=c(2,2))
  # 1
  plot(data$Time, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
  # 2
  plot(data$Time, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
  # 3
  plot(data$Time, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
  lines(data$Time, data$Sub_metering_2, col="red")
  lines(data$Time, data$Sub_metering_3, col="blue")
  legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1,box.lwd=0)
  # 4
  plot(data$Time, data$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
  lines(data$Time, data$Global_reactive_power)
  
  dev.off()
  
