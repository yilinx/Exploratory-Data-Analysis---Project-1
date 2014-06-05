# Please download the data and extract the file to a directory.
# place this R script in the same directory the data file is located
# Remember to set to the working directory as the directory both the R script and data file are located

filelocation <- "household_power_consumption.txt"   #file name and location

#Read txt file into variable
datafile <- read.table(filelocation, header=T, sep=";", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")

#change Date column to Date class
datafile$Date <- strptime(datafile$Date,format="%d/%m/%Y")

#Change time column to POSIXlt
datafile2$Time <- paste(as.character(datafile2$Date),datafile2$Time)
datafile2$Time <- strptime(datafile2$Time, format="%Y-%m-%d %H:%M:%S")


startDate <- strptime("2007-02-01",format="%Y-%m-%d")    #Start date
endDate <- strptime("2007-02-02",format="%Y-%m-%d")      #end date
datafile2 <- subset(datafile, Date >= startDate & Date <= endDate)   #select subset based on date
remove(datafile)    #remove the varibale containing original txt file to free up memory space

#export as png file
png("plot3.png")

#plot the line graph
with(data=datafile2, plot(Time,Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(data=datafile2, lines(Time,Sub_metering_1,col="black"))
with(data=datafile2, lines(Time,Sub_metering_2,col="red"))
with(data=datafile2, lines(Time,Sub_metering_3,col="blue"))

#create legend
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#off dev
dev.off()