setwd("~/Box Sync/Coursera/ExploratoryData/Project1/") #Set working directory
data<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE) #Read in Data
lines <- grep('^[1-2]/2/2007', readLines('household_power_consumption.txt')) #Identify lines within our date range and create a vector of the row numbers we want
subsetData<-data[lines,] #Create the data frame with the targeted dates

#plot1
png(filename="ExData_Plotting1/plot1.png") #Open Device
par(mar=c(4,4,4,4))
hist(as.numeric(subsetData$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off() # Close Device
