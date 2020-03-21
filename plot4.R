
# load the data
data <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, 
                   stringsAsFactors = FALSE, na.strings = '?')

str(data)

data$DateTime <- paste(data$Date, data$Time)

data$DateTime <- strptime(data$DateTime, format = '%d/%m/%Y %H:%M:%S')

data$Date <- strptime(data$Date, format='%d/%m/%Y')

graphdata <- subset(data, Date %in% c('2007-02-01', '2007-02-02'))

png(file='plot4.png', width = 480, height = 480, units = "px")

par(mfrow = c(2,2))
#subplot 1

plot(graphdata$DateTime, graphdata$Global_active_power, type = 'l', 
     xlab = "", ylab = 'Global Active Power')


#subplot 2

plot(graphdata$DateTime, graphdata$Voltage, type = 'l', 
     xlab = 'datetime', ylab = "Voltage")

#subplot 3
plot(graphdata$DateTime, graphdata$Sub_metering_1, type='l', col = 1, 
     xlab = "", ylab='Energy sub metering')
lines(graphdata$DateTime, graphdata$Sub_metering_2, type='l', col = 2)
lines(graphdata$DateTime, graphdata$Sub_metering_3, type='l', col = 'blue')

legend('topright', legend = names(graphdata)[7:9], 
              col = c('black', 'red', 'blue'), lty = 1)

#subplot 4

with(graphdata, plot(DateTime, Global_reactive_power, type = 'l', xlab = 'datetime'))


dev.off()