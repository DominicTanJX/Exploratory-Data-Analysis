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


## Plot 3
with(Subset_data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy Sub Metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


## Saving the plot 3 to png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()