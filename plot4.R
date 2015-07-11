
##set working dir have change
setwd('/Users/xiao_lisp/Desktop/document/程序/数据科学课程R programming/')

###read file
power<-read.csv('household_power_consumption.txt',header = TRUE,sep=';',stringsAsFactors = F)

###subset file and transform Date to Date class
power1 <- subset(power,power$Date == '1/2/2007'|power$Date=='2/2/2007')
power1$date1 <- paste(power1$Date,power1$Time,sep=' ')
power1$date1 <- strptime(power1$date1,'%d/%m/%Y %H:%M:%S')

##4th pic
png('plot4.png',width = 480,height = 480,units='px')
par(mfrow = c(2,2))
with(power1,{
    plot(date1,power1$Global_active_power,type = 'l',xlab ='',ylab = 'Globa Active Power')
    plot(date1,power1$Voltage,type = 'l',xlab ='datetime',ylab = 'Voltage')
    with(power1, plot(date1,Sub_metering_1,type = "l",col='black',xlab='',ylab = 'Energy sub metering'))
    with(power1, lines(date1,Sub_metering_2,type = "l",col='red'))
    with(power1, lines(date1,Sub_metering_3,type = "l",col='blue'))
    legend('topright',col = c("black", "red",'blue'), legend = c("Sub_metering_1","Sub_metering_2",'Sub_metering_3'),lty=1, lwd=2.5,bty='o')
    plot(date1,power1$Global_reactive_power,type = 'l',xlab ='datetime',ylab = 'Global_reactive_power')
})
dev.off()