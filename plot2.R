# generate plot2 from given inputFile, puts resulting png into outputFile
plot2 <- function(inputFile, outputFile)
{
  d <- read.csv(inputFile, sep=";", na.strings = "?")
  d[[1]] <- as.Date(d[[1]], format="%d/%m/%Y")
  dx <- d[d$Date == as.Date("2007-02-01") | d$Date == as.Date("2007-02-02"),]

  dx$DateTime <- as.POSIXct(paste(dx$Date, dx$Time))
  plot(dx$DateTime, dx$Global_active_power, type="l",ylab="Global Active Power (kilowatts)", xlab="")
  
  dev.copy(png, outputFile, width=504,height=504)
  dev.off()
}