
# load the data
data <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, 
                   stringsAsFactors = FALSE, na.strings = '?')

str(data)

data$DateTime <- paste(data$Date, data$Time)

data$DateTime <- strptime(data$DateTime, format = '%d/%m/%Y %H:%M:%S')

data$Date <- strptime(data$Date, format='%d/%m/%Y')

graphdata <- subset(data, Date %in% c('2007-02-01', '2007-02-02'))

png(file='plot2.png', width = 480, height = 480, units = "px")

with(graphdata, plot(DateTime, Global_active_power, type='l', xlab = "", ylab='Global Active Power (kilowatts)'))

dev.off()