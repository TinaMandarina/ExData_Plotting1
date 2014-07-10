household_power_consumption <- read.csv("D:/Coursera R/household_power_consumption.txt", sep=";")
household_power_consumption$Date <- as.Date( as.character(household_power_consumption$Date), format="%d/%m/%Y") #Changes the date to the right format

sub1 <- subset(household_power_consumption, Date > as.Date("2007-01-31") )
sub <- subset(sub1, Date < as.Date("2007-02-03") ) #creates a new dataframe with desired time period


sub$Global_active_power <- as.numeric(sub$Global_active_power)
sub$TimeDate <- as.POSIXct(strptime(paste(sub$Date, sub$Time), "%Y-%m-%d %H:%M:%S"))
sub$Sub_metering_1 <- as.numeric(sub$Sub_metering_1)
sub$Sub_metering_2 <- as.numeric(sub$Sub_metering_2)
sub$Sub_metering_3 <- as.numeric(sub$Sub_metering_3)

plot(sub$Sub_metering_1 ~ sub$TimeDate, 
     ylab="Energy sub metering",
     type="n",
     xlab=""
)
lines(sub$Sub_metering_1 ~ sub$TimeDate)
lines(sub$Sub_metering_2 ~ sub$TimeDate, col='Red')
lines(sub$Sub_metering_3 ~ sub$TimeDate, col='Blue')
legend("topright", pch = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.copy(png, file = "plot3.png", width = 480, height = 480, units = "px")