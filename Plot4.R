##Open the graphics Device
png(filename="Plot4.png",width=480, height=480, units="px")
#Fetch data
Power_data = read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
#Convert to date class
Power_data$Date<-as.Date(Power_data$Date, format="%d/%m/%Y")
#subset data 
Power_data = subset(Power_data, Power_data$Date=='2007-02-01'|Power_data$Date=='2007-02-02')
#Make new column DateTime
a<- paste(Power_data$Date, Power_data$Time, sep=" ")
a<- strptime(a,format="%Y-%m-%d %H:%M:%S")
Power_data$DateTime<- a;
#give plotting conditions as 2 rows and 2 columns
par(mfrow=c(2,2))
#plot graphs
with(Power_data, {plot(DateTime,Global_active_power, xlab = "", ylab ="Global Active Power", type="l" )
                  plot(DateTime,Voltage, xlab = "datetime",ylab ="Voltage", type="l" )
                  plot(Power_data$DateTime, Power_data$Sub_metering_1, type="l", xlab= "", ylab="Energy sub Metering")
                  lines(Power_data$DateTime, Power_data$Sub_metering_2, type="l", col = "red")
                  lines(Power_data$DateTime, Power_data$Sub_metering_3, type="l", col = "blue")
                  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1), bty="n",col = c("black", "red", "blue"))
                  plot(DateTime,Global_reactive_power, xlab = "datetime", ylab ="Global_reactive_power", type="l"  )
}
)
#close graphics device
dev.off()
