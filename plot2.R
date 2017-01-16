# continuing from plot 1

#we will need the dplyr library
library(dplyr)

# convert the date and time into one date/time column
power1$DateTime <- strptime(paste(power1$Date, power1$Time), 
                            format = "%d/%m/%Y %H:%M:%S")

# get the global active power and the date time data
gap <- select(power1, c((as.numeric(Global_active_power, na.rm = TRUE)), DateTime))

# plot global active power v datetime
plot(gap$DateTime, gap$Global_active_power, type = "n", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
lines(gap$DateTime, gap$Global_active_power)

#output to the proper file
dev.copy(png, file = "plot2.png")
dev.off()