# This graph creates one plot of consumption based on different meters

#load data
data<-read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?")

#examine data
names(data)
head(data)

#subset based on the dates of interest
dates_of_interest<-c("2007-02-01","2007-02-02")
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data<-data[(data$Date %in% as.Date(dates_of_interest)),]

#ensure correct formatting of data
data$xvar<-as.POSIXct(paste(as.character(data$Date), as.character(data$Time)))
data<-data[!(is.na(data$xvar)),]

#plot 
plot(data$xvar, as.numeric(data$Sub_metering_1), type='l', 
     ylab="Energy sub metering", xlab="")
lines(data$xvar, as.numeric(data$Sub_metering_3), type='l', col="blue")
lines(data$xvar, as.numeric(data$Sub_metering_2), type='l', col="red")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))
