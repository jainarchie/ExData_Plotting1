##Open the graphics Device
png(filename="Plot2.png",width=480, height=480, units="px")
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
#Plot data
with(Power_data, plot(DateTime, Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab=""))
#close graphic device
dev.off()
