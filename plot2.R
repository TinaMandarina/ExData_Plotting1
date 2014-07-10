household_power_consumption <- read.csv("D:/Coursera R/household_power_consumption.txt", sep=";")
household_power_consumption$Date <- as.Date( as.character(household_power_consumption$Date), format="%d/%m/%Y") #Changes the date to the right format

sub1 <- subset(household_power_consumption, Date > as.Date("2007-01-31") )
sub <- subset(sub1, Date < as.Date("2007-02-03") ) #creates a new dataframe with desired time period


sub$Global_active_power <- as.numeric(sub$Global_active_power)
sub$TimeDate <- as.POSIXct(strptime(paste(sub$Date, sub$Time), "%Y-%m-%d %H:%M:%S"))  

plot(sub$Global_active_power ~ sub$TimeDate, 
     ylab="Global active power (kilowatts)",
     type="n",
     xlab=""
)
lines(sub$Global_active_power ~ sub$TimeDate)

dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px")