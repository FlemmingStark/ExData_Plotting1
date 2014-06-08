##load the data and subset just by dates to work with
dta <- subset(read.table('household_power_consumption.txt',na.strings="?", header=T, sep=';'), Date == '1/2/2007' | Date == '2/2/2007')

##convert Date from character to date type
dta$Date <- strptime(dta$Date, "%d/%m/%Y")

##concatenate date and time to create a datetime timestamp
dta$datetime <- as.POSIXct(paste(dta$Date,dta$Time))

##initialize graphic device
png('plot4.png')

##set a 2 X 2 grid for 4 plots
par(mfrow=c(2,2))

##plot 1
with(dta,plot(datetime, Global_active_power, type='l',xlab='',ylab='Global Active Power'))

##plot 2
with(dta,plot(datetime, Voltage, type='l',xlab='datetime',ylab='Voltage'))

##plot 3
with(dta, plot(datetime,Sub_metering_1, type='l',xlab='',ylab='Energy sub metering'))
with(dta, lines(datetime,Sub_metering_2, type='l',col='red'))
with(dta, lines(datetime,Sub_metering_3, type='l',col='blue'))
legend("topright",lty=1,col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

##plot 4
with(dta,plot(datetime, Global_reactive_power, type='l',xlab='datetime',ylab='Global_reactive_power'))

##close device and save
dev.off()