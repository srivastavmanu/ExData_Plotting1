library(dplyr)
exdata1<- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)

exdata2 <-exdata1

exdata1 < exdata1[ -c(1), ]

names(exdata1)[1] <- c("Date")
names(exdata1)[2] <- c("Time")
names(exdata1)[3] <- c("Global_active_power")
names(exdata1)[4] <- c("Global_reactive_power")
names(exdata1)[5] <- c("Voltage")
names(exdata1)[6] <- c("Global_intensity")
names(exdata1)[7] <- c("Sub_metering_1")
names(exdata1)[8] <- c("Sub_metering_2")
names(exdata1)[9] <- c("Sub_metering_3")

exdata3 <-exdata1
exdata1$Date <- as.Date(exdata1$Date,"%d/%m/%Y")

filterexdata1<- filter(exdata1, Date >="2007-02-01" & Date <= "2007-02-02" )

filterexdata2 <- mutate(filterexdata1, paste(as.character(filterexdata1$Date), filterexdata1$Time, sep = " " ) )

names(filterexdata2)[10] <- c("DateTime")

filterexdata3 <- filterexdata2
filterexdata3$DateTime <- strptime(filterexdata2$DateTime, "%Y-%m-%d %H:%M:%S")

png( file = "plot2.png")

plot(filterexdata3$DateTime, as.numeric(filterexdata1$Global_active_power), type="l", xlab = "", ylab  = "Global Active Power (kilowatts)")

dev.off()