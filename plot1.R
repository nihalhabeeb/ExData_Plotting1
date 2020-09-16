# read the dataset from file
hpc <- read.table("household_power_consumption.txt",skip=1,sep=";")
# specify column names
names(hpc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
# subset data from the 1st and 2nd of Feb 2007
hpcFeb <- subset(hpc,hpc$Date=="1/2/2007" | hpc$Date =="2/2/2007")

# plotting histogram of Global Active Power
hist(as.numeric(as.character(hpcFeb$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

#save to png file
dev.copy(png, file="plot1.png", width=480, height=480, units = "px")
dev.off()