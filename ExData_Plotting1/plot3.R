# Coursera: Exploratory data analysis. Project 1:3
#   Data specifics: ; = separator
#                   ? = NA

# read in data; do *not* read in strings as Factors (breaks things later)
data = read.table("household_power_consumption.txt", header=TRUE,
                  sep=";", na.strings="?", stringsAsFactors=FALSE)

# convert date column from DD/MM/YYYY to YYYY-MM-DD
data$Date <- as.Date(data$Date, '%d/%m/%Y')

# subset Data to use only 2007-02-01 and 2007-02-02 dates
data.sub <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

# create dateTime column, format: YYYY-MM-DD HH:MM:SS
data.sub$dateTime <- strptime( paste(data.sub$Date, data.sub$Time), '%Y-%m-%d %H:%M:%S')

#initialise plot3.png as a png, 480x480
png(file='plot3.png', width = 480, height = 480)
  with(data.sub, 
       plot(dateTime, Sub_metering_1, type='l', ylab='Energy sum metering', xlab='')
       points(dateTime, Sub_metering_2, col='red', type='l')
       points(dateTime, Sub_metering_3, col='blue', type='l')
       legend("topright", lty=1, 
              col = c("black","blue", "red"), 
              legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
              )
       )

dev.off()
