# continue from plot 3

# For plot 4 make the the 4-plot/page
par(mfrow = c(2,2))

#global active power v datetime -- plot 2    
plot(gap$DateTime, gap$Global_active_power, 
    type = "n", xlab = "", 
    ylab = "Global Active Power (kilowatts)")
lines(gap$DateTime, gap$Global_active_power)

# For voltage v Time - new plot
voltage <- select(power1, c(DateTime, Voltage))
voltage$Voltage <- as.numeric(voltage$Voltage)
with(voltage, plot(DateTime, Voltage, xlab = "datetime", type = "n"))
lines(voltage$DateTime, voltage$Voltage)

# For Submetering - plot 3
with(subm, plot(DateTime, c(Sub_metering_1), type = "n", 
                ylab = "Energy sub metering"))
with(subm, lines(DateTime, Sub_metering_1))
with(subm, lines(DateTime, Sub_metering_2, col = "red"))
with(subm, lines(DateTime, Sub_metering_3, col = "blue"))

# make legend
legend("topright", lty = 1, col = c("black","red", "blue"), 
       legend = names(subm)[2:4])


# For grp v Time  - new plot
grp <- select(power1, c(DateTime, Global_reactive_power))
grp$Global_reactive_power <- as.numeric(grp$Global_reactive_power)
with(grp, plot(DateTime, Global_reactive_power, xlab = "datetime",type = "n"))

#save to file
lines(grp$DateTime, grp$Global_reactive_power)
dev.copy(png, file = "plot4.png")
dev.off()
