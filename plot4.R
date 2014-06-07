
# Prepare appropreate data
hpc.full <- fread("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
hpc <- data.frame(hpc.full[grep("^0?(1|2)/0?2/2007$", Date)])
rm(hpc.full)
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
hpc$datetime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")

# Set parameters
par(mfrow = c(2, 2), cex=0.6)

# Make plots
with(hpc, {
    
    # 1
    plot(datetime, Global_active_power, 
         xlab="", 
         ylab="Global Active Power", 
         main="", 
         type="l")
    
    # 2
    plot(datetime, Voltage, 
         main="", 
         type="l")
    
    # 3
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
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           bty="n")
    
    # 4
    plot(datetime, Global_reactive_power, 
         main="", 
         type="l")
})

# Copy plots into PNG
dev.copy(png, file = "plot4.png")
dev.off()