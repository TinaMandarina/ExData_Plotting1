household_power_consumption <- read.csv("D:/Coursera R/household_power_consumption.txt", sep=";")
household_power_consumption$Date <- as.Date( as.character(household_power_consumption$Date), format="%d/%m/%Y") #Changes the date to the right format

sub1 <- subset(household_power_consumption, Date > as.Date("2007-01-31") )
sub <- subset(sub1, Date < as.Date("2007-02-03") ) #creates a new dataframe with desired time period


sub$Global_active_power <- as.numeric(sub$Global_active_power)

hist(sub$Global_active_power, 
              col='Red', 
              main="Global active power", 
              xlab="Global active power (kilowatts)"
              )

dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")