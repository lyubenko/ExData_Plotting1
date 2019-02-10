# this code constructs 4 plots of consumption/voltage usage etc

#read in the data
data<-read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?")

#examine the data
names(data)
head(data)

#subset based on teh dates of interest
dates_of_interest<-c("2007-02-01","2007-02-02")
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data<-data[(data$Date %in% as.Date(dates_of_interest)),]

# ensure data is in the correct format for plotting 
data$xvar<-as.POSIXct(paste(as.character(data$Date), as.character(data$Time)))
data<-data[!(is.na(data$xvar)),]

#set up a 2 by  table
par(mfrow=c(2,2))

# plot of consumption by time
plot(data$xvar, as.numeric(data$Global_active_power), type='l', 
     ylab="Global Active Power (kilowatts)", xlab="")

# plot if voltage by time
plot(data$xvar,data$Voltage, type="l", xlab="datetime", ylab="Voltage")

# plot by sub meters
plot(data$xvar, as.numeric(data$Sub_metering_1), type='l', 
     ylab="Energy sub metering", xlab="")
lines(data$xvar, as.numeric(data$Sub_metering_3), type='l', col="blue")
lines(data$xvar, as.numeric(data$Sub_metering_2), type='l', col="red")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

# plot of reactive power by time 
plot(data$xvar, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

