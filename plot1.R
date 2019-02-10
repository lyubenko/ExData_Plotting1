# This code constructs a histogram of Global Active Power in Kilowatts

#read in the data
data<-read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?")

#examine the data
names(data)
head(data)

#subset based on the dates specified in teh assignment 
dates_of_interest<-c("2007-02-01","2007-02-02")
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data$Date<-as.character(data$Date)
data<-data[(data$Date %in% dates_of_interest),]

# ensure data is in the correct format
data$Global_active_power<-as.numeric(as.character(data$Global_active_power))

#plot only one figure
par(mfrow=c(1,1))

# construct histogram 
hist(data$Global_active_power, xlab="Global Active Power (killowatts)",
     ylab="Frequency", main="Global ActivePower", col="red")
