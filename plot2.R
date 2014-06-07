
# Prepare appropreate data
hpc.full <- fread("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
hpc <- data.frame(hpc.full[grep("^0?(1|2)/0?2/2007$", Date)])
rm(hpc.full)
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
hpc$datetime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")

# Make a plot
with(hpc, plot(datetime, Global_active_power, 
               xlab="", 
               ylab="Global Active Power (killowatts)", 
               main="", 
               type="l"))

# Copy plot into PNG
dev.copy(png, file = "plot2.png")
dev.off()