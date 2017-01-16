
# Get the URL and download the file
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "./data/powerConsuption.zip" )

# read the file into a table
power1 <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE)

# get the needed subset
power1 <- subset(power1, Date == "1/2/2007" | Date == "2/2/2007") 
# the dates appear to be in the format "d/m/yyyy"

# run the histogram plot
hist(as.numeric(power1$Global_active_power), col = "red", xlab = "Global Active Power(kilowatts")

# adjust the color and the x label
hist(as.numeric(power1$Global_active_power), col = "red", xlab = "Global Active Power(kilowatts)", main = "Global Active Power")
hist(as.numeric(power1$Global_active_power), col = "red", xlab = "Global Active Power(kilowatts)", main = "Global Active Power")

# copy the plot to a png file
dev.copy(png, file = "plot1.png")
dev.off()

