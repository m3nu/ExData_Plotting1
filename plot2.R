# Filter relevant days while preserving header (bash command)
# head -n1 household_power_consumption.txt > household_power_consumption_filtered.txt
# egrep -i "^(1/2/2007|2/2/2007)" household_power_consumption.txt >> household_power_consumption_filtered.txt

src = read.csv('~/Workspace/exdata/household_power_consumption_filtered.txt', sep=";")
src$Date <- as.Date(src$Date, format="%d/%m/%Y")

src$DateTime <- strptime(paste(src$Date, src$Time), format="%Y-%m-%d %H:%M:%S")

png('plot2.png')
plot(src$DateTime, src$Global_active_power, type='l', xlab="", ylab="Global Active Power (kilowatts)")
dev.off()