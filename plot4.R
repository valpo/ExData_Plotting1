# generate plot4 from given inputFile, puts resulting png into outputFile
plot4 <- function(inputFile, outputFile)
{
  d <- read.csv(inputFile, sep=";", na.strings = "?")
  d[[1]] <- as.Date(d[[1]], format="%d/%m/%Y")
  dx <- d[d$Date == as.Date("2007-02-01") | d$Date == as.Date("2007-02-02"),]
  dx$DateTime <- as.POSIXct(paste(dx$Date, dx$Time))
  
  png(outputFile, width=480, height=480)
  
  par(mfrow=c(2,2))
  
  plot(dx$DateTime, dx$Global_active_power, type="l",ylab="Global Active Power", xlab="")
  plot(dx$DateTime, dx$Voltage, type="l",ylab="Voltage",xlab="datetime")
  
  plot(dx$DateTime, dx$Sub_metering_1, type="l",xlab="",ylab="Energy sub metering")
  lines(dx$DateTime, dx$Sub_metering_2, type="l", col="red")
  lines(dx$DateTime, dx$Sub_metering_3, type="l", col="blue")
  legend(x="topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,
         col=c("black","red","blue"), box.lwd=0)
  
  plot(dx$DateTime, dx$Global_reactive_power, type="l", 
       ylab="Global_reactive_power", xlab="datetime")
  
  dev.off()
}