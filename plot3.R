# continuing from plot 2

# get all columns that begin with sub_metering
subm <- select(power1, c(DateTime, starts_with("Sub_metering")))

#convert all the sub metering columns to numeric
subm$Sub_metering_1 = as.numeric(subm$Sub_metering_1)
subm$Sub_metering_2 = as.numeric(subm$Sub_metering_2)
subm$Sub_metering_3 = as.numeric(subm$Sub_metering_3)

# make the plot
with(subm, plot(DateTime, c(Sub_metering_1), 
                type = "n", ylab = "Energy sub metering"))
with(subm, lines(DateTime, Sub_metering_1))
with(subm, lines(DateTime, Sub_metering_2, col = "red"))
with(subm, lines(DateTime, Sub_metering_3, col = "blue"))

# add the legend
legend("topright", lty = 1, col = c("black","red", "blue"), legend = names(subm)[2:4])

# plot to file
dev.copy(png, file = "plot3.png")
dev.off()
