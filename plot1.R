##load the data and subset just by dates to work with
dta <- subset(read.table('household_power_consumption.txt',na.strings="?", header=T, sep=';'), Date == '1/2/2007' | Date == '2/2/2007')

##initialize graphic device
png('plot1.png')

##plot to graphic device
hist(dta$Global_active_power, col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)')

##close graphic device and save
dev.off()