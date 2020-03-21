
# load the data
data <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, 
                   stringsAsFactors = FALSE, na.strings = '?')

str(data)

data$DateTime <- paste(data$Date, data$Time)

data$DateTime <- strptime(data$DateTime, format = '%d/%m/%Y %H:%M:%S')

data$Date <- strptime(data$Date, format='%d/%m/%Y')

graphdata <- subset(data, Date %in% c('2007-02-01', '2007-02-02'))

png(file='plot3.png', width = 480, height = 480, units = "px")

plot(graphdata$DateTime, graphdata$Sub_metering_1, type='l', col = 1, 
     xlab = "", ylab='Energy sub metering')
lines(graphdata$DateTime, graphdata$Sub_metering_2, type='l', col = 2)
lines(graphdata$DateTime, graphdata$Sub_metering_3, type='l', col = 'blue')

legend('topright', legend = names(graphdata)[7:9], 
              col = c('black', 'red', 'blue'), lty = 1)

dev.off()