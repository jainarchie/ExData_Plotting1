##Open the graphics Device
png(filename="Plot3.png",width=480, height=480, units="px")
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
#Make plot
plot(Power_data$DateTime, Power_data$Sub_metering_1, type="l", xlab= "", ylab="Energy sub Metering")
#Add lines to plot
lines(Power_data$DateTime, Power_data$Sub_metering_2, type="l", col = "red")
lines(Power_data$DateTime, Power_data$Sub_metering_3, type="l", col = "blue")
#add legend
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1), col = c("black", "red", "blue"))
#clode graphic device
dev.off()
