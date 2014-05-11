setwd("~/Box Sync/Coursera/ExploratoryData/Project1/") #Set working directory
data<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE) #Read in Data
lines <- grep('^[1-2]/2/2007', readLines('household_power_consumption.txt')) #Identify lines within our date range and create a vector of the row numbers we want
subsetData<-data[lines,] #Create the data frame with the targeted dates

subsetData$datetime<-paste(subsetData$Date,subsetData$Time) #Join Date and Time into new column
subsetData$datetime<-strptime(subsetData$datetime,format="%d/%m/%Y %H:%M:%S") #Convert column to proper format
png(filename="ExData_Plotting1/plot2.png") #Open Device
par(mar=c(4,4,4,4)) #Set Margins
plot(subsetData$datetime,subsetData$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off() #Close Device
