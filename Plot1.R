#Open the graphics Device
png(filename="Plot1.png",width=480, height=480, units="px")
#Fetch data
Power_data = read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
#Convert to date class
Power_data$Date<-as.Date(Power_data$Date, format="%d/%m/%Y")
#subset data 
Power_data = subset(Power_data, Power_data$Date=='2007-02-01'|Power_data$Date=='2007-02-02')
#plot histogram
hist(Power_data$Global_active_power, xlab="Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
#close graphic device
dev.off()
