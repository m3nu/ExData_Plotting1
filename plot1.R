# Filter relevant days while preserving header (bash command)
# head -n1 household_power_consumption.txt > household_power_consumption_filtered.txt
# egrep -i "^(1/2/2007|2/2/2007)" household_power_consumption.txt >> household_power_consumption_filtered.txt

src = read.csv('~/Workspace/exdata/household_power_consumption_filtered.txt', sep=";")
src$Date <- as.Date(src$Date, format="%d/%m/%Y")

png('plot1.png')
hist(src$Global_active_power, col='red', xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()