data<-read.table("household_power_consumption.txt", sep=";", header=TRUE, as.is=TRUE)
data$datetime<-strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
mydata<-subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
png(file = "plot2.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
plot(mydata$datetime, as.numeric(mydata$Global_active_power), type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(mydata$datetime, as.numeric(mydata$Global_active_power), type="l")
dev.off()
