
# Prepare appropreate data
hpc.full <- fread("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
hpc <- data.frame(hpc.full[grep("^0?(1|2)/0?2/2007$", Date)])
rm(hpc.full)
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
hpc$datetime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")

# Make a plot
with(hpc, {
    plot(datetime, Sub_metering_1, 
         xlab="", 
         ylab="Energy sub metering", 
         main="", 
         type="l")
    lines(datetime, Sub_metering_2, 
          col="red")
    lines(datetime, Sub_metering_3, 
          col="blue")
    legend("topright", 
           lty = 1, 
           col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

# Copy plot into PNG
dev.copy(png, file = "plot3.png")
dev.off()