library(dplyr)
library(lubridate)
setwd('/Users/xiao_lisp/Desktop/document/程序/')
power<-read.csv('household_power_consumption.txt',header = TRUE,sep=';')
subdate<-c(unclass(as.Date(dmy('01/02/2007'))),unclass(as.Date(dmy('02/02/2007'))))
power1<-power%>%
    mutate(Date=as.Date(Date,'%d/%m/%Y'))%>%
    filter(unclass(Date)==subdate[1]|unclass(Date)==subdate[2])%>%
    mutate(week=wday(Date, label = TRUE, abbr = TRUE))%>%
    mutate(Time=as.character(Time))%>%
    mutate(Date=as.character(Date))%>%
    mutate(Date1=paste(Date,Time,sep=' '))%>%
    mutate(Global_active_power=as.numeric(as.character(Global_active_power)))%>%
    mutate(Voltage=as.numeric(as.character(Voltage)))%>%
    mutate(Global_reactive_power=as.numeric(as.character(Global_reactive_power))

time<-strptime(power1$Date1,'%Y-%m-%d %H:%M:%S')
t<-time-time[1]
png('plot4.png',width = 480,height = 480,units='px')
par(mfrow = c(2,2))
with(power1,{
    plot(t,power1$Global_active_power,type = 'l',xlab ='',ylab = 'Globa Active Power',axes=F)
    axis(2,c(0,2,4,6),c(0,2,4,6))
    axis(side=1,at =c(0,86370,172740),labels = c('Thu','Fri','Sat'))
    plot(t,power1$Voltage,type = 'l',xlab ='datetime',ylab = 'Voltage',axes=F)
    axis(2,c(234,238,242,246),c(234,238,242,246))
    axis(side=1,at =c(0,86370,172740),labels = c('Thu','Fri','Sat'))
    with(power1, plot(t,Sub_metering_1,type = "l",col='black',axes=F,xlab='',ylab = 'Energy sub metering'))
    with(power1, lines(t,Sub_metering_2,type = "l",col='red'))
    with(power1, lines(t,Sub_metering_3,type = "l",col='blue'))
    legend('topright',col = c("black", "red",'blue'), legend = c("Sub_metering_1","Sub_metering_2",'Sub_metering_3'))
    axis(2,c(0,10,20,30),c(0,10,20,30))
    axis(side=1,at =c(0,86370,172740),labels = c('Thu','Fri','Sat'))
    plot(t,power1$Global_reactive_power,type = 'l',xlab ='datetime',ylab = 'Global_reactive_power',axes=F)
    axis(2,c(0.0,0.1,0.2,0.3,0.4,0.5),c(0.0,0.1,0.2,0.3,0.4,0.5))
    axis(side=1,at =c(0,86370,172740),labels = c('Thu','Fri','Sat'))
})
dev.off()