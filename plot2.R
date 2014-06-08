##load the data and subset just by dates to work with
dta <- subset(read.table('household_power_consumption.txt',na.strings="?", header=T, sep=';'), Date == '1/2/2007' | Date == '2/2/2007')

##convert Date from character to date type
dta$Date <- strptime(dta$Date, "%d/%m/%Y")

##concatenate date and time to create a datetime timestamp
dta$datetime <- as.POSIXct(paste(dta$Date,dta$Time))

##initialize graphic device
png('plot2.png')

##plot to graphic device
with(dta,plot(datetime, Global_active_power, type='l',xlab='',ylab='Global Active Power (kilowatts)'))

##close graphic device and save
dev.off()