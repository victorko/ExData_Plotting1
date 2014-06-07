
# Prepare appropreate data
hpc.full <- fread("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
hpc <- hpc.full[grep("^0?(1|2)/0?2/2007$", Date)]
rm(hpc.full)
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)

# Make a plot
hist(hpc$Global_active_power, 
     xlab="Global Active Power (killowatts)", 
     main="Global Active Power", 
     col="red")

# Copy plot into PNG
dev.copy(png, file = "plot1.png")
dev.off()