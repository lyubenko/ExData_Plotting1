# this code constructs a line graph for Global Active Power based on time

#read data
data<-read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?")

#xamine data
names(data)
head(data)

#suubset to account for the dates of interest
dates_of_interest<-c("2007-02-01","2007-02-02")
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data<-data[(data$Date %in% as.Date(dates_of_interest)),]

#ensure correct formatting for grphing 
data$xvar<-as.POSIXct(paste(as.character(data$Date), as.character(data$Time)))
data<-data[!(is.na(data$xvar)),]

#graph 
plot(data$xvar, as.numeric(data$Global_active_power), type='l', 
     ylab="Global Active Power (kilowatts)", xlab="")
