# generate plot1 from given inputFile, puts resulting png into outputFile
plot1 <- function(inputFile, outputFile)
{
  d <- read.csv(inputFile, sep=";", na.strings = "?")
  d[[1]] <- as.Date(d[[1]], format="%d/%m/%Y")
  dx <- d[d$Date == as.Date("2007-02-01") | d$Date == as.Date("2007-02-02"),]
  
  x <- dx[,c("Global_active_power")]
  y <- cut(x, seq(0,8,0.5))
  z <- table(y)

  b <- barplot(z,space=0,col=c("red"),main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", xaxt = 'n')
  axis(side=1,at=c(0,4,8,12),labels=c(0,2,4,6))
  
  dev.copy(png, outputFile, width=504,height=504)
  dev.off()
}