
##set working dir change
setwd('/Users/xiao_lisp/Desktop/document/程序/数据科学课程R programming/')

###read file
power<-read.csv('household_power_consumption.txt',header = TRUE,sep=';',stringsAsFactors = F)

###subset file and transform Date to Date class
power1 <- subset(power,power$Date == '1/2/2007'|power$Date=='2/2/2007')
power1$date1 <- paste(power1$Date,power1$Time,sep=' ')
power1$date1 <- strptime(power1$date1,'%d/%m/%Y %H:%M:%S')

###plot 2th graph
png('plot2.png',width = 480,height = 480,units='px')
plot(power1$date1,as.numeric(power1$Global_active_power),ylab = 'Globa Active Power(kilowatts)',xlab = '',type='l')
dev.off()
