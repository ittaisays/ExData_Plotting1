setwd("~/Box Sync/Coursera/ExploratoryData/ExData_Plotting1/") #Set working directory
data<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";") #Read in Data
lines <- grep('^[1-2]/2/2007', readLines('household_power_consumption.txt')) #Identify lines within our date range and create a vector of the row numbers we want
subsetData<-data[lines,] #Create the data frame with the targeted dates
subsetData$datetime<-paste(subsetData$Date,subsetData$Time) #Join Date and Time into new column
subsetData$datetime<-strptime(subsetData$datetime,format="%d/%m/%Y %H:%M:%S") #Convert column to proper format
png(filename="plot3.png") #Open Device
par(mar=c(4,4,4,4)) #Set Margins
plot(subsetData$datetime,subsetData$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
lines(subsetData$datetime,subsetData$Sub_metering_1)
lines(subsetData$datetime,subsetData$Sub_metering_2,col="red")
lines(subsetData$datetime,subsetData$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),cex = 0.95, lty=1)
dev.off()
