##load the data and subset just by dates to work with
dta <- subset(read.table('household_power_consumption.txt',na.strings="?", header=T, sep=';'), Date == '1/2/2007' | Date == '2/2/2007')

##convert Date from character to date type
dta$Date <- strptime(dta$Date, "%d/%m/%Y")

##concatenate date and time to create a datetime timestamp
dta$datetime <- as.POSIXct(paste(dta$Date,dta$Time))

##initialize graphic device
png('plot3.png')

##plot to graphic device
with(dta, plot(datetime,Sub_metering_1, type='l',xlab='',ylab='Energy sub metering'))
with(dta, lines(datetime,Sub_metering_2, type='l',col='red'))
with(dta, lines(datetime,Sub_metering_3, type='l',col='blue'))

##add legend to plot
legend("topright",lty=1,col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

##close graphic device and save
dev.off()