# Please download the data and extract the file to a directory.
# place this R script in the same directory the data file is located
# Remember to set to the working directory as the directory both the R script and data file are located

filelocation <- "household_power_consumption.txt"   #file name and location

#Read txt file into variable
datafile <- read.table(filelocation, header=T, sep=";", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")

#change Date column to Date class
datafile$Date <- strptime(datafile$Date,format="%d/%m/%Y")

startDate <- strptime("2007-02-01",format="%Y-%m-%d")    #Start date
endDate <- strptime("2007-02-02",format="%Y-%m-%d")      #end date
datafile2 <- subset(datafile, Date >= startDate & Date <= endDate)   #select subset based on date
remove(datafile)    #remove the varibale containing original txt file to free up memory space

#export as png file
png("plot1.png")

#plot the histogram
with(data=datafile2, hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))

#off dev
dev.off()