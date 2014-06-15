# Filter relevant days while preserving header (bash command)
# head -n1 household_power_consumption.txt > household_power_consumption_filtered.txt
# egrep -i "^(1/2/2007|2/2/2007)" household_power_consumption.txt >> household_power_consumption_filtered.txt

src = read.csv('~/Workspace/exdata/household_power_consumption_filtered.txt', sep=";")
src$Date <- as.Date(src$Date, format="%d/%m/%Y")

src$DateTime <- strptime(paste(src$Date, src$Time), format="%Y-%m-%d %H:%M:%S")

par(mfrow = c(2, 2))

plot(src$DateTime, src$Global_active_power, type='l', xlab="", ylab="Global Active Power (kilowatts)")

plot(src$DateTime, src$Voltage, type='l', xlab="datetime", ylab="Voltage")

plot(src$DateTime, src$Sub_metering_1, type='l', xlab="", ylab="Energy sub metering")
lines(src$DateTime, src$Sub_metering_2, col='red')
lines(src$DateTime, src$Sub_metering_3, col='blue')
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1), # gives the legend appropriate symbols (lines)
       lwd=c(2.5,2.5), col=c("black", "blue","red"))

plot(src$DateTime, src$Global_active_power, type='l', xlab="datetime", ylab="Global_Reactive_Power")