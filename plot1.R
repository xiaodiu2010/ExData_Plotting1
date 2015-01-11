library(dplyr)
library(lubridate)
setwd('/Users/xiao_lisp/Desktop/document/程序/')
power<-read.csv('household_power_consumption.txt',header = TRUE,sep=';')
subdate<-c(unclass(as.Date(dmy('01/02/2007'))),unclass(as.Date(dmy('02/02/2007'))))
power1<-power%>%
        mutate(Date=as.Date(Date,'%d/%m/%Y'))%>%
        filter(unclass(Date)==subdate[1]|unclass(Date)==subdate[2])%>%
        mutate(week=wday(Date, label = TRUE, abbr = TRUE))%>%
        mutate(Time=as.character(Time))
png('plot1.png',width = 480,height = 480,units='px')
hist(as.numeric(as.character(power1$Global_active_power)),col='red',xlab = 'Glocal Active Power (kilowatts)',main='Global Active Power')
dev.off()