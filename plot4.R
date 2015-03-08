data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors = FALSE)
dataSubset <- subset(data,Date=="1/2/2007"| Date=="2/2/2007")
dataSubset$DateTime <- strptime(paste(dataSubset$Date,dataSubset$Time),format="%d/%m/%Y %H:%M:%S")

par(mfcol = c(2,2))

# Top left
with(dataSubset,plot(DateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power"))

# Bottom left
with(dataSubset,plot(DateTime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(dataSubset,points(DateTime,Sub_metering_2,type="l",col="red"))
with(dataSubset,points(DateTime,Sub_metering_3,type="l",col="blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

# Top right
with(dataSubset,plot(DateTime,Voltage,type="l",xlab="datetime",ylab="Voltage"))

# Bottom right
with(dataSubset,plot(DateTime,Global_reactive_power,type="l",xlab="datetime"))


dev.copy(png,height=480,width=480,file="plot4.png")
dev.off()
