## Verify and set Working Directory
getwd()

setwd("D:/E_Learn_Course_Data_Science_and_Analytics/Exploratory_Data_Analysis")


## Read the database
Full_database <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                          check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

Full_database$Date <- as.Date(Full_database$Date, format="%d/%m/%Y")


## Subset the data to only the required dates
Subset_data <- subset(Full_database, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(Full_database)


## Convert the dates
datetime <- paste(as.Date(Subset_data$Date), Subset_data$Time)
Subset_data$Datetime <- as.POSIXct(datetime)


## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(Subset_data, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy Sub Metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), cex=.5, pt.cex = 1, lty=1,lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global_Reactive_Power",xlab="")
})



## Saving the plot 4 to png file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()