
# load the data
data <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, 
                   stringsAsFactors = FALSE, na.strings = '?')

str(data)

data$Date <- strptime(data$Date, format = '%d/%m/%Y')

graphdata <- subset(data, Date %in% c('2007-02-01', '2007-02-02'))


png(file='plot1.png', width = 480, height = 480, units = "px")

with(graphdata, hist(Global_active_power, col = 'red', main = 'Global Active Power'))

dev.off()