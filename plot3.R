# read the dataset from file
hpc <- read.table("household_power_consumption.txt",skip=1,sep=";")
# specify column names
names(hpc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
# subset data from the 1st and 2nd of Feb 2007
hpcFeb <- subset(hpc,hpc$Date=="1/2/2007" | hpc$Date =="2/2/2007")

# converting the Date and Time variables into Date and POSIXlt classes respectively
hpcFeb$Date <- as.Date(hpcFeb$Date, format="%d/%m/%Y")
hpcFeb$Time <- strptime(hpcFeb$Time, format="%H:%M:%S")
hpcFeb[1:1440,"Time"] <- format(hpcFeb[1:1440,"Time"],"2007-02-01 %H:%M:%S")
hpcFeb[1441:2880,"Time"] <- format(hpcFeb[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# plotting Global Active Power
plot(hpcFeb$Time,hpcFeb$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(hpcFeb,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(hpcFeb,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(hpcFeb,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#save to png file
dev.copy(png, file="plot3.png", width=480, height=480, units = "px")
dev.off()